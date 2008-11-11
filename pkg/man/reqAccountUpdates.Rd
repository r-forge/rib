\name{reqAccountUpdates}
\alias{reqAccountUpdates}
\title{ Request Account Updates }
\description{
Request and view account details from Interactive Brokers
}
\usage{
reqAccountUpdates(conn, acctCode)
}
\arguments{
  \item{conn}{A twsConnection object.}
  \item{acctCode}{Your account name (the user name field on the tws
    Login window).}
}
\details{
Some of the updates are not contemporaneous.  This is ingnored for now.
}
\value{
A list with two data.frames corresponding to the information
displayed in the tws Account window.  The first data.frame shows the
porfolio summary table, and the second data.frame shows the detailed
position info. 
}
\references{ Interactive Brokers API: \url{http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm} }
\author{ Adrian A. Dragulescu }

\examples{
\dontrun{
  tws <- twsConnect()
  reqAccountUpdates(tws)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }
\keyword{ utilities }
