#' @export
#' @import sp rgdal maptools

tsubset<-function(geotweets, pbox, transform=TRUE){
  if(transform==TRUE){
    
    #transfor to EPSG:4326
    pbox<-spTransform(pbox,geotweets@proj4string)
    
    #set column inout with value= 1
    #build a vector same lenght of input polygons
    inout<-c(rep_len(1, length(pbox@polygons)))
    #build spatial dataframe desited columninout
    pbox<-SpatialPolygonsDataFrame(as.SpatialPolygons.PolygonsList(pbox@polygons, 
                                                                   proj4string=geotweets@proj4string),
                             data=as.data.frame(inout), match.ID = FALSE)
                             
    
    #subset tweets using a polygon
    #get coordinates inside and outside bbox
    inout<-over(geotweets, pbox)
    
    #create new SpatialPointDataFrame with inout column
    wtweets<-spCbind(geotweets,inout)
    
    #remove points outside bbox
    sgeotweets<-subset(wtweets, wtweets@data$inout==1)
    
    #remove inout column
    sgeotweets<-sgeotweets[,!names(sgeotweets) %in% "inout"]
  }else{
    #subset tweets using a polygon
    #get coordinates inside and outside bbox
    #get points out bbox
    inout<-over(geotweets, pbox)
    
    #create new SpatialPointDataFrame with inout column
    wtweets<-spCbind(geotweets,inout)
    
    #remove NA (points outside bbox)
    sgeotweets<-subset(wtweets, wtweets@data$inout==1)
    
    #remove inout column
    sgeotweets<-sgeotweets[,!names(sgeotweets) %in% "inout"]
  }
  message("Subset points only within the input polygon as a SpatialPointDataFrame")
 return(sgeotweets)
} 
