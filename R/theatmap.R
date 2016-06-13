#' @export
#' @import sp ggmap

#fucntion to plot a tweet's heat map
theatmap<-function(geotweets,vpoints=FALSE){
  
  heatm1<-get_map(location=geotweets@bbox,zoom =14, color="bw")
  
  #silly NULLS to pas chekcpackage
  lat=NULL
  lon=NULL
  ..level..=NULL
  if(vpoints==FALSE){
    theatmap<-ggmap(heatm1, extend="device",legend = 'topleft')+
                    stat_density2d(aes(fill = ..level.., alpha = ..level..)
                                   , data = geotweets@data,geom = "polygon")+
                    scale_fill_gradient('Tweets density') + #name of the legend
                    scale_alpha(range = c(0.1,.5), guide = FALSE) #alpha escale overlay density scales
      
    
    
  }else{
    theatmap<-ggmap(heatm1, extend="device",legend = 'topleft')+
                    stat_density2d(aes(fill = ..level.., alpha = ..level..)
                                    , data = geotweets@data,geom = "polygon")+
                    scale_fill_gradient('Tweets density') + #name of the legend
                    scale_alpha(range = c(0.1,.5), guide = FALSE)+ #alpha escale overlay density scales
                    geom_point(aes(lon, lat), data = geotweets@data)#plot points
      
  }  
 message("Heat map done!")
 return(theatmap)
}

