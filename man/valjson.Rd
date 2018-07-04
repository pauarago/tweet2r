\name{valjson}
\alias{valjson}

\title{
Json validation function
}
\description{
Function to validate json files created by tweet2r. This function deletes json files with Tweeter streaming API messages and rename json files consecutively according to a fileprefix.
}
\usage{
valjson(fileprefix, path = ".", pattern = ".json$")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fileprefix}{
  Fileprefix name from json files
  }
  
  \item{path}{
  A character vector to folder. see ?list.files()
  }
  
  \item{pattern}{
  Limits possible file extensions, optional as regular expression. see ?list.files()
  }
}

\author{
Pau Aragó Galindo \email{parago@uji.es}
}

\seealso{
\code{\link{tweet2r}}
}
\examples{
	\dontrun{
	valjson(fileprefix)
	}
}

\keyword{json }
\keyword{tweet2r}
