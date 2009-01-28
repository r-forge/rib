cancelMtkData <- function(tws, tickerId=1)
{
  .jcall(tws$reference, ,"cancelMktData", as.integer(tickerId))

  msg <- getMsg(tws)
  msg <- gsub(" noAutoExecute|canAutoExecute ", "", msg)
  msg <- gsub(" +", " ", msg)
  
  return(invisible(msg))
}

# TWS time is in GMT
# as.POSIXct(1233170356, origin="1969-12-31 19:00:00")
# as.POSIXct(1233170356, origin="1970-01-01", tz="GMT") # use this one


# The repeat loop makes sense only if snapshot=TRUE
reqMktData <- function(tws, Contract, genericTicklist="",
  snapshot=TRUE, tickerId=1, wait=0.5)
{
  clearMsg(tws)

  .jcall(tws$reference, ,"reqMktData", as.integer(tickerId),
    Contract$reference, genericTicklist, snapshot)

  if (snapshot==FALSE)  #just place the call, you will need to cancel
    return(invisible())
  
  nchar.old <- -1
  repeat{
    Sys.sleep(wait)
    msg <- getMsg(tws)
    if (nchar(msg)==nchar.old)
      break
    nchar.old <- nchar(msg)
  }
  msg <- gsub(" noAutoExecute|canAutoExecute ", "", msg)
  msg <- gsub(" +", " ", msg)
  
  return(msg)
} 

##   aux <- strsplit(msg, "' +|'$")[[1]]
##   res <- gsub(".*'", "", aux)
##   names(res) <- gsub("='.*", "", aux)
  

