#' @export
#' @import streamR sp

t2SpatialPointDataFrame<-function(tweets){
  
  #remove rows with NA in lat lon columns
  tweets<-tweets[complete.cases(tweets[,"lon"]),]
  
  #get the coordinates from tweets        
  coordinates<-cbind(tweets$lon, tweets$lat)
  
  
  #create a spatial data frame
  geotweets<-SpatialPointsDataFrame(coords=coordinates,
                                         data=tweets, 
                                         proj4string=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"))
  
  #write output message
  message("SpatialPointDataFrame created with geolocated tweets, with a CRS EPSG:4326")
  
  return(geotweets)
}

