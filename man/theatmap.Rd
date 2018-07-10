\name{theatmap}
\alias{theatmap}

\title{Plot a heat map from geotweets or SpatialPointsDataFrame}
\description{
Plot a heat maps base o 2d density estimation
}
\usage{
theatmap(geotweets, vpoints=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{geotweets}{Geotagged tweets as a SpatialPointsDataFrame or a SpatialPointsDataFrame.}
  
  \item{vpoints}{By default FALSE. TRUE option will plot tweets points over the density map.}
}
\details{
This function is base on \code{\link{ggmap}}. It is a fast way to plot a density map, actually it can work with any SpatialPointsDataFrame. To customize your output, more information is available in the \code{\link{ggmap}} documentation page \url{https://cran.r-project.org/package=ggmap}
}


\author{
Pau Arago
}
\note{
It works only with small region if you have tweets for all over the world it won't work properly. To get a subsample of the geotweets for a specific region use \code{\link{tsubset}}.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{tsubset}}, \code{\link{tweet2r}}, \code{\link{ggmap}}
}
\examples{
\dontrun{
theatmap(geotweets)
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ heat map }

