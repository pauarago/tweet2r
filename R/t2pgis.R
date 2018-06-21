#' @export
#' @import RPostgreSQL rgdal

t2pgis <- function(fileprefix, con, path = ".", pattern = ".json$"){
  #loading required packagies
  #    library(RPostgreSQL)
  #    library(rgdal)
  
  #list all the files of the folder and get the total number of files
  files <- list.files(path, pattern, full.names = TRUE)
  files <- files[grep(fileprefix, basename(files))]
  
  #--------parse tweets using a loop and populatae the database table--------------#
  for(filename in files) { 
    
    # ------1) parse the JSON files
    #parse tweets and create a data frame
    tweets <- parseTweets(filename, simplify = FALSE, verbose = TRUE)
    
    #remove bad character before import it to postgres
    tweets$text<-gsub("[^[:alnum:]///' ]","", tweets$text)
    
    #------2) populate table with tweets
    dbWriteTable(con, fileprefix ,tweets,overwrite=FALSE, append=TRUE)
    
  }
 
  #add id_column as a primary key
  dbSendQuery(con,paste("ALTER TABLE", fileprefix, "ADD COLUMN int_id BIGSERIAL PRIMARY KEY;"))
  
  #transform to postgres timestamp format created_at column
  dbSendQuery(con, 
              paste("ALTER TABLE", fileprefix,"ADD t_trans TIMESTAMP WITH TIME ZONE;
              UPDATE", fileprefix, "SET t_trans=created_at::TIMESTAMP WITH TIME ZONE;
              ALTER TABLE", fileprefix, "drop created_at;
              ALTER TABLE ", fileprefix, " rename t_trans TO created_at;"))
  
  #add geometry column and populate it base on lon lat columns
  dbSendQuery(con,
              paste("SELECT AddGeometryColumn ('",fileprefix,"','geom',4326,'POINT',2);
              UPDATE ", fileprefix, " SET geom = ST_SetSRID(ST_MakePoint(lon,lat),4326);", sep=""))
  
  #create view with only with tweets with geo location
  dbSendQuery(con,
              paste("CREATE VIEW geo",fileprefix," AS
                SELECT * 
                FROM ", fileprefix, " 
                WHERE geom is not null", sep=""))
  
  #close connection with postgres
  postgresqlCloseConnection(con)
  
  message(paste("tweets exported to postGIS as", fileprefix ,"tablen name", sep=" "))
  
  return()
}


