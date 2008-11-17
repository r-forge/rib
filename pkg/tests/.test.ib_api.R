# In EWrapperMsgGenerator.historicalData replace " date = "  
# with " date="
#
#
# 1) get the java classes
# 2) create the jar files:
#    > jar -cvf ib_api.jar com/ib/client/*.class
#    > jar -cvf aad.jar dev/*.class
# 3) load your jar files with .jinit in R
#


source("H:/user/R/Adrian/rib/pkg/R/.make.IB.package.R")

source("H:/user/R/RMG/Utilities/Environment/build.package.R")
name <- "RIB"
version <- "0.1.1"
build.package(name, version)

shell("Rcmd build --force --binary H:/user/R/Adrian/rib/pkg/")


## Sys.setenv(TZ="")
## require(rJava); require(zoo)
## setwd("H:/user/R/Adrian/RIBS3/R/")
## source(".formatMessages.R")

#source("H:/user/R/Adrian/RIBS3/R/utilities.R")

cd S:\All\Risk\Software\R\R-2.8.0\bin
Rcmd build --force --binary H:/user/R/Adrian/rib/pkg/
  
install.packages(
  pkgs="S:/All/Risk/Software/R/R-2.8.0/bin/RIB_0.1.0.zip",
  repos=NULL)

require("RIB")
tws <- twsConnect()

getMsg(tws)
clearMsg(tws)

## tws$reference$getMsg()
## tws$reference$clearMsgBuffer()




#######################################################
# create an IB contract
#source("twsContract.R")
ctr <- twsContract(symbol="GOOG")

ctr  # the show method

summary(ctr) # the summary method

# this one fails ... 
ctr <- twsContract(symbol="AAPL", secType="OPT", expiry="201001",
  strike=100, right="CALL")


#######################################################
# request historical data
#source("reqHistoricalData.R")
end.dt <- Sys.time()
reqId  <- 2
# default call: daily
ctr <- twsContract(symbol="GOOG")
reqHistoricalData(tws, ctr, end.dt, reqId=reqId)

# getting intraday data 
reqId <- 3
HD <- reqHistoricalData(tws, ctr, end.dt, duration="1 D",
  barSize="1 min", reqId=reqId)

# get some FUTURES
ctr <- twsContract(symbol="YM", secType="FUT", expiry="200906",
                   exchange="ECBOT", primaryExchange="ECBOT")
HD.YM <- reqHistoricalData(tws, ctr)

ctr <- twsContract(symbol="ES", secType="FUT", expiry="200906",
                   exchange="GLOBEX", primaryExchange="GLOBEX")
HD.ES <- reqHistoricalData(tws, ctr, barSize="30 mins", useRTH=0)

# get NG
ctr <- twsContract(symbol="NG", secType="FUT", expiry="200903",
                   exchange="NYMEX", primaryExchange="NYMEX")
HD.NG <- reqHistoricalData(tws, ctr, barSize="30 mins", useRTH=0)

# get bond data


# get FX exchange data
ctr <- twsContract(symbol="EUR", secType="CASH", 
                   exchange="IDEALPRO", primaryExchange="IDEALPRO")
HD.EUR <- reqHistoricalData(tws, ctr, barSize="30 mins", useRTH=0)
plot(HD.EUR[,"close"])



#######################################################
# request account updates
acctCode  <- "DU51749" #"U122851"  #"DU51749"
#source("reqAccountUpdates.R")
res <- reqAccountUpdates(tws, acctCode)
(PS  <- res[[1]])
(PV  <- res[[2]])

#######################################################
# request open orders 
#source("reqOpenOrders.R")
res <- reqOpenOrders(tws)     
(OO  <- res[[1]])    # open orders 
(OS  <- res[[2]])    # order status

#######################################################
# request executions
#source("twsExecutionFilter.R")
#source("reqExecutions.R")
(EX <- reqExecutions(tws))    

#######################################################
# place order
source("H:/user/R/Adrian/testTws/R/twsOrder.R")
source("H:/user/R/Adrian/testTws/R/placeOrder.R")

orderId <- 14
# place a limit order in an equity
ctr <- twsContract(symbol="ACM")
ord <- twsOrder(orderId=orderId, totalQuantity=100, action="BUY",
  orderType="MKT")
placeOrder(tws, orderId, ctr, ord)

orderId <- 12
# place a market order in an equity
ctr <- twsContract(symbol="AKAM")
ord <- twsOrder(orderId=orderId, totalQuantity=100, action="BUY",
  orderType="LMT", lmtPrice=10)
placeOrder(tws, orderId, ctr, ord)


#source("getNextOrderID.R")
getNextOrderId(tws, 6)


slotNames(ord)

orderId <- 16
ord <- twsOrder(orderId=orderId, totalQuantity=100, action="BUY",
  orderType="LMT", lmtPrice=10)





msg <- getMsg(tws)














.jinit()
# what's your java  version?  Need > 1.5.0.
.jcall('java.lang.System','S','getProperty','java.version')

.jinit(classpath="H:/user/R/Adrian/Java/test/IB/ib_api.jar")
.jinit(classpath="H:/user/R/Adrian/Java/test/IB/aad.jar")

# hook up to the TWS
tws <- .jnew("dev/AAD_Trader")

# see what methods you have defined 
.jmethods(tws)

# any messages ? 
tws$getMsg()

# create an IB contract 
ctr <- .jnew("com/ib/client/Contract", 
             as.integer(0), "YHOO", "STK", "",
             0.0, "", "1",
             "SMART", "USD", "",
             .jnew("java/util/Vector"), "SMART", FALSE)
.jfield(ctr, "S", "m_symbol")


# get historical data
.jcall(tws, , "getHistoricalData", as.integer(1), ctr,
   "20081007 00:00:00 GMT", "10 D", "1 day", "MIDPOINT",
   as.integer(1), as.integer(1))

# wait a bit, and check the messages again
tws$getMsg()








# exceptions 
# .jgetEx()



#####################################################################
# create a contract
#

source("twsContract.R")
ctr <- twsContract(symbol="YHOO")




######################################################################
######################################################################
MM <- read.csv("S:/Risk/Temporary/CollateralAllocation/20081010/SourceData/AllPos_AGMTH_preibt_10OCT08.csv")

MM <- subset(MM, counterparty=="BGEMD")
MM <- subset(MM, counterparty=="ENECSFB")
MM <- subset(MM, counterparty=="CCT")  # cinergy capital and trading 
write.csv(MM, file="junk.csv", row.names=FALSE)

MM <- MM[-grep(" VLRCST ", MM$commod_curve),]

ind <- which(regexpr("COMMOD PW", MM$commod_curve)==1)
MM$commod_curve[ind]


tapply(MM$position[ind], MM$Marginal[ind], sum, na.rm=TRUE)



bux <- unique(MM[,c("Credit_CSA", "Marginal")])
aux <- subset(MM, Marginal=="UnMargin")
unique(aux[,c("book_name", "PARENTPORTFOLIO8")])


