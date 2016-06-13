\name{t2SpatialPointDataFrame}
\alias{t2SpatialPointDataFrame}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Extract geotagged tweets stored as a data.frame
%%  ~~function to do ... ~~
}
\description{
A function to create a \code{\link{SpatialPointsDataFrame}} with only the tweets with lat lon columns filled. Not all the tweets are geotagged. Tweets should be subset from the original \code{data.frame} to get only tweets with coordinates.
}
\usage{
t2SpatialPointDataFrame(tweets)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tweets}{A \code{\link{data.frame}} with tweets.
}
}
\details{
Tweets \code{data.frame} can be created with the function \code{\link{t2DataFrame}}
}
\value{
 \item{geotweets}{Return geotagged tweets as a \code{\link{SpatialPointsDataFrame}}.}
}

\author{
  Pau Aragó Galindo \email{parago@uji.es}
}

\seealso{
  \code{\link{tweet2r}, \link{t2DataFrame}, \link{sp}}
}

\examples{

\dontrun{

  #tweets data.frame
  tweets="tweets"
  
  #function to extract only geotagged tweets a SpatialPointsDataFrame
  geotweets<-t2SpatialPointDataFrame(tweets)
  }
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ parse }
\keyword{ data.frame }
\keyword{ tweets }
