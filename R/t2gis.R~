#' @export
#' @import streamR rgdal sp RSQLite


t2gis<-function(dbname, export){
#name of geo table
geotable=paste("geo", dbname, sep="")

#opena database connection
con <- dbConnect(SQLite(), dbname)

#import the geo tweets

         #import geocoded tweets
         assign(geotable, dbReadTable(con, geotable))

        #get the coordinates         
        coordinates<-cbind(eval(parse(text=paste(geotable,"[,'lon']", sep=""))),eval(parse(text=paste(geotable,"[,'lat']", sep=""))))
         
         #create a spatial data frame
         assign(geotable,SpatialPointsDataFrame(coords=coordinates,
                                                data=eval(parse(text=geotable)), 
                                                proj4string=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")))
         
         #write output message
         message(paste("Imported files as", geotable, "SpatialPointDataFrame", sep=" "))

  switch(export,
         #case export as shp
         shp={
<<<<<<< HEAD
           writeOGR(eval(parse(text=geotable)), "." , geotable, driver="ESRI Shapefile")
           
           msg2=paste("exported file as ", geotable, ".shp in folder", getwd(), sep="" )
=======
           writeOGR(eval(parse(text=geotable)), "." , "geotable", driver="ESRI Shapefile")
           
           msg2=paste("exported file as ", geotable, ".shp", ,"infolder", getwd(), sep="" )
>>>>>>> 83a8854085371685fe41789cf47f5838072391c0
         },
         #case export as a gml
         gml={
           writeOGR(eval(parse(text=geotable)),paste(geotable, ".gml", sep="") ,"geotable", driver="GML")
           
<<<<<<< HEAD
           msg2=paste("exported fils as ", geotable, ".gml in folder", getwd(), sep="" )
=======
           msg2=paste("exported fils as ", geotable, ".gml","infolder", getwd(), sep="" )
>>>>>>> 83a8854085371685fe41789cf47f5838072391c0
         },
         #case export as a kml
         kml={
           writeOGR(eval(parse(text=geotable)),paste(geotable, ".kml", sep="") ,"geotable", driver="KML")
           
<<<<<<< HEAD
           msg2=paste("exported file as ", geotable, ".kml in folder", getwd(), sep="" )
=======
           msg2=paste("exported file as ", geotable, ".kml", ,"infolder", getwd(), sep="" )
>>>>>>> 83a8854085371685fe41789cf47f5838072391c0
         },
         no={
           msg2="no exported file"
         }
  )

  #change name of the output tweets
  cname<-paste("geotweets=geo", dbname, sep="")
  eval(parse(text=cname))
  
  #rename to pass the checkpackage
  geotweets=geotweets

  #close connection with sqlite
  dbDisconnect(con)
  
  message(msg2)
  

   
  return(geotweets)

}


