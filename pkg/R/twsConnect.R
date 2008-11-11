# Make sure you have C:\Program Files\Java\jre6\bin\client added to your path.
#
twsConnect <- function(clientId = 0, host = "", port = 7496)
{
    # hook up to the TWS
    ref <- .jnew("dev/AAD_Trader", as.integer(clientId), host,
                 as.integer(port))

    if (class(ref)[1] != "jobjRef" | is.jnull(ref))
      stop("Could not connect.  Check your settings.")  

    structure(
      list(clientId=clientId, host=host, port=port,
           reference=ref),
      class="twsConnect")
}


