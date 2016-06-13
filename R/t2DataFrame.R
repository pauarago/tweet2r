#' @export
#' @import streamR

t2DataFrame<-function(fileprefix){
  
  #list all the files of the folder and get the total number of files
  files <- list.files(pattern = ".json")
  num_files<-length(files)
  
  #--------parse tweets using a loop to append next files to database table--------------#
  tweets=NULL
  for(i in 1:num_files) { 
    
    # ------1) parse the JSON files
    #get the files names
    filename=paste(fileprefix,i-1,".json", sep="")
    
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


