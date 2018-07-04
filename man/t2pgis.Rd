\name{t2pgis}
\alias{t2pgis}
\title{Set up parameters to JSON parsing and export it to a postGIS database.}

\description{This function parse the JSON files (as is defined in \link{streamR} package). Once is parsed export it to a database format the timestamp column and creates to tables one with all the tweets and other only with geotagged tweets.}

\usage{
  t2pgis(fileprefix, con, path = ".", pattern = ".json$")
}

\arguments{
  \item{fileprefix}{Setup file prefix for JSON files. If tweets have been retrieved with the \code{\link{tweet2r}} function it should be the same. Te file        prefix is used to create the table name and the geotagged table which  has geo as a prefix (example "geofileprefix")}

  \item{con}{postGIS connection parameters. For more information look at RPostgreSQL}
  
  \item{path}{
  A character vector to folder. see ?list.files()
  }
  
  \item{pattern}{
  Limits possible file extensions, optional as regular expression. see ?list.files()
  }
}


\note{It is mandatory to configure the connection to the database. The procedure is well described at RPostgreSQL package}


\examples{

\dontrun{

#create a postgres connection
connection <- con <- dbConnect(PostgreSQL(), host="urls host",port=5432, 
                    user="user", password="assword", dbname="pgistweets")
fileprefix="tweets"

t2pgis(fileprefix, connection)

	}
}

\author{
  Pau Aragó Galindo \email{parago@uji.es}
}

\seealso{
  \code{RPostgreSQL}, \code{\link{streamR}}
}

