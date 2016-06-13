\name{tglm}
\alias{tglm}

\title{
Generalized Linear Model for tweets
}
\description{
A fast time analysis. This function was done to get an exploratory time analysis base on a Generalized Linear Model (GLM), The function is based  on \code{\link{glm}} function from. \code{\link{glm}} performs a GLM counting the tweets by hour, day, or week of the day.The results of this function is a \code{glm} object and the count of the tweets.
}
\usage{
tglm(tweets,countby,family)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tweets}{Tweets harvested using \code{tweet2r} as DataFrame}
  \item{countby}{Tweets are count by default by weekday, also can be count by hour.Other options are "days" and "weekdays""  }
  \item{family}{AvailableGLM family model in the function \code{\link{glm}}}
}
\value{
  \item{tglm}{\code{\link{glm}} object}
  \item{countout}{Tweets count by as the \code{countby} option}

}

\seealso{
\code{glm},
\code{tweet2r}
}

\author{
Pau Aragó Galindo \email{parago@uji.es}
}

\examples{
\dontrun{
myglm<-t2glm(tweets, "day", "poisson")
}

}

\keyword{glm}
\keyword{tweet2r}

