\name{reqMktData}
\alias{reqMktData}
\title{ Request streaming market data }
\description{
Request streaming market data.  Cancel market data subscription.
}
\usage{
reqMktData(tws, Contract, genericTicklist="", snapshot=TRUE, tickerId=1,
  wait=0.5)

cancelMktData(tws, tickerId)
}
\arguments{
  \item{tws}{A twsConnection object.}
  \item{Contract}{A twsContract object.}
  \item{genericTicklist}{A comma delimited list of generic tick types.
    Tick types can be found in the Generic Tick Types page.}
  \item{snapshot}{Boolean.  If \code{TRUE} get current market state for
    the specified contract and return.  If \code{FALSE} will keep
    listening to the server.  You will need to cancel the market
    subscription with \code{cancelMktData}.  Do not enter any
    genericTicklist values if you use snapshot==TRUE.}
  \item{tickerId}{Must be a unique value.  When the market data returns,
    it will be identified by this tag.  This is also used when canceling
    the market data.}
  \item{wait}{How long to wait for the IB server in seconds.  Increase
    this number if you experience slow response times.}
}
\details{
}
\value{
A character string with the message from the IB servers.  As of now, the
output stream is not parsed. 
}
\references{ Interactive Brokers API: \url{http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm} }
\author{ Adrian A. Dragulescu }

\examples{
\dontrun{
tws <- twsConnect()

ctr <- twsContract(symbol="GOOG")
# request a snapshot
reqMktData(tws, ctr)

genericTicklist <- "100,101,104,106,162,165,221,225,236"
reqMktData(tws, ctr, genericTicklist=genericTicklist, snapshot=FALSE)
res <- cancelMtkData(tws, 1)

}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }
\keyword{ utilities }
