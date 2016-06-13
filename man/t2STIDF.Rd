\name{t2STIDF}
\alias{t2STIDF}

\title{
Create objects of class STIDF
}
\description{
Creates an object of class STIDF from geotweets. A class for unstructured spatio-temporal data; for n spatial locations and times, n observations are available .
}
\usage{
t2STIDF(geotweets)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{geotweets}{Geotagged tweets as a SpatialPointsDataFrame.}
}

\value{
 \item{sttweets }{A STDIF object.}

}
\references{
Pebesma, Edzer. «Spacetime: Spatio-Temporal Data in R». Journal of Statistical Software 51, n.º 7 (2012). doi:10.18637/jss.v051.i07.\url{https://www.jstatsoft.org/article/view/v051i07}

}
\author{
Pau Aragó
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{spacetime}, \code{\link{tweet2r}}

}
\examples{
\dontrun{
#Create STDIF object
t2STIDF(geotweets)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{spacetime}
