\name{t2summary}
\alias{t2summary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Summary from retrieved tweets
}
\description{
Summary and graphical output from the tweets retrieved with the \code{\link{tweet2r}} package. The function performs a  short description numerical and graphical.
}
\usage{
t2summary(tweets, geotweets)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tweets}{
Data frame with the tweets retrieved with \code{\link{tweet2r}}
}
  \item{geotweets}{
Spatial data frame with the geotweets retrieved with \code{\link{tweet2r}}
}
}


\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{summt}{Number of tweets (geo and non geo) as 'ntweets', number of tweets with geotag as 'ngeotweets', number of tweets whit no geotag as diftweets, percentage of geotweets as 'pergeotweets'}
\item{mapt}{Tweets' location Map}
\item{ghour}{Plot of the number of tweets distributed by hour (UTC +000)}
\item{gweekday}{Plot of the number of tweets distributed by days of the week (UTC +000)}
%% ...
}

\author{
Pau Aragó Galindo
}


\seealso{
\code{\link{tweet2r}},\code{\link{t2sqlite}},\code{\link{t2pgis}}
}
\examples{

\dontrun{

t2summary(tweets, geotweets)

#get summary description
summary
}


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ summary }
\keyword{ tweets }
