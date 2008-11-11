\name{reqOpenOrders}
\alias{reqOpenOrders}
\title{Request open orders}
\description{
Request to view the open orders. 
}
\usage{
reqOpenOrders(tws)
}
\arguments{
  \item{tws}{A twsConnection object.}
}
\details{  
Note: The client with a clientId of "0" will also receive the TWS-owned
open orders. These orders will be associated with the client and a new
orderId will be generated. This association will persist over multiple
API and TWS sessions.  
}
\value{
A list with two data.frames.  The first data.frame shows the
details on the open orders, and the second data.frame shows the order
status.  
}
\references{ Interactive Brokers API: \url{http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm} }
\author{ Adrian A. Dragulescu }

\examples{
\dontrun{
  tws <- twsConnect()
  reqOpenOrders(tws)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }
\keyword{ utilities }
