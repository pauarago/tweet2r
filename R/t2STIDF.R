#' @export
#' @import spacetime sp

t2STIDF<-function(geotweets){
  #get local configuration and save
  lct<-Sys.getlocale("LC_TIME")
  #change language
  Sys.setlocale("LC_TIME", "C")
  
  #get time as data.frame
  ttime<-as.POSIXct(strptime(geotweets@data$created_at, "%a %b %d %H:%M:%S %z %Y", tz = "UTC"), tz = "UTC")
  
  #back to previsous langue setting
  Sys.setlocale("LC_TIME", lct)
  
  #get only points with no data
  spgeotweets<-SpatialPoints(geotweets@coords, proj4string =geotweets@proj4string)
  
  #build STIDF object
  sttweets<-STIDF(spgeotweets, ttime, data=geotweets@data)
  
  #write output message
  message("A STIDF object has been build from imput geotweets")
  
  return(sttweets)
  
}


