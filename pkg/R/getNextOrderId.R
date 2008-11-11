getNextOrderId <- function( tws, orderId, show=TRUE )
{
  clearMsg(tws)
  .jcall(tws$reference, ,"nextValidId", as.integer(orderId))

  Sys.sleep(0.2)
  msg <- getMsg(tws)

  if (show)
    print(msg)

  nextOrderId <- as.integer(gsub(".*: ", "", msg))

  invisible( nextOrderId )
}
