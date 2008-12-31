# Various logging and cleanup functions
#
# save data to C:/Temp/Data/IB/

merge.self <- function(x, y)
{
  # overlay y on x, e.g. extend y with x     
  index.extra <- setdiff(index(x),index(y))
  index.keep  <- index(y) 

  return(rbind(x[index.extra,], y))
}

require(RIB)

contracts <- NULL

contracts <- c(contracts, list(
  list(tws=twsContract(symbol="ES", secType="FUT", expiry="200903",
    exchange="GLOBEX", primaryExchange="GLOBEX"),
    saveName="ES200903", barSize="1 min", duration="5 D")))

contracts <- c(contracts, list(
  list(tws=twsContract(symbol="YM", secType="FUT", expiry="200903",
    exchange="ECBOT", primaryExchange="ECBOT"),
    saveName="YM200903", barSize="1 min", duration="5 D")))

##################################################################
# Download prices
#
for (i in seq_along(contracts)){
  aux <- reqHistoricalData(tws, contracts[[i]]$tws,
                      barSize  = contracts[[i]]$barSize,
                      duration = contracts[[i]]$duration,
                      whatToShow = "TRADES")
  if (class(aux)!= "zoo") next

  fileName <- paste("C:/Temp/Data/IB/", contracts[[i]]$saveName,
                    ".RData", sep="")
  if (file.exists(fileName)){
    load(fileName)
    assign(contracts[[i]]$saveName,
         merge.self(get(contracts[[i]]$saveName), aux))
  } else {
    assign(contracts[[i]]$saveName, aux)
  }
  save(list=contracts[[i]]$saveName, file=fileName)
  cat("Updated", fileName, "\n")
}

               


