\name{t2gis}
\alias{t2gis}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Export Tweeter with geotag in Sqlite table to KML, shapefiles or GML}
\description{
This functions import geotagged tweets as SpatialPointDataFrame from a Sqlite database containing the tweets and export it in a GIS format
}
\usage{
t2gis(dbname, export)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dbname}{
It is the Sqlite Database name where the tweets are stored. Sqlite is embedded in R within the package \code{RSQLite}. Sqlite database have no field extension. More information about \href{https://www.sqlite.org/}{Sqlite} it its web page.
  }
  
  \item{export}{
Export the tweets stored in the sqlite database to shape file, GML or KML. It imports only the geotagged tweets. The options are; shp (by default option), kml, gml. Note that only will be exported if there are geotweets.
  }
}
  

\seealso{
\code{RSQLite},
\code{t2sqlite}
}

\examples{

\dontrun{

#File prefix name for json files and also the name of the database
dbname=tweets
#export option to a GIS format
export="shp"

t2sqlite(dbname, export)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ sqlite }
\keyword{ shp }
\keyword{ GML }
\keyword{ kML }
\keyword{ tweeter}

\author{
Pau Aragó Galindo \email{parago@uji.es}
}

