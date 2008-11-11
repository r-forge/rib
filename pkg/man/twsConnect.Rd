\name{twsConnect}
\alias{twsConnect}
\alias{twsDisconnect}
\title{ Establish or Terminate a Connection to TWS }
\description{
Connect or disconnect to the Trader Workstation (TWS).
}
\usage{
twsConnect(clientId = as.integer(0), host = "", 
           port = as.integer(7496))

twsDisconnect(con)
}
\arguments{
  \item{clientId}{A number used to identify this client connection.
    All orders placed/modified from this client will be associated
    with this client identifier.  Note: Each client MUST connect
    with a unique clientId.}
  \item{host}{The host name or IP address of the machine where
    TWS is running. Leave blank to connect to the local host.}
  \item{port}{Must match the port specified in TWS on the
    Configure>API>Socket Port field.}
}
\details{
  Returns an object of class "twsConnect" which contains the external
  reference to the Java object that represents
  the connection.  This connection will be used in subsequent TWS
  API calls.  Attempting to create another connection to the server with
  the same clientId will result in an error.
}
\value{
A \code{twsConnection} object.
}
\references{ Interactive Brokers: \url{http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm}}
\author{ Adrian Dragulescu }
\note{
While it is not strictly required to disconnect via \code{twsDisconnect}
it is probably advisable.
}
\examples{
\dontrun{
tws <- twsConnect()
twsDisconnect(tws)
}
}
\keyword{ utilities }
