reqOpenOrders <- function(tws)
{
  clearMsg(tws)
  
  .jcall(tws$reference, , "reqOpenOrders")
  
  nchar.old <- -1
  msg <- getMsg(tws)
  while (nchar(msg) != nchar.old){
    nchar.old <- nchar(msg)
    Sys.sleep(0.2)                   # wait a bit
    msg <- getMsg(tws)   
  }

  # extract the open orders
  msgOO <- gsub("<OS[^>]*>(.*?)</OS>", "", msg, perl=TRUE)
  msgOO <- strsplit(msgOO, "<OO>")[[1]][-1]
  msgOO <- gsub("</OO>.*", "", msgOO)
  msgOO <- .format.msgVector( msgOO )
  if (is.data.frame(msgOO)){
    ind <- which(names(msgOO) %in% c("quantity", "lmtPrice", "auxPrice",
      "volatility", "stockRefPrice", "delta", "stockRangeLower",
      "stockRangeUpper", "trailStopPrice"))
    msgOO[,ind] <- sapply(msgOO[,ind], as.numeric)
    msgOO <- msgOO[order(msgOO$orderId), ]
  }

  # extract the order status
  msgOS <- gsub("<OO[^>]*>(.*?)</OO>", "", msg, perl=TRUE)
  msgOS <- strsplit(msgOS, "<OS>")[[1]][-1]
  msgOS <- gsub("</OS>.*", "", msgOS)
  msgOS <- .format.msgVector( msgOS )
  if (is.data.frame(msgOS)){
    msgOS <- msgOS[order(msgOS$orderId), ]
  } 

  return(list(msgOO, msgOS))
}
