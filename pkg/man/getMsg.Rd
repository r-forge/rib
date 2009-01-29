\name{getMsg}
\alias{getMsg}
\title{ Read the IB message buffer }
\description{
Read the message buffer sent by the IB severs.  Clear the buffer.
}
\usage{
getMsg(tws)

clearMsg(tws)
}
\arguments{
  \item{tws}{A twsConnection object.}
}
\details{
  This is likely an internal function, but can be useful for debugging
  purposes. 
}
\value{
A character string with the message from the IB servers.  When you
request new info from the IB servers with an R function call, usually a
\code{clearMsg(tws)} happens internally to clear the buffer before
placing the actual call.
}
\references{ Interactive Brokers API: \url{http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm} }
\author{ Adrian A. Dragulescu }

\examples{
\dontrun{

# get the current buffer into R
msg <- getMsg(tws)

# and clear it
clearMsg(tws)
getMsg(tws)

}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }
\keyword{ utilities }
