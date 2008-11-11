reqAccountUpdates <- function(tws, acctCode)
{
  if (missing(acctCode))
    stop("A valid account ID is required.")

  clearMsg(tws)

  subscribe <- TRUE
  .jcall(tws$reference, , "reqAccountUpdates", subscribe, acctCode)

  waiting <- TRUE
  waitingFor <- 0
  while (waiting){
    Sys.sleep(1)              # wait a bit
    msg <- getMsg(tws)
    if (length(grep("Error", msg)>0)){
      browser()
    }
    waiting <- (length(gregexpr("</?uAT>",
     substr(msg, nchar(msg)-31, nchar(msg)))[[1]])) != 4
    waitingFor <- waitingFor + 1
    if (waitingFor > 10)
      stop("Message not coming back.")
  }

  subscribe <- FALSE
  .jcall(tws$reference, ,"reqAccountUpdates", subscribe, acctCode)

  # remove the time stamp; time stamps can be different! 
  msg1 <- gsub("<uAT[^>]*>(.*?)</uAT>", "", msg, perl=TRUE)

  # extract the positions    
  msgPV <- gsub("<uAV[^>]*>(.*?)</uAV>", "", msg1, perl=TRUE)
  msgPV <- strsplit(msgPV, "<uP>")[[1]][-1]
  msgPV <- gsub("accountName.*","",msgPV)
  msgPV <- .format.msgVector( msgPV )
  ind <- which(names(msgPV) %in% c("strike", "multiplier", "position",
    "marketPrice", "marketValue", "averageCost", "unrealizedPNL",
    "realizedPNL"))
  options(warn=-1)
  msgPV[,ind] <- sapply(msgPV[,ind], as.numeric)
  msgPV[,"expiry"] <- as.Date(msgPV[,"expiry"], format="%Y%m%d")
  options(warn=0)

  # extract the portfolio statistics
  msgPS <- gsub("<uP[^>]*>(.*?)</uP>", "", msg1, perl=TRUE)
  msgPS <- strsplit(msgPS, "<uAV>")[[1]][-1]
  msgPS <- gsub("accountName.*", "", msgPS)
  msgPS <- data.frame(.format.msgVector( msgPS ))
    
  return( list(msgPS, msgPV) )
} 

