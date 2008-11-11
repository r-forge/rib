twsContract <- function(.Object, symbol, secType="STK", 
  expiry="", strike=0, right="", multiplier=1, exchange="SMART",
  currency="USD",  localSymbol="", primaryExchange="SMART",
  includeExpired=FALSE, comboLegsDescription="", comboLegs, 
  conID=0)
{
  if (missing(comboLegs))
    comboLegs <- .jnew("java/util/Vector")
  
  ref <- .jnew("com/ib/client/Contract", 
    as.integer(conID), as.character(symbol), as.character(secType),
    as.character(expiry), as.double(strike), as.character(right),
    as.character(multiplier), as.character(exchange),
    as.character(currency), as.character(localSymbol),
    comboLegs, as.character(primaryExchange), as.logical(includeExpired))
    
  if (class(ref)[1] != "jobjRef" | is.jnull(ref))
    stop("Cannot create contract.  Check inputs.")  

  structure(
    list(symbol=symbol, secType=secType, 
      expiry=expiry, strike=strike, right=right,
      multiplier=multiplier, exchange=exchange,
      currency=currency, localSymbol=localSymbol,
      primaryExchange=primaryExchange,
      includeExpired =includeExpired,
      comboLegsDescription=comboLegsDescription,
      comboLegs =comboLegs, conID=conID, reference=ref),
    class="twsContract")   
}

