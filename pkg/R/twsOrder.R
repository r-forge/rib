twsOrder <- function(orderId, clientId=0, permId=orderId,
  action="BUY", totalQuantity=1, orderType="MKT", lmtPrice=0,
  auxPrice=0, tif="GTC", ocaGroup=character(), ocaType=0,
  orderRef=character(), transmit=TRUE, parentId=0, blockOrder=FALSE,
  sweepToFill=FALSE, displaySize=0, triggerMethod=0, outsideRth=FALSE,
  hidden=FALSE, goodAfterTime="", goodTillDate="",
  overridePercentageConstraints=FALSE, rule80A=character(),
  allOrNone=FALSE, minQty=numeric(), percentOffset=numeric(),
  trailStopPrice=numeric(), faGroup=character(),
  faProfile=character(), faMethod=character(),
  faPercentage=character(), openClose="O", origin=0, shortSaleSlot=0,
  designatedLocation="", discretionaryAmt=0, eTradeOnly=FALSE,
  firmQuoteOnly=FALSE, nbboPriceCap=numeric(), auctionStrategy=0,
  startingPrice=numeric(), stockRefPrice=numeric(), delta=numeric(),
  stockRangeLower=numeric(), stockRangeUpper=numeric(),
  volatility=numeric(), volatilityType=numeric(), continuousUpdate=0,
  referencePriceType=numeric(), deltaNeutralOrderType="",
  deltaNeutralAuxPrice=numeric(), basisPoints=numeric(),
  basisPointsType=numeric(), scaleInitLevelSize=numeric(),
  scaleSubsLevelSize=numeric(), scalePriceIncrement=numeric(),
  account=character(), settlingFirm=character(),
  clearingAccount=character(), clearingIntent=character(),
  whatIf=FALSE, algoStrategy=NULL, algoParams=NULL)
{
  ref <- .jnew("com/ib/client/Order")
    
  if (class(ref)[1] != "jobjRef" | is.jnull(ref))
    stop("Cannot create order.  Check inputs.")  
 
  .jfield(ref, "m_orderId") <- as.integer(orderId)
  .jfield(ref, "m_clientId") <- as.integer(clientId)
  .jfield(ref, "m_permId") <- as.integer(permId)
  .jfield(ref, "m_action") <- as.character(action)
  .jfield(ref, "m_totalQuantity") <- as.integer(totalQuantity)
  .jfield(ref, "m_orderType") <- as.character(orderType)
  .jfield(ref, "m_lmtPrice") <- as.numeric(lmtPrice)
  .jfield(ref, "m_auxPrice") <- as.numeric(auxPrice)
  .jfield(ref, "m_tif") <- as.character(tif)
  if (length(ocaGroup)==1)
    .jfield(ref, "m_ocaGroup") <- as.character(ocaGroup)
  .jfield(ref, "m_ocaType") <- as.integer(ocaType)
  if (length(orderRef)==1)
    .jfield(ref, "m_orderRef") <- as.character(orderRef)
  .jfield(ref, "m_transmit") <- as.logical(transmit)
  .jfield(ref, "m_parentId") <- as.integer(parentId)
  .jfield(ref, "m_blockOrder") <- as.logical(blockOrder)
  .jfield(ref, "m_sweepToFill") <- as.logical(sweepToFill)
  .jfield(ref, "m_displaySize") <- as.integer(displaySize)
  .jfield(ref, "m_triggerMethod") <- as.integer(triggerMethod)
  .jfield(ref, "m_outsideRth") <- as.logical(outsideRth)
  .jfield(ref, "m_hidden") <- as.logical(hidden)
  .jfield(ref, "m_goodAfterTime") <- as.character(goodAfterTime)
  .jfield(ref, "m_goodTillDate") <- as.character(goodTillDate)
  .jfield(ref, "m_overridePercentageConstraints") <- as.logical(overridePercentageConstraints)
  if (length(rule80A)==1)
    .jfield(ref, "m_rule80A") <- as.character(rule80A)
  .jfield(ref, "m_allOrNone") <- as.logical(allOrNone)
  if (length(minQty)==1)
    .jfield(ref, "m_minQty") <- as.integer(minQty)
  if (length(percentOffset)==1)
    .jfield(ref, "m_percentOffset") <- as.numeric(percentOffset)
  if (length(trailStopPrice)==1)
    .jfield(ref, "m_trailStopPrice") <- as.numeric(trailStopPrice)
  if (length(faGroup)==1)
    .jfield(ref, "m_faGroup") <- as.character(faGroup)
  if (length(faProfile)==1)
    .jfield(ref, "m_faProfile") <- as.character(faProfile)
  if (length(faMethod)==1)
    .jfield(ref, "m_faMethod") <- as.character(faMethod)
  if (length(faPercentage)==1)
    .jfield(ref, "m_faPercentage") <- as.character(faPercentage)
  .jfield(ref, "m_openClose") <- as.character(openClose)
  .jfield(ref, "m_origin") <- as.integer(origin)
  .jfield(ref, "m_shortSaleSlot") <- as.integer(shortSaleSlot)
  .jfield(ref, "m_designatedLocation") <- as.character(designatedLocation)
  .jfield(ref, "m_discretionaryAmt") <- as.numeric(discretionaryAmt)
  .jfield(ref, "m_eTradeOnly") <- as.logical(eTradeOnly)
  .jfield(ref, "m_firmQuoteOnly") <- as.logical(firmQuoteOnly)
  if (length(nbboPriceCap)==1)
    .jfield(ref, "m_nbboPriceCap") <- as.numeric(nbboPriceCap)
  .jfield(ref, "m_auctionStrategy") <- as.integer(auctionStrategy)
  if (length(startingPrice)==1)
    .jfield(ref, "m_startingPrice") <- as.numeric(startingPrice)
  if (length(stockRefPrice)==1)
    .jfield(ref, "m_stockRefPrice") <- as.numeric(stockRefPrice)
  if (length(delta)==1)
    .jfield(ref, "m_delta") <- as.numeric(delta)
  if (length(stockRangeLower)==1)
    .jfield(ref, "m_stockRangeLower") <- as.numeric(stockRangeLower)
  if (length(stockRangeUpper)==1)
    .jfield(ref, "m_stockRangeUpper") <- as.numeric(stockRangeUpper)
  if (length(volatility)==1)
    .jfield(ref, "m_volatility") <- as.numeric(volatility)
  if (length(volatilityType)==1)
    .jfield(ref, "m_volatilityType") <- as.integer(volatilityType)
  .jfield(ref, "m_continuousUpdate") <- as.integer(continuousUpdate)
  if (length(referencePriceType)==1)
    .jfield(ref, "m_referencePriceType") <- as.integer(referencePriceType)
  .jfield(ref, "m_deltaNeutralOrderType") <- as.character(deltaNeutralOrderType)
  if (length(deltaNeutralAuxPrice)==1)
    .jfield(ref, "m_deltaNeutralAuxPrice") <- as.numeric(deltaNeutralAuxPrice)
  if (length(basisPoints)==1)
    .jfield(ref, "m_basisPoints") <- as.numeric(basisPoints)
  if (length(basisPointsType)==1)
    .jfield(ref, "m_basisPointsType") <- as.integer(basisPointsType)
  if (length(scaleInitLevelSize)==1)
    .jfield(ref, "m_scaleInitLevelSize") <- as.integer(scaleInitLevelSize)
  if (length(scaleSubsLevelSize)==1)
    .jfield(ref, "m_scaleSubsLevelSize") <- as.integer(scaleSubsLevelSize)
  if (length(scalePriceIncrement)==1)
    .jfield(ref, "m_scalePriceIncrement") <- as.numeric(scalePriceIncrement)
  if (length(account)==1)
    .jfield(ref, "m_account") <- as.character(account)
  if (length(settlingFirm)==1)
    .jfield(ref, "m_settlingFirm") <- as.character(settlingFirm)
  if (length(clearingAccount)==1)
    .jfield(ref, "m_clearingAccount") <- as.character(clearingAccount)
  if (length(clearingIntent)==1)
    .jfield(ref, "m_clearingIntent") <- as.character(clearingIntent)
  .jfield(ref, "m_whatIf") <- as.logical(whatIf)

  # create the order object
  structure(
    list(orderId=orderId, clientId=clientId, permId=permId, 
      action=action, totalQuantity=totalQuantity, orderType=orderType, 
      lmtPrice=lmtPrice, auxPrice=auxPrice, tif=tif,
      ocaGroup=.jfield(ref, , "m_ocaGroup"), 
      ocaType =.jfield(ref, ,"m_ocaType"),
      orderRef=.jfield(ref, ,"m_orderRef"),
      transmit=transmit, parentId=parentId, blockOrder=blockOrder,
      sweepToFill=sweepToFill, displaySize=displaySize, 
      triggerMethod=triggerMethod, outsideRth=outsideRth,
      hidden=hidden, goodAfterTime=goodAfterTime, 
      goodTillDate=goodTillDate,
      overridePercentageConstraints=overridePercentageConstraints,
      rule80A=.jfield(ref, , "m_rule80A"),
      allOrNone=allOrNone, minQty=minQty, percentOffset=percentOffset,
      trailStopPrice=trailStopPrice,
      faGroup=.jfield(ref, , "m_faGroup"),
      faProfile=.jfield(ref, , "m_faProfile"),
      faMethod=.jfield(ref, , "m_faMethod"),
      faPercentage=.jfield(ref, , "m_faPercentage"),
      openClose=openClose, origin=origin, shortSaleSlot=shortSaleSlot, 
      designatedLocation=designatedLocation, 
      discretionaryAmt=discretionaryAmt, eTradeOnly=eTradeOnly, 
      firmQuoteOnly=firmQuoteOnly, nbboPriceCap=nbboPriceCap,
      auctionStrategy=auctionStrategy, startingPrice=startingPrice, 
      stockRefPrice=stockRefPrice, delta=delta, 
      stockRangeLower=stockRangeLower,
      stockRangeUpper=stockRangeUpper, 
      volatility=volatility, volatilityType=volatilityType, 
      continuousUpdate=continuousUpdate,
      referencePriceType=referencePriceType,
      deltaNeutralOrderType=deltaNeutralOrderType, 
      deltaNeutralAuxPrice=deltaNeutralAuxPrice,
      basisPoints=basisPoints, basisPointsType=basisPointsType, 
      scaleInitLevelSize=scaleInitLevelSize,
      scaleSubsLevelSize=scaleSubsLevelSize,
      scalePriceIncrement=scalePriceIncrement,
      account=.jfield(ref, , "m_account"),
      settlingFirm=.jfield(ref, , "m_settlingFirm"),
      clearingAccount=.jfield(ref, , "m_clearingAccount"),
      clearingIntent=.jfield(ref, , "m_clearingIntent"),
      whatIf=whatIf,
      reference=ref),
    class="twsOrder")
}

