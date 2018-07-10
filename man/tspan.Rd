\name{tspan}
\alias{tspan}

\title{
Exploratory point pattern analysis.
}
\description{
This function is design to provide an exploratory point pattern analysis. Is base on  \code{\link{spatstat}} package a to do a basic point pattern analysis of Homogeneous an Inhomogeneous Poisson.
}
\usage{
tspan(geotweets,bw, cont, acontour)
}

\arguments{
  \item{geotweets}{Geotagged tweets as a SpatialPointsDataFrame or a SpatialPointsDataFrame.}
  \item{bw}{Bandwith for Kernel Smoothed Intensity. Note that if you are using directly geotweets coming from \code{\link{tweet2r}} and \code{\link{t2SpatialPointDataFrame}} units are degrees.}
  \item{cont}{FALSE by default, geotweets bounding box provide the contour. If TRUE a contour must be provided}
  \item{acontour}{Optional. A Spatial object with a defined bbox.}
}
\details{
In order to do a wider point pattern analysis is better to use directly the \code{\link{spatstat}} package
}
\value{

  \item{tweetspphp}{Simpliest Object of class "ppp" representing a point pattern dataset in the two-dimensional plane with no marks, (\code{\link{ppp}})}
  \item{hp}{Homogeneous Poisson fitted point process model to an observed point pattern (\code{\link{ppm}}).}
  \item{ihp}{Inhomogeneous Poisson fitted point process model to an observed point pattern (\code{\link{ppm}}).}
  \item{int}{Computed kernel smoothed intensity function from a point pattern. (\code{\link{density.ppp}}).}

}
\references{
Baddeley, Adrian, y Rolf Turner. «Spatstat: An R Package for Analyzing Spatial Point Patterns». Journal of Statistical Software 12, n.º 6 (2005). doi:10.18637/jss.v012.i06. \url{http://www.jstatsoft.org/v12/i06/}

}
\author{
Pau Aragó
}

\seealso{
\code{\link{spatstat}}
}
\examples{
library(sp)
library(spatstat)

#loada a SpatialPointsDataFrame
data("meuse.grid_ll")


# run function without contour
tspan(meuse.grid_ll,bw=0.0005)

#providing a contour as SpatialPointDataFrame
data("meuse.area")

#build the acontour layer 
cont<-SpatialPoints(meuse.area, proj4string = CRS("+init=epsg:28992"))
#transform to meuse.grid_ll reference system
cont<-spTransform(cont, CRS("+init=epsg:4326"))

# run function with contour
tspan(meuse.grid_ll,bw=0.0005, cont = TRUE, acontour=cont)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ point pattern }

