reqExecutions <- function(tws, exFilter=twsExecutionFilter())
{
    
  clearMsg(tws)
  
  .jcall(tws$reference, , "reqExecutions", exFilter$reference)

  nchar.old <- -1
  msg <- getMsg(tws)
  while (nchar(msg) != nchar.old){
    nchar.old <- nchar(msg)
    Sys.sleep(0.2)                      # wait a bit
    msg <- getMsg(tws)    
  }

  msgEX <- strsplit(msg, "<ED>")[[1]][-1]
  if (length(msgEX)!=0){
    msgEX <- gsub("</ED>", "", msgEX)
    msgEX <- .format.msgVector( msgEX )
    ind <- which(names(msgEX) %in% c("strike", "shares", "price",
      "cumQty", "avgPrice"))
    options(warn=-1)
    msgEX[,ind] <- sapply(msgEX[,ind], as.numeric)
    msgEX[,"expiry"] <- as.Date(msgEX[,"expiry"], format="%Y%m%d")
    options(warn=0)
  }
  
  return( msgEX )  
}
