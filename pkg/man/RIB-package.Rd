\name{RIB-package}
\alias{RIB-package}
\alias{RIB}
\docType{package}
\title{
R API to the Interactive Brokers Trader Workstation (TWS).
}
\description{
\emph{This software is in no way affiliated, endorsed, or
approved by Interactive Brokers or any of its affiliates.
It comes with absolutely no warranty and should
not be used in actual trading unless the user can
read and understand the source.  Extensive testing in the
paper trading account is recommended to all users.}

The package provides R access to the TWS through the Java API.  All the
methods exposed by the Java interface are available for use in R.
Important methods have been wrapped into R functions.  The rest will
follow depending on time/interest.  

Please report any and all bugs/experiences to the maintainer so they can
be corrected or incorporated into future versions.  The Java API gets a
new upgrade few times a year, so I expect the package to need minor
maintainance after an upgrade.

}
\details{
\tabular{ll}{
Package: \tab RIB\cr
Type: \tab Package\cr
Version: \tab 0.1-0\cr
Date: \tab 2008-11-08\cr
License: \tab GPL\cr
}

}
\author{
Adrian A. Dragulescu

Maintainer: Adrian A. Dragulescu <adrian.dragulescu@gmail.com>

}
\references{
Interactive Brokers: \url{www.interactivebrokers.com}
}
\keyword{ package }
\examples{
\dontrun{
tws <- twsConnect() # make a new connection to the TWS

contract <- twsContract(symbol="IBM") # equity specification

reqHistoricalData(tws,contract) # request historical data

}
}
