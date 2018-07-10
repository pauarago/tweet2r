\name{tweet2r}
\alias{tweet2r}
\title{ Set up parameters to file streaming and store tweets in a JSON file using Twitter Streaming API .}

\description{Configuration of the start stop for retrieving tweets, also set up the search by bounding box or by key words, number of tweets retrieved (stored in a collection of JSON files) and set up of the file prefix to store the JSON files created during the connection to the to Twitter Streaming API.\code{tweet2r} Don't opens a connection to Twitter's Streaming API by himself but you can configure the tweeter connection as is described in \link{streamR} that will return public statuses that match your keywords or bounding box definition. It is very useful to set up start time and end time of the connection. Note that the end time will be delayed depending on the time needed to close the file for the number of tweets set up.
}

\usage{
  tweet2r(t_start,t_end, ntweets=NULL,keywords=NULL, bbox=NULL, fileprefix,
          consumerKey,consumerSecret,requestURL,accessURL,authURL)
}

\arguments{
  \item{t_start}{Configuration of the start time to retrieve tweets. It use the \link{strptime} function }

  \item{t_end}{Configuration of the end time to stop retrieving tweets. It use the \link{strptime} function }

 \item{ntweets}{Number of tweets retrieved per file. The stream connection remains open, but the tweets are being stared in the files each time arrives to number of tweets configured. Nevertheless the number of tweets retrieved could be less, that depends on twitter API)}

  \item{keywords}{Vector with the keywords used to retrieve tweets. More information in twitter developers web \url{https://dev.twitter.com/streaming/overview/request-parameters}}

   \item{bbox}{Vector with the bounding box coordinates from which you want to retrieve tweets. You will retrieve geotagged tweets as well as tweets from users that has in his profile this area as a residence \url{https://dev.twitter.com/streaming/overview/request-parameters}}

 \item{fileprefix}{Fileprefix for the JSON file where the tweets will be stored. Avoid number at the begging this will be confusing for SQL database}
 \item{consumerKey}{Twitter API consumer key \url{https://dev.twitter.com/oauth}}
 \item{consumerSecret}{Twitter API consumer secret \url{https://dev.twitter.com/oauth}}
 \item{requestURL}{Twitter API url to request data \url{https://dev.twitter.com}}
 \item{accessURL}{Twitter API url to access \url{https://dev.twitter.com}}
 \item{authURL}{Twitter API authentification \url{https://dev.twitter.com}} 

}

\note{There is a API configuration by default, therefore it is not mandatory to configure a tweeter API's connection. Nevertheless this default connection could be overload sometimes or a user could prefer to use its own connection. The procedure is well described in \link{streamR} package}


\examples{

\dontrun{

	#Configuration fo twitter API connection
  #this could be avoid and use the default configuration 
	requestURL <- "https://api.twitter.com/oauth/request_token"
	accessURL <- "https://api.twitter.com/oauth/access_token"
	authURL <- "https://api.twitter.com/oauth/authorize"
	consumerKey <- sys.getenv("consumer_key")
	consumerSecret <- sys.getenv("consumer_secret")

	#definition of the start time and end time
	t_start<-"2015-09-11 9:45:00"
	t_end<-"2015-09-11 23:59:59"

	#definition of the file prefix
	fileprefix="tweets"
	key=c("keyword1", "keyword2")
  
  	#definition number of tweets per file
 	 number=3000

	#running the function
	tweet2r(t_start=t_start,t_end=t_end,ntweets=number,keywords=key,fileprefix = fileprefix,
		requestURL,accessURL,authURL,consumerKey,consumerSecret)

	#running the function using bbox
	#set up a bbox
	bbox=c(-0.1644,39.8485,0.6916,40.0034)

	tweet2r(t_start=t_start,t_end=t_end,ntweets=number,bbox=bbox,fileprefix = fileprefix,
		requestURL,accessURL,authURL,consumerKey,consumerSecret)
	}
}

\author{
  Pau Aragó Galindo \email{parago@uji.es}
}

\seealso{
  \code{\link{tweet2r},\link{parseTweets},\link{streamR}}
}

