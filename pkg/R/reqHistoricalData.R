reqHistoricalData <- function(tws, Contract, endDateTime,
  barSize = "1 day", duration = "1 M", 
  whatToShow = "MIDPOINT", reqId = as.integer(1),
  useRTH = as.integer(1))
{
  formatDate <- as.integer(1)
  if (!(useRTH %in% c(0,1)))
    stop("Invalid useRTH, see documentation.")
  if (formatDate !=1)
    stop("Only formatDate==1 is supported, see documentation.")
  if (!(toupper(whatToShow) %in% c("TRADES","MIDPOINT", "BID",
                                   "ASK", "BID/ASK")))
    stop("Invalid whatToShow, see documentation.")  
  
  unit <- strsplit(duration, " ")[[1]][2]
  if (!(unit %in% c("S","D","W","M","Y")))
    stop("Invalid duration unit, see documentation.")
##   if (!(barSize %in% c("S","D","W","M","Y")))
##     stop("Invalid unit in duration, see documentation.")

  this.end.dt <- format(endDateTime, "%Y%m%d %H:%M:%S")

  clearMsg(tws)
  
  # call the tws 
  .jcall(tws$reference, , "getHistoricalData", as.integer(reqId),
     Contract$reference, this.end.dt, duration,
     barSize, toupper(whatToShow),
     as.integer(useRTH), as.integer(formatDate))

   waiting <- TRUE
   while (waiting){
     Sys.sleep(2)              # wait a bit
     msg <- getMsg(tws)   
     waiting <- !.hasRequestEnded(msg, reqId)
   }

   return(.format.historicalData( msg, reqId))
} 

