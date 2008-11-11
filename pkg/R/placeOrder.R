placeOrder <- function(tws, orderId, ctr, ord)
{

  
  .jcall(tws$reference, , "placeOrder", as.integer(orderId),
     ctr$reference, ord$reference)

  # need to test for success
  
}
