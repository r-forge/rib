\name{twsExecutionFilter}
\alias{twsExecutionFilter}
\title{Create a twsExecutionFilter}
\description{
Create a twsExecutionFilter for use in API calls.
}
\usage{
twsExecutionFilter(clientId=0, acctCode="", 
    time="", symbol="", secType="", exchange="", side="")
}
\arguments{
  \item{clientId}{Filter the results of the reqExecutions() method based
on the clientId.}
  \item{acctCode}{Filter the results of the reqExecutions() method based
on an account code. Note: this is only relevant for Financial Advisor
(FA) accounts.}
  \item{time}{Filter the results of the reqExecutions() method based on
execution reports received after the specified time.  The format for
timeFilter is "yyyymmdd-hh:mm:ss"}
  \item{symbol}{Filter the results of the reqExecutions() method based on the order symbol.}
  \item{secType}{Filter the results of the reqExecutions() method based
    on the order security type.  Note: Refer to the
\code{\link{twsContract}} object for the list of valid security types.}
  \item{exchange}{Filter the results of the reqExecutions() method based
    on the order exchange.}
  \item{side}{Filter the results of the reqExecutions() method based on
the order action.  Note: Refer to the \code{\link{twsOrder}} object for
the list of valid order actions.}  }
%\details{}
\value{
A \code{twsExecutionFilter} object.
}
\references{ Interactive Brokers: \url{www.interactivebrokers.com}}
\author{Adrian A. Dragulescu }
%\seealso{ \code{\link{reqHistoricalData}} }
\examples{

exFilter <- twsExecutionFilter()

}
\keyword{ utilities }
