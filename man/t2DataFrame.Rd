\name{t2DataFrame}
\alias{t2DataFrame}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Parse tweets from JSON files and import to R
%%  ~~function to do ... ~~
}
\description{
A function to parse JSON files containing tweets stored using the function \code{\link{tweet2r}}. Tweets are stored as a data.frame ready to be use within R.
}
\usage{
t2DataFrame(fileprefix, path = ".", pattern = ".json$")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fileprefix}{File prefix for JSON files where tweets has been stored after harvesting. If tweets have been retrieved with the \code{\link{tweet2r}} function it should be the same fileprefix name.}
  
  \item{path}{
  A character vector to folder. see ?list.files()
  }
  
  \item{pattern}{
  Limits possible file extensions, optional as regular expression. see ?list.files()
  }
}


\value{
 \item{tweets}{Return harvested tweets with \code{\link{tweet2r}} as a \code{\link{data.frame}}.}
}

\author{
  Pau Aragó Galindo \email{parago@uji.es}
}

\seealso{
  \code{\link{tweet2r}}, \code{\link{streamR}}
}

\examples{

\dontrun{

  #json file prefix names
  fileprefix="tweets"
  
  #function to parse tweets from JSON file and import to R
  tweets<-t2DataFrame(fileprefix)
  }
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ parse }
\keyword{ data.frame }
\keyword{ tweets }
