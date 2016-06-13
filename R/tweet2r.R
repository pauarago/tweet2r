#' @export
#' @import ROAuth streamR

tweet2r<-function(t_start,t_end, ntweets=NULL,keywords=NULL, bbox=NULL, fileprefix, 
                  consumerKey="0nr4dr2Wryblj7LrnHRCDR8ZB",
                  consumerSecret="H43loxZbyzt2V0okwio14IhyX2UVwXQvfMfcZ1AKNyqf87qeQh",
                  requestURL="https://api.twitter.com/oauth/request_token",
                  accessURL="https://api.twitter.com/oauth/access_token",
                  authURL="https://api.twitter.com/oauth/authorize"){
 


   #------building variables with imputs
  
  #start time
  t_start<-paste(t_start, "CET", sep=" ")
  t_start<-strptime(t_start,"%Y-%m-%d %H:%M:%S")
  
  #stop time
  t_end<-paste(t_end, "CET", sep=" ")
  t_end<-strptime(t_end,"%Y-%m-%d %H:%M:%S")
  
  #-----checking input errors 
  
  #initialize error
  error=FALSE
  
  #check start and end format
  if (is.na(t_start)==TRUE){
   error=TRUE
   warning("Error:Invalid end time format")
  }
  if(is.na(t_start)==TRUE){
    error=TRUE
    warning("Error:Invalid t_start time format")
  }
  
  #check start time minor than end time
  if(is.na(t_start<t_end)==TRUE){
    error=TRUE
    warning("Error:t_start time stamp should be minor than t_end time stamp ")
  }
  
  #if number of tweets is null the put 3000 by defoult
  if( is.null(ntweets)==TRUE){
    ntweets=3000
    message("Number of tweets retrievet per file by default is 3000")
  }
  
  #check if there is a prefix for files
  if( is.null(fileprefix)==TRUE){
    warning("write a prefix for the output files name")
  }
  
  #check keywords and bbox are both null
  if( is.null(keywords)==TRUE & is.null(bbox)==TRUE){
    warning("You should specify keywords or bbox to retrieve tweets")
  }
  
  #check keywords and bbox ar both not null 
  #if number of tweets is null the put 3000 by defoult
  if( is.null(keywords)==FALSE & is.null(bbox)==FALSE){
    warning("define keywords or bbox not both at the same time")
  }
  
  
  #lets go 
  
  #connecting to twitter API
  my_oauth <- OAuthFactory$new(consumerKey=consumerKey,
                               consumerSecret=consumerSecret, requestURL=requestURL,
                               accessURL=accessURL, authURL=authURL)
  my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

  
  #------------defin the start tiem and the end time to get the tweets------
  
  #define start time
  t_start<-strptime(paste(t_start,"CET"),"%Y-%m-%d %H:%M:%S")
  
  #define end time for the loop
  t_end<-as.list(strptime(paste(t_end,"CET"),"%Y-%m-%d %H:%M:%S"))
  
  
  #get current time as a list
  current<-as.list(Sys.time())
  
  #-----------keep system waiting until the start time--------
  
  #keep waiting until the start time
  while (current<t_start){
    current<-as.list(Sys.time())
  }
  
  #print the start time
  starttime<-paste("start time",Sys.time())
  
  
  #--------capture tweets using a loop----------------------------
  
  #Capture tweets by bbox
  if(is.null(bbox)==FALSE){
    x<-0
    
    #loop to capturing tweets
    #counter initialization
    x<-0
    while (current<t_end)
    {
      #definition of the file name
      #paste is useful to concatenate strings, 
      #argument sep to define character to be used between strings
      b=paste(fileprefix,x,".json", sep="")
      
      #open the file stream and tweets retreaving
      #tweets= define the number of tweets per file
      filterStream( file.name=b,
                    locations=bbox, 
                    tweets=ntweets , oauth=my_oauth )
      current<-as.list(Sys.time())
      #update the counter
      x<- x+1;
    }
  }
  
  #captrure tweets by keyword
  if(is.null(keywords)==FALSE){
    #loop to capturing tweets
    #counter initialization
    x<-0

    while (current<t_end)
    {
      #definition of the file name
      #paste is useful to concatenate strings, 
      #argument sep to define character to be used between strings
      k=paste(fileprefix,x,".json", sep="")
      
      #open the file stream and tweets retreaving
      #tweets= define the number of tweets per file
      filterStream( file.name=k,
                    track=keywords, 
                    tweets=ntweets , oauth=my_oauth )
      current<-as.list(Sys.time())
      #update the counter
      x<- x+1;
    }
  }
  
  
  endtime<-paste("end time",Sys.time())
  message(paste(starttime , endtime, "JSON files stored in", getwd(), sep=" "))
  
  return(message("end of tweets streaming"))
}









