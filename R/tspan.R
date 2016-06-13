#' @export
#' @import sp spatstat sp splancs

tspan<-function(geotweets,bw, cont=FALSE, acontour){

  if(cont==FALSE){
    message("working window is the input geotweets bounding box.")
    
    #working with ppp to do an exploratory spatial analysis
    
    #------------------------------------------
    #build working window from  geotweets bbox
    #------------------------------------------
    
    #build owin object
    twin<-owin(c(geotweets@bbox[1,]),c(geotweets@bbox[2,])) 
    
    #-------------------------------------------
    #  point pattern model
    #-------------------------------------------
    poly=as.points(geotweets@bbox)
    tweetsppp<-ppp(x = geotweets@coords[,1], y=geotweets@coords[,2], window = twin)
    
    #Homogeneous Poisson
    hp<-ppm(tweetsppp,~1, Poisson())
    
    
    #Inhomogeneous Poisson
    ihp=ppm(tweetsppp,~x+y, Poisson())
    
    #---------------------------------------------
    #  Kernel Smoothed Intensity of Point Pattern
    #---------------------------------------------
    
    int<-density.ppp(tweetsppp,sigma=bw)
    
    
  }else{
    
    message("working window is the input SpatialPolygonDataFrame bounding box.")
    
    #working with ppp to do an exploratory spatial analysis
    
    #------------------------------------------
    #build working window from  geotweets bbox
    #------------------------------------------
    
    #build owin object
    twin<-owin(c(acontour@bbox[1,]),c(acontour@bbox[2,])) 
    
    #-------------------------------------------
    #  point pattern model
    #-------------------------------------------
    poly=as.points(geotweets@bbox)
    tweetsppp<-ppp(x = geotweets@coords[,1], y=geotweets@coords[,2], window = twin)
    
    #Homogeneous Poisson
    hp<-ppm(tweetsppp,~1, Poisson())
    
    
    #Inhomogeneous Poisson
    ihp=ppm(tweetsppp,~x+y, Poisson())
    
    #---------------------------------------------
    #  Kernel Smoothed Intensity of Point Pattern
    #---------------------------------------------
    
    int<-density.ppp(tweetsppp,sigma=bw)
  }
  return(list(tweetsppp=tweetsppp, hp=hp,ihp=ihp, int=int))
}


