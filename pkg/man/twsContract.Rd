\name{twsContract}
\alias{twsContract}
\title{Create a twsContract}
\description{
Create a twsContract for use in API calls.
}
\usage{
twsContract(symbol,
            secType="STK",
            expiry="",
            strike=0,
            right="",
            exchange="SMART",
            currency="USD",
            localSymbol="",
            primaryExchange="SMART",
            includeExpired=FALSE,
            multiplier=1,
            comboLegsDescription="",
            comboLegs,
            conID=0)
}
\arguments{
  \item{symbol}{The symbol of the underlying asset.}
  \item{sectype}{The Security type. Valid values are: 
    STK, OPT, FUT, IND, FOP, CASH, BAG}
  \item{expiry}{The expiration date. Use the format YYYYMM.}
  \item{strike}{The strike price.}
  \item{right}{Specifies a Put or Call. Valid values are: P, PUT, C, CALL.}
  \item{multiplier}{Allows you to specify a future or option contract
    multiplier. This is only necessary when multiple possibilities exist.}
  \item{exchange}{The order destination, such as Smart.}
  \item{currency}{Specifies the currency. Ambiguities may require that
    this field be specified, for example, when SMART is the exchange and
    IBM is being requested (IBM can trade in GBP or USD).  Given the
    existence of this kind of ambiguity, it is a good idea to always specify
    the currency.}
  \item{localSymbol}{The local exchange symbol of the underlying asset.}
  \item{primaryExch}{Identifies the listing exchange for the contract
    (do not list SMART).}
  \item{includeExpired}{If set to TRUE, contract details requests and
    historical data queries can be performed pertaining to expired
    contracts.

    Note: Historical data queries on expired contracts are limited to
    the last year of the contracts life, and are initially only supported
    for expired futures contracts.}
  \item{comboLegsDescription}{Description for combo legs.}
  \item{comboLegs}{Dynamic memory structure used to store the leg
    definitions for this contract.  A \code{jobjRef} object.}
  \item{conId}{The unique contract identifier.}
}
\details{

}
\value{
A \code{twsContract} object.
}
\references{ Interactive Brokers: \url{www.interactivebrokers.com}}
\author{Adrian Dragulescu }
\seealso{ \code{\link{reqHistoricalData}} }
\examples{

# AAPL stock
contract <- twsContract("AAPL")

# AAPL option
contract <- twsContract("AAPL", secType="OPT", expiry="201001",
  strike=100, right="CALL", multiplier=100, currency="USD")

}
\keyword{ utilities }
