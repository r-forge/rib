\name{reqExecutions}
\alias{reqExecutions}
\title{Request executions}
\description{
Request to view the executions orders. 
}
\usage{
reqExecutions(tws, exFilter=twsExecutionFilter())
}
\arguments{
  \item{tws}{A twsConnect object.}
  \item{exFilter}{An execution filter.}
}
\details{  
The executions that logged since last tws loging. 
}
\value{
A data.frame with details on the executions.
}
\references{ Interactive Brokers API: \url{http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm} }
\author{ Adrian A. Dragulescu }

\seealso{ \code{\link{twsExecutionFilter}} }
\examples{
\dontrun{
  tws <- twsConnect()
  reqExecutions(tws)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }
\keyword{ utilities }
