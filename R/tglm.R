#' @export
#' @import plyr stats

tglm<-function(tweets,countby="hour",family="poisson"){
  #------------------------------------------------------
  #Get crated_at as a a time stamp to work properly with it
  
  #change locale time language to avoid problems with posix
  
  #get local configuration and save
  lct<-Sys.getlocale("LC_TIME")
  #change language
  Sys.setlocale("LC_TIME", "C")
  
  #format convert column to timestamp
  list_time<-as.POSIXct(strptime(tweets$created_at, "%a %b %d %H:%M:%S %z %Y", tz = "UTC"), tz = "UTC")
  
  
  #back to previsous langue setting
  Sys.setlocale("LC_TIME", lct)
  
  subcol=NULL
    switch(countby,list_time,
          #count by day
          day={
             #Separete the timestamp day
             day=strftime(list_time, "%d")
             
             #add column with time
             newt=cbind(tweets,subcol=day)
             
             #cont number of tweets per weekday
             cday<-count(day)
             #set column names
             colnames(cday)<-c("day", "tweets")
             
            #rename
            countout=cday
            
            followers=NULL
            favourites=NULL
            for(i in 1:nrow(countout)){
              
              #subset data to get values
              countsubset=subset(newt,subcol %in% countout[i,1])
              
              #sum retweets
              followers_count=sum(countsubset$followers_count)
              ## add retweets
              followers=rbind(followers, followers_count)
              
              
              #sum favourites
              favourites_count=sum(countsubset$favourites_count)
              # add favourites
              favourites=rbind(favourites, favourites_count)
            } 
            
            #add favourites and followers
            #countout=cbind(countout, favourites, followers)
           },
           
         #count by
         weekday={
           #Separete the timestamp day
           weekday=strftime(list_time, "%a")
           
           #add column with time
           newt=cbind(tweets,subcol=weekday)
           
           #cont number of tweets per weekday
           cweekday<-count(weekday)
           #set column names
           colnames(cweekday)<-c("weekday", "tweets")
           #glm
           #tglm<-glm(cweekday[,2]~cweekday[,1],family=family)
           countout=cweekday
           
           followers=NULL
           favourites=NULL
           for(i in 1:nrow(countout)){
             
             #subset data to get values
             countsubset=subset(newt,subcol %in% countout[i,1])
             
             #sum retweets
             followers_count=sum(countsubset$followers_count)
             ## add retweets
             followers=rbind(followers, followers_count)
             
             
             #sum favourites
             favourites_count=sum(countsubset$favourites_count)
             # add favourites
             favourites=rbind(favourites, favourites_count)
           } 
           
           #add favourites and followers
           #countout=cbind(countout, favourites, followers)
         },
         
         #count by 
         hour={
           #Separete the timestamp by hour
           hour=strftime(list_time, "%H")
           #add column with time
           newt=cbind(tweets,subcol=hour)
           
           #cont number of tweets per weekday
           chour<-count(hour)
           #set column names
           colnames(chour)<-c("hour", "tweets")
           #glm
           #tglm<-glm(chour[,2]~chour[,1],family=family)
           countout=chour
           
           followers=NULL
           favourites=NULL
           for(i in 1:nrow(countout)){
             
             #subset data to get values
             countsubset=subset(newt,subcol %in% countout[i,1])
             
             #sum retweets
             followers_count=sum(countsubset$followers_count)
             ## add retweets
             followers=rbind(followers, followers_count)
             
             
             #sum favourites
             favourites_count=sum(countsubset$favourites_count)
             # add favourites
             favourites=rbind(favourites, favourites_count)
           } 
           
           #add favourites and followers
           #countout=cbind(countout, favourites, followers)
         }
         
         )
  
  x=as.vector(as.matrix(countout[1]))
  y=as.vector(as.matrix(countout[2]))
  
  tglm<-glm(as.integer(x)~y+favourites+followers ,family=family)
  
  message(paste("GLM computed for tweets, count by ",countby, sep=""))
  
---
  
  
  return(list(tglm=tglm,countout=countout))

  }

