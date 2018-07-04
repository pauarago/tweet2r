\name{t2sqlite}
\alias{t2sqlite}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Export TweeterJSON files to sqlite database and import to R as a Data Frame}
\description{
Export Json files retrieved with \code{\link{tweet2r}} to a Sqlite database and import tweets as a Data Frame.
}
\usage{
t2sqlite(fileprefix, import, path = ".", pattern = ".json$")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fileprefix}{
Setup file prefix for JSON files. If tweets have been retrieved with the \code{\link{tweet2r}} function, it should be the same name. The file prefix is used to create the table name and the geotagged table which will have geo as a prefix (example "geofileprefix")n. By default the database file will be save in the working directory with no file extension name. Sqlite is embedded in R within the package \code{RSQLite}. More information about \href{https://www.sqlite.org/}{Sqlite} it its web page.
  }

  \item{import}{
TRUE to import the tweets stored in the Sqlite database to R. It can be imported as a data frame with all the tweets retrieved with the function \code{\link{tweet2r}}. FALSE to not import as Data Frame
  }
  
  \item{path}{
  A character vector to folder. see ?list.files()
  }
  
  \item{pattern}{
  Limits possible file extensions, optional as regular expression. see ?list.files()
  }
}
  

\seealso{
\code{RSQLite},
\code{\link{tweet2r}},
\code{\link{valjson}}
}

\examples{

\dontrun{

#File prefix name for json files and also the name of the database
fileprefix=tweets

t2sqlite(fileprefix, import, export)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ sqlite }
\keyword{ tweeter}

\author{
Pau Aragó Galindo \email{parago@uji.es}
}

