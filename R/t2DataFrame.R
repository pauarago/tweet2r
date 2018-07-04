#' @export
#' @import streamR

t2DataFrame <- function(fileprefix, path = ".", pattern = ".json$"){
  
  #list all the files of the folder and get the total number of files
  files <- list.files(path, pattern, full.names = TRUE)
  files <- files[grep(fileprefix, basename(files))]
  
  #--------parse tweets using a loop to append next files to database table--------------#
  tweets=NULL
  for(filename in files) { 
    
    # ------1) parse the JSON files
    #parse tweets and create a data frame
    tweetsjson <- parseTweets(filename, simplify = FALSE, verbose = TRUE)
    
    #remove bad character before import it to database
    tweetsjson$text<-gsub("[^[:alnum:]///' ]","", tweetsjson$text)

    #add tweets to object
    tweets=rbind(tweets, tweetsjson)
    
  }
  
  message(paste("Tweets imported as data frame", sep=" ")) 
  
  return(tweets)
}


