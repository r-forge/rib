\name{twsOrder}
\alias{twsOrder}
\title{Create a twsOrder.}
\description{Create a twsOrder for use in API calls.}

\usage{twsOrder(orderId, clientId=0, permId=orderId,
  action="BUY", totalQuantity=1, orderType="MKT", lmtPrice=0,
  auxPrice=0, tif="GTC", ocaGroup=character(), ocaType=0,
  orderRef=character(), transmit=TRUE, parentId=0, blockOrder=FALSE,
  sweepToFill=FALSE, displaySize=0, triggerMethod=0, outsideRth=FALSE,
  hidden=FALSE, goodAfterTime="", goodTillDate="",
  overridePercentageConstraints=FALSE, rule80A=character(),
  allOrNone=FALSE, minQty=numeric(), percentOffset=numeric(),
  trailStopPrice=numeric(), faGroup=character(),
  faProfile=character(), faMethod=character(),
  faPercentage=character(), openClose="O", origin=0, shortSaleSlot=0,
  designatedLocation="", discretionaryAmt=0, eTradeOnly=FALSE,
  firmQuoteOnly=FALSE, nbboPriceCap=numeric(), auctionStrategy=0,
  startingPrice=numeric(), stockRefPrice=numeric(), delta=numeric(),
  stockRangeLower=numeric(), stockRangeUpper=numeric(),
  volatility=numeric(), volatilityType=numeric(), continuousUpdate=0,
  referencePriceType=numeric(), deltaNeutralOrderType="",
  deltaNeutralAuxPrice=numeric(), basisPoints=numeric(),
  basisPointsType=numeric(), scaleInitLevelSize=numeric(),
  scaleSubsLevelSize=numeric(), scalePriceIncrement=numeric(),
  account=character(), settlingFirm=character(),
  clearingAccount=character(), clearingIntent=character(),
  whatIf=FALSE, algoStrategy=NULL, algoParams=NULL)}

\arguments{
  \item{orderId}{The id for this order.}
  \item{clientId}{The id of the client that placed this order.}
  \item{permId}{The TWS id used to identify orders, remains the same
    over TWS sessions.}
  \item{action}{Identifies the side. Valid values are: BUY, SELL, SSHORT.}
  \item{totalQuantity}{The order quantity.}
  \item{orderType}{Identifies the order type. Valid values are: MKT, MKTCLS,
    LMT, LMTCLS, PEGMKT, SCALE, STP, STPLMT, TRAIL, REL, VWAP,
    TRAILLIMIT.}
  \item{lmtPrice}{The LIMIT price, used for limit, stop-limit and
    relative orders. In all other cases specify zero. For relative
    orders with no limit price, also specify zero.}
  \item{auxPrice}{The STOP price for stop-limit orders, and the offset
    amount for relative orders. In all other cases, specify zero.}
  \item{tif}{The time in force. Valid values are: DAY, GTC, IOC, GTD.}
  \item{ocaGroup}{Identifies an OCA (one cancels all) group.}
  \item{ocaType}{Tells how to handle remaining orders in an OCA group
    when one order or part of an order executes. Valid values include:
    1 = Cancel all remaining orders with block
    2 = Remaining orders are proportionately reduced in size with block
    3 = Remaining orders are proportionately reduced in size with no block

    If you use a value "with block"gives your order has overfill
    protection. This means that only one order in the group will be routed
    at a time to remove the possibility of an overfill.}
  \item{account}{The account. For institutional customers only.}
  \item{openClose}{Specifies whether the order is an open or close
    order.  For institutional customers only. Valid values are O, C.}
  \item{origin}{The order origin. For institutional customers only.
    Valid values are 0 = customer, 1 = firm.}
  \item{orderRef}{The order reference. For institutional customers
    only.}
  \item{transmit}{Specifies whether the order will be transmitted by
    TWS.  If set to false, the order will be created at TWS but will not
    be sent.}
  \item{parentId}{The order ID of the parent order, used for bracket and
    auto trailing stop orders.}
  \item{blockOrder}{If set to true, specifies that the order is an ISE
    Block order.}
  \item{sweepToFill}{If set to true, specifies that the order is a
    Sweep-to-Fill order.}
  \item{displaySize}{The publicly disclosed order size, used when
    placing Iceberg orders.}
  \item{triggerMethod}{Specifies how Simulated Stop, Stop-Limit and
    Trailing Stop orders are triggered. Valid values are:
    0 - The default value. The "double bid/ask" method will be used for
      orders for OTC stocks and US options. All other orders will used the
      "last" method.
    1 - use "double bid/ask" method, where stop orders are triggered
      based on two consecutive bid or ask prices.
    2 - "last" method, where stop orders are triggered based on the last price.
    3 - double last method.
    4 - bid/ask method.
    7 - last or bid/ask method.
    8 - mid-point method.}
  \item{outsideRth}{If set to true, allows orders to also trigger or
    fill outside of regular trading hours.}
  \item{hidden}{If set to true, the order will not be visible when
    viewing the market depth. This option only applies to orders routed
    to the ISLAND exchange.}
  \item{discretionaryAmt}{The amount off the limit price allowed for
    discretionary orders.}
  \item{goodAfterTime}{The trade's "Good After Time," format "YYYYMMDD
    hh:mm:ss (optional time zone)".  Use an empty String if not
    applicable.}
  \item{goodTillDate}{You must enter a tif value of GTD. The trade's
    "Good Till Date," format is: YYYYMMDD hh:mm:ss (optional time
    zone).  Use an empty String if not applicable.}
  \item{faGroup}{The Financial Advisor group the trade will be allocated
    to -- use an empty String if not applicable.}
  \item{faProfile}{The Financial Advisor allocation profile the trade
    will be allocated to -- use an empty String if not applicable.}
  \item{faMethod}{The Financial Advisor allocation method the trade will
    be allocated with -- use an empty String if not applicable.}
  \item{faPercentage}{The Financial Advisor percentage concerning the
    trade's allocation -- use an empty String if not applicable.}
  \item{shortSaleSlot}{Values are 1 or 2.}
  \item{designatedLocation}{Use only when shortSaleSlot value = 2.}
  \item{ocaType}{Cancel on Fill with Block = 1.  Reduce on Fill with
    Block = 2.  Reduce on Fill without Block = 3.}
  \item{overridePercentageConstraints}{If set, allows you to override
    TWS order price percentage constraints set to reject orders that
    deviate too far from the NBBO. This precaution was created to aSub
    transmitting orders with an incorrect price.}
  \item{rule80A}{Valid values are:
    Individual = 'I'
    Agency = 'A' 
    AgentOtherMember = 'W'
    IndividualPTIA = 'J'
    AgencyPTIA = 'U'
    AgentOtherMemberPTIA = 'M'
    IndividualPT = 'K'
    AgencyPT = 'Y'
    AgentOtherMemberPT = 'N'.}
  \item{settlingFirm}{Institutional only.}
  \item{clearingAccount}{For IBExecution customers: Specifies the true
    beneficiary of the order. This value is required for FUT/FOP orders
    for reporting to the exchange.}
  \item{clearingIntent}{For IBExecution customers: Valid values are: IB,
    Away, and PTA (post trade allocation).}
  \item{allOrNone}{yes=1, no=0}
  \item{minQty}{Identifies a minimum quantity order type.}
  \item{percentOffset}{The percent offset amount for relative orders.}
  \item{eTradeOnly}{Trade with electronic quotes. yes = 1, no = 0.}
  \item{firmQuoteOnly}{Trade with firm quotes. yes = 1, no = 0.}
  \item{nbboPriceCap}{The maximum Smart order distance from the NBBO.}
  \item{auctionStrategy}{Valid values are: match = 1, improvement = 2, 
     transparent = 3.  For BOX exchange only.}
  \item{startingPrice}{The starting price. Valid on BOX orders only.}
  \item{stockRefPrice}{The stock reference price. The reference price is
    used for VOL orders to compute the limit price sent to an exchange
    (whether or not Continuous Update is selected), and for price range
    monitoring.}
  \item{delta}{The stock delta. Valid on BOX orders only.}
  \item{stockRangeLower}{The lower value for the acceptable underlying
    stock price range. For price improvement option orders on BOX and
    VOL orders with dynamic management.}
  \item{stockRangeUpper}{The upper value for the acceptable underlying
    stock price range. For price improvement option orders on BOX and
    VOL orders with dynamic management.}
  \item{volatility}{What the price is, computed via TWSs Options
    Analytics.  For VOL orders, the limit price sent to an exchange is
    not editable, as it is the output of a function.  Volatility is
    expressed as a percentage.}
  \item{volatilityType}{How the volatility is calculated.  Daily = 1,
    Annual = 2.}
  \item{deltaNeutralOrderType}{VOL orders only. Enter an order type to
    instruct TWS to submit a delta neutral trade on full or partial
    execution of the VOL order. For no hedge delta order to be sent,
    specify NONE.}
  \item{deltaNeutralAuxPrice}{VOL orders only. Use this field to enter a
    value if  the value in the deltaNeutralOrderType field is an order
    type that requires an Aux price, such as a REL order.}
  \item{continuousUpdate}{Used for dynamic management of volatility
    orders. Determines whether TWS is supposed to update the order price
    as the underlying moves. If selected, the limit price sent to an
    exchange is modified by TWS if the computed price of the option
    changes enough to warrant doing so.  This is very helpful in keeping
    the limit price sent to the exchange up to date as the underlying
    price changes.}
  \item{referencePriceType}{Used for dynamic management of volatility orders. Set to
     1 = Average of National Best Bid or Ask, or set to 
     2 = National Best Bid when buying a call or selling a put; and
         National Best Ask when selling a call or buying a put.}
  \item{trailStopPrice}{For TRAILLIMIT orders only.}
  \item{scaleInitLevelSize}{For Scale orders: Defines the size of the
    first, or initial, order component.}
  \item{scaleSubsLevelSize}{For Scale orders: Defines the order size of
    the subsequent scale order components. Used in conjunction with
    scaleInitLevelSize().}
  \item{scalePriceIncrement}{For Scale orders: Defines the price
    increment between scale components.  This field is required.}
  \item{basisPoints}{For EFP orders only.}
  \item{basisPointsType}{For EFP orders only.}
  \item{whatIf}{Use to request pre-trade commissions and margin
    information.  If set to true, margin and commissions data is
    received back via the OrderState() object for the openOrder()
    callback.}
  \item{algoStrategy}{NOT IMPLEMENTED YET}
  \item{algoParams}{NOT IMPLEMENTED YET}
  
}
\details{
 Setting 75 arguments it's not something you want to do
 everytime you create a contract.  I tried to use as much as possible
 sensible default settings.  It is wise that you check on the paper
 trading account all the arguments for all order types that you plan
 to use, and you do not rely on the defaults I supplied.    
}
\value{
A \code{twsOrder} object.
}
\references{Interactive Brokers:
  \url{http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm}.
Check out the SocketClientProperties/Order folder.}
\author{Adrian Dragulescu }
\seealso{ \code{\link{twsContract}} }
\examples{

# place a limit order in an equity
orderId <- 6   # use your orderId number 
ctr <- twsContract(symbol="AAPL")
ord <- twsOrder(orderId=orderId, totalQuantity=100, action="SELL",
  orderType="LMT", lmtPrice=110)
placeOrder(tws, orderId, ctr, ord)

# place a market order in an equity
orderId <- 7
ctr <- twsContract(symbol="AAPL")
ord <- twsOrder(orderId=orderId, totalQuantity=20, action="BUY",
  orderType="MKT")
placeOrder(tws, orderId, ctr, ord)


}
\keyword{ utilities }
