\name{tsubset}
\alias{tsubset}

\title{
Subset points from  geotweets or SaptialPointsDataFrame
}
\description{
This function do a subset  points over a polygon defined by a SpatialPolygonsDataFrame. Takes the points within the Polygon and remove the points outside it.
}
\usage{
tsubset(geotweets, pbox, transform=TRUE)
}

\arguments{
 \item{geotweets}{input Geotagged tweets as a SpatialPointsDataFrame.}
 \item{pbox}{A SpatialPolygonsDataFrame to get the points over it.}
 \item{transform}{Option TRUE by default to transform the pbox CRS (Coordinate Reference System) to geotweets CRS.}
}


\author{
Pau Aragó
}

\examples{
\dontrun{
tweetsSubset<-tsubset(geotweets, pbox)
}
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ subset }

