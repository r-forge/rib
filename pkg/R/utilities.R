# A collection of utilities to format the tws output stream and other

.onLoad <- function(libname, pkgname)
{
  .jpackage(pkgname)
  
  # what's your java  version?  Need > 1.5.0.
  jversion <- .jcall('java.lang.System','S','getProperty','java.version')
  if (jversion <= "1.5.0")
    stop(paste("Your java version is ", jversion,
                 ".  Need 1.5.0 or higher.", sep=""))
    
##   # load the IB_API and my interface 
##   .jinit(classpath="java/ib_api.jar")
##   .jinit(classpath="java/aad.jar")
}

#######################################################################
# Get and clear the message buffer
#
getMsg <- function(tws) tws$reference$getMsg()
clearMsg <- function(tws) tws$reference$clearMsgBuffer()

#######################################################################
# Extract the part that corresponds to the given reqId
#
.extractID <- function(msg, reqId)
{
  aux <- strsplit(msg, "\n")[[1]]
  ind <- grep(paste("^id='", reqId, "'", sep=""), aux)
  return(aux[ind])  
}

#######################################################################
# Check if a historical prices request has ended 
#
.hasRequestEnded <- function(msg, reqID)
{
   aux <- .extractID(msg, reqId)
   ind <- grep("date='finished", aux[length(aux)])
   return(identical(ind,as.integer(1)))
}

#######################################################################
# process a vector of with elements: "field1='value1' field2='value2'"
# if all elements have the same number of fields, sappply will work
# 
.format.msgVector <- function( msg )
{
#  labels  <- strsplit(msg[1], "='.*?' ?", perl=TRUE)[[1]]
#  aux <- gsub("(.*?)='", "", msg)

  aux <- strsplit(msg, "' |'$")
  aux <- sapply(aux, function(x){
    res <- gsub(".*'", "", x)
    names(res) <- gsub("='.*", "", x)
    res
  })
  if (class(aux)=="matrix")
    aux <- data.frame(t(aux))
  
  return(aux)
}


#######################################################################
# Call it only after the request has finished.
#
.format.historicalData <- function( msg, reqId )
{
  aux <- .extractID(msg, reqId)
  aux <- aux[-length(aux)]

  labels  <- strsplit(aux[1], "='.*?' ?", perl=TRUE)[[1]]

  bux <- strsplit(aux, "'", perl=TRUE)
  HD <- t(sapply(bux,
    function(x){as.numeric(x[c(6,8,10,12,14,16,18)])}))
  
  dt <- sapply(bux, function(x){x[4]})
  if (nchar(dt[1])>8){
    dt <- as.POSIXct(dt, format="%Y%m%d  %H:%M:%S")
  } else {
    dt <- as.POSIXct(dt, format="%Y%m%d")
  }
  HD <- zoo(HD, dt)
  colnames(HD) <- labels[3:9]
  
  return(HD)  
}


