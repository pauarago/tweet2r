#' @export

valjson <- function(fileprefix, path = ".", pattern = ".json$"){
  
  #list all the files of the folder and get the total number of files
  files <- list.files(path, pattern, full.names = TRUE)
  files <- files[grep(fileprefix, files)]
  
  #initilitze loop counter
  counter=0
  #initialize number of deleted files
  del_files=0
  
  for(filename in files) { 
  
    #get the file size
    file.info(filename)$size
    
    #delete the file if it has no tweets (size<1024 kb)
    if(file.info(filename)$size<1024){
      #update counter
      counter=counter+1
      del_files=del_files+1
      #remove file with no tweets
      file.remove(filename)
    }
  } 
  
  return (paste("Number of files deleted:",del_files, sep=" "))

}

  



