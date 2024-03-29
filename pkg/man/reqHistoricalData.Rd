\name{reqHistoricalData}
\alias{reqHistoricalData}
\alias{cancelHistoricalData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Request Historical Data From TWS }
\description{
Makes a request to the Interactive Brokers Trader Workstation (TWS),
and returns a zoo object containing the results of the request
if successful.
}
\usage{
reqHistoricalData(conn, 
                  Contract,
                  endDateTime = Sys.time(),
                  barSize = "1 day",
                  duration = "1 M",
                  whatToShow = "MIDPOINT", 
                  reqId = as.integer(1),
                  useRTH = as.integer(1))

cancelHistoricalData(conn,tickerId)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{conn}{A \code{twsConnect} object.}
  \item{Contract}{A \code{twsContract} object.}
  \item{endDateTime}{End date/time for request as a POSIXct datetime.}
  \item{barSize}{Specifies the size of the bars that will be returned
    (within IB/TWS limits).  See the notes for valid values.}
  \item{duration}{Time span the request will cover }
  \item{useRTH}{If 1, data is limited to regular trading hours.  If 0,
    return all data available.}
  \item{whatToShow}{Type of data to be extracted, see notes.}
  \item{reqId}{The unique id to associte with the request.  This is also
    used when canceling the historical data request.}
}
\details{
All arguments should be character strings.  Attempts will
be made to coerce, but should not be relied upon.

Legal \code{barSize} settings are technically
\sQuote{1 secs},\sQuote{5 secs},\sQuote{15 secs},
\sQuote{30 mins},\sQuote{1 min},\sQuote{2 mins},
\sQuote{3 mins},\sQuote{5 mins},\sQuote{15 mins},
\sQuote{30 mins},\sQuote{1 hour},\sQuote{1 day},
\sQuote{1 week},\sQuote{1 month},\sQuote{3 months},
and \sQuote{1 year}. They must be specified exactly
and there is no guarantee from the API that all
will work for all securities or durations. 

The duration string must be of the form \sQuote{n S}
where the last character may be any one of
\sQuote{S} (seconds),
\sQuote{D} (days),
\sQuote{W} (weeks),
\sQuote{M} (months),
and \sQuote{Y} (year).
At present the limit for years is 1.

\code{useRTH} takes either \sQuote{1} or \sQuote{0},
indicating the request to return only regular trade
hour data, or all data, respectively.

\code{whatToShow} can be any one of the following,
though depending on the overall request it may not succeed.
\sQuote{TRADES}, \sQuote{MIDPOINT}, \sQuote{BID},
\sQuote{ASK}, \sQuote{BID/ASK}.

}
\value{
Returns a \code{zoo} object containing the requested data.
}
\references{ Interactive Brokers \url{http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm}. }
\author{Adrian Dragulescu }
\note{
Historical data via the TWS API is not very reliable.  As historical
data is not a priority of the IB API, outside of regular trading
hours it may become unresponsive or unavailable. 

There is a strictly enforced 6 seconds between request pacing rule
implemented by the TWS. Keep this in mind.
IBrokers currently does \emph{not} manage this for the user.

The TWS workstation must be running on the same machine
as \R.

The TWS must also be set up to allow for the API to be connected
to.  See the associated help on the main Interactive Brokers
website.
}
\seealso{ \code{\link{twsContract}}, \code{\link{twsConnect}} }
\examples{
\dontrun{
end.dt <- Sys.time()

# Get EQUITY data default call: daily
ctr <- twsContract(symbol="GOOG")
reqHistoricalData(tws, ctr, end.dt, reqId=2)

# Get EQUITY data: intraday data 
HD <- reqHistoricalData(tws, ctr, end.dt, duration="1 D",
  barSize="1 min", reqId=3)

# Get OPTIONS data.
# Note: historical daily data is not available for options, so you need
# an intradaily barSize.  Multiplier is needed.  Exchange info is not
# necessary as long as there is no conflict, and currency is specified. 
ctr <- twsContract(symbol="YHOO", secType="OPT", expiry="201001",
  strike=15.0, right="PUT", currency="USD", multiplier=100)
HD <- reqHistoricalData(tws, ctr, end.dt, barSize="1 hour", reqId=4)

# Get FUTURES data.  The exchange is important. 
ctr <- twsContract(symbol="YM", secType="FUT", expiry="200906",
                   exchange="ECBOT", primaryExchange="ECBOT")
HD <- reqHistoricalData(tws, ctr)

# Get FUTURES data.  The exchange is important. 
ctr <- twsContract(symbol="ES", secType="FUT", expiry="200906",
                   exchange="GLOBEX", primaryExchange="GLOBEX")
HD <- reqHistoricalData(tws, ctr, barSize="30 mins", useRTH=0)

# Get Natural Gas from NYMEX
ctr <- twsContract(symbol="NG", secType="FUT", expiry="200903",
                   exchange="NYMEX", primaryExchange="NYMEX")
HD <- reqHistoricalData(tws, ctr, barSize="30 mins", useRTH=0)

# get FX data
ctr <- twsContract(symbol="EUR", secType="CASH", 
                   exchange="IDEALPRO", primaryExchange="IDEALPRO")
HD <- reqHistoricalData(tws, ctr, barSize="30 mins", useRTH=0)

}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ utilities }
