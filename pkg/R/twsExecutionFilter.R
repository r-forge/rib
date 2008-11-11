twsExecutionFilter <- function(clientId=0, acctCode="", 
    time="", symbol="", secType="", exchange="", side="")
{  
  ref <- .jnew("com/ib/client/ExecutionFilter", 
    as.integer(clientId), as.character(acctCode),
    as.character(time), as.character(symbol),
    as.character(secType), as.character(exchange),
    as.character(side))

  if (class(ref)[1] != "jobjRef" | is.jnull(ref))
    stop("Cannot create contract.  Check inputs.")  

  structure(
    list(clientId =clientId,
      acctCode=acctCode,
      time=time,
      secType=secType,
      exchange=exchange,
      side=side,
      reference=ref),
    class="twsExecutionFilter")   
}

