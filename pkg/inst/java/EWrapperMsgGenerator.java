package com.ib.client;

import java.text.DateFormat;
import java.util.Date;

public class EWrapperMsgGenerator extends AnyWrapperMsgGenerator {
    public static final String SCANNER_PARAMETERS = "SCANNER PARAMETERS:";
    public static final String FINANCIAL_ADVISOR = "FA:";
   
    static public String tickPrice( int tickerId, int field, double price, int canAutoExecute) {
    	return "id='" + tickerId + "' " + TickType.getField( field) + "='" + price + "' " + 
        ((canAutoExecute != 0) ? " canAutoExecute " : " noAutoExecute ");
    }
	
    static public String tickSize( int tickerId, int field, int size) {
    	return "id='" + tickerId + "' " + TickType.getField( field) + "='" + size + "' ";
    }
    
    static public String tickOptionComputation( int tickerId, int field, double impliedVol,
    		double delta, double modelPrice, double pvDividend) {
    	String toAdd = "id='" + tickerId + "' " + TickType.getField( field) +
	  "' ivol='" + ((impliedVol >= 0 && impliedVol != Double.MAX_VALUE) ? Double.toString(impliedVol) : "NA") +
	  "' delta='" + ((Math.abs(delta) <= 1) ? Double.toString(delta) : "NA") + "' ";
    	if (field == TickType.MODEL_OPTION) {
 	  toAdd += "modelPrice='" + ((modelPrice >= 0 && modelPrice != Double.MAX_VALUE) ? Double.toString(modelPrice) : "NA");
    	  toAdd += "' pvDividend='" + ((pvDividend >= 0 && pvDividend != Double.MAX_VALUE) ? Double.toString(pvDividend) : "NA") + 
                   "' ";
    	}
	return toAdd;
    }
    
    static public String tickGeneric(int tickerId, int tickType, double value) {
    	return "id='" + tickerId + "' " + TickType.getField( tickType) + "='" + value + "' ";
    }
    
    static public String tickString(int tickerId, int tickType, String value) {
    	return "id='" + tickerId + "' " + TickType.getField( tickType) + "='" + value + "' ";
    }
    
    static public String tickEFP(int tickerId, int tickType, double basisPoints,
			String formattedBasisPoints, double impliedFuture, int holdDays,
			String futureExpiry, double dividendImpact, double dividendsToExpiry) {
    	return "id='" + tickerId + "' " + TickType.getField(tickType)
		+ ":basisPoints='" + basisPoints + "/" + formattedBasisPoints
		+ "' impliedFuture='" + impliedFuture + "' holdDays='" + holdDays 
		+ "' futureExpiry='" + futureExpiry + "' dividendImpact='" + dividendImpact
		+ "' dividendsToExpiry='" + dividendsToExpiry + "'";
    }
    
    static public String orderStatus( int orderId, String status, int filled, int remaining,
            double avgFillPrice, int permId, int parentId, double lastFillPrice,
            int clientId, String whyHeld) {
    	return "<OS>orderId='" + orderId + "' clientId='" + clientId + "' permId='" + permId +
        "' status='" + status + "' filled='" + filled + "' remaining='" + remaining +
        "' avgFillPrice='" + avgFillPrice + "' lastFillPrice='" + lastFillPrice +
        "' parentId='" + parentId + "' whyHeld='" + whyHeld + "'</OS>";
    }
    
    static public String openOrder( int orderId, Contract contract, Order order, OrderState orderState) {
        String msg = "<OO>orderId='" + orderId +
        "' action='" + order.m_action +
        "' quantity='" + order.m_totalQuantity +
        "' symbol='" + contract.m_symbol +
        "' exchange='" + contract.m_exchange +
        "' secType='" + contract.m_secType +
        "' type='" + order.m_orderType +
        "' lmtPrice='" + order.m_lmtPrice +
        "' auxPrice='" + order.m_auxPrice +
        "' TIF='" + order.m_tif +
        "' localSymbol='" + contract.m_localSymbol +
        "' client Id='" + order.m_clientId +
        "' parent Id='" + order.m_parentId +
        "' permId='" + order.m_permId +
        "' outsideRth='" + order.m_outsideRth +
        "' hidden='" + order.m_hidden +
        "' discretionaryAmt='" + order.m_discretionaryAmt +
        "' triggerMethod='" + order.m_triggerMethod +
        "' goodAfterTime='" + order.m_goodAfterTime +
        "' goodTillDate='" + order.m_goodTillDate +
        "' faGroup='" + order.m_faGroup +
        "' faMethod='" + order.m_faMethod +
        "' faPercentage='" + order.m_faPercentage +
        "' faProfile='" + order.m_faProfile +
        "' shortSaleSlot='" + order.m_shortSaleSlot +
        "' designatedLocation='" + order.m_designatedLocation +
        "' ocaGroup='" + order.m_ocaGroup +
        "' ocaType='" + order.m_ocaType +
        "' rule80A='" + order.m_rule80A +
        "' allOrNone='" + order.m_allOrNone +
        "' minQty='" + order.m_minQty +
        "' percentOffset='" + order.m_percentOffset +
        "' eTradeOnly='" + order.m_eTradeOnly +
        "' firmQuoteOnly='" + order.m_firmQuoteOnly +
        "' nbboPriceCap='" + order.m_nbboPriceCap +
        "' auctionStrategy='" + order.m_auctionStrategy +
        "' startingPrice='" + order.m_startingPrice +
        "' stockRefPrice='" + order.m_stockRefPrice +
        "' delta='" + order.m_delta +
        "' stockRangeLower='" + order.m_stockRangeLower +
        "' stockRangeUpper='" + order.m_stockRangeUpper +
        "' volatility='" + order.m_volatility +
        "' volatilityType='" + order.m_volatilityType +
        "' deltaNeutralOrderType='" + order.m_deltaNeutralOrderType +
        "' deltaNeutralAuxPrice='" + order.m_deltaNeutralAuxPrice +
        "' continuousUpdate='" + order.m_continuousUpdate +
        "' referencePriceType='" + order.m_referencePriceType +
        "' trailStopPrice='" + order.m_trailStopPrice +
        "' scaleInitLevelSize='" + Util.IntMaxString(order.m_scaleInitLevelSize) +
        "' scaleSubsLevelSize='" + Util.IntMaxString(order.m_scaleSubsLevelSize) +
        "' scalePriceIncrement='" + Util.DoubleMaxString(order.m_scalePriceIncrement) +
        "' account='" + order.m_account +
        "' settlingFirm='" + order.m_settlingFirm +
        "' clearingAccount='" + order.m_clearingAccount +
        "' clearingIntent='" + order.m_clearingIntent +
        "' whatIf='" + order.m_whatIf
        ;

        if ("BAG".equals(contract.m_secType)) {
        	if (contract.m_comboLegsDescrip != null) {
        		msg += "' comboLegsDescrip='" + contract.m_comboLegsDescrip;
        	}
        	if (order.m_basisPoints != Double.MAX_VALUE) {
        		msg += "' basisPoints='" + order.m_basisPoints;
        		msg += "' basisPointsType='" + order.m_basisPointsType;
        	}
        }
        
    	if (contract.m_underComp != null) {
    		UnderComp underComp = contract.m_underComp;
    		msg +=
    			"' underComp.conId='" + underComp.m_conId +
    			"' underComp.delta='" + underComp.m_delta +
    			"' underComp.price='" + underComp.m_price ;
    	}
    
        String orderStateMsg =
        	"' status='" + orderState.m_status
        	+ "' initMargin='" + orderState.m_initMargin
        	+ "' maintMargin='" + orderState.m_maintMargin
        	+ "' equityWithLoan='" + orderState.m_equityWithLoan
        	+ "' commission='" + Util.DoubleMaxString(orderState.m_commission)
        	+ "' minCommission='" + Util.DoubleMaxString(orderState.m_minCommission)
        	+ "' maxCommission='" + Util.DoubleMaxString(orderState.m_maxCommission)
        	+ "' commissionCurrency='" + orderState.m_commissionCurrency
        	+ "' warningText='" + orderState.m_warningText + "'"
		;

        return msg + orderStateMsg + "</OO>";
    }
    
    static public String updateAccountValue(String key, String value, String currency, String accountName) {
    	return "<uAV>key='" + key + "' value='" + value + "' currency='" + currency + "' accountName='" 
                + accountName + "'</uAV>";
    }
    
    static public String updatePortfolio(Contract contract, int position, double marketPrice,
    									 double marketValue, double averageCost, double unrealizedPNL,
    									 double realizedPNL, String accountName) {
      String msg = "<uP>" + contractMsg(contract) + " position='"
        + position + "' marketPrice='" + marketPrice + "' marketValue='" + marketValue 
        + "' averageCost='" + averageCost + "' unrealizedPNL='" 
        + unrealizedPNL + "' realizedPNL='"
        + realizedPNL + "' accountName='" + accountName + "'</uP>";
      return msg;
    }
    
    static public String updateAccountTime(String timeStamp) {
    	return "<uAT>" + timeStamp + "</uAT>";
    }
    
    static public String nextValidId( int orderId) {
    	return "Next Valid Order ID: " + orderId;
    }
    
    static public String contractDetails(int reqId, ContractDetails contractDetails) {
    	Contract contract = contractDetails.m_summary;
    	String msg = "<CD>reqId='" + reqId + "'" + contractMsg(contract) 
          + contractDetailsMsg(contractDetails) + "</CD>";
    	return msg;
    }
    
    private static String contractDetailsMsg(ContractDetails contractDetails) {
    	String msg = "marketName='" + contractDetails.m_marketName 
        + "' tradingClass='" + contractDetails.m_tradingClass 
        + "' minTick='" + contractDetails.m_minTick 
        + "' priceMagnifier='" + contractDetails.m_priceMagnifier 
        + "' orderTypes='" + contractDetails.m_orderTypes 
        + "' validExchanges='" + contractDetails.m_validExchanges + "'";
    	return msg;
    }
    
    static public String contractMsg(Contract contract) {
      String msg = "conid='" + contract.m_conId 
        + "' symbol='" + contract.m_symbol 
        + "' secType='" + contract.m_secType 
        + "' expiry='" + contract.m_expiry 
        + "' strike='" + contract.m_strike 
        + "' right='" + contract.m_right 
        + "' multiplier='" + contract.m_multiplier 
        + "' exchange='" + contract.m_exchange 
        + "' primaryExch='" + contract.m_primaryExch 
        + "' currency='" + contract.m_currency 
        + "' localSymbol='" + contract.m_localSymbol + "'";
      return msg;
    }
	
    static public String bondContractDetails(int reqId, ContractDetails contractDetails) {
        Contract contract = contractDetails.m_summary;
        String msg = "reqId = " + reqId + " ===================================\n"	
        + " ---- Bond Contract Details begin ----\n"
        + "symbol = " + contract.m_symbol + "\n"
        + "secType = " + contract.m_secType + "\n"
        + "cusip = " + contractDetails.m_cusip + "\n"
        + "coupon = " + contractDetails.m_coupon + "\n"
        + "maturity = " + contractDetails.m_maturity + "\n"
        + "issueDate = " + contractDetails.m_issueDate + "\n"
        + "ratings = " + contractDetails.m_ratings + "\n"
        + "bondType = " + contractDetails.m_bondType + "\n"
        + "couponType = " + contractDetails.m_couponType + "\n"
        + "convertible = " + contractDetails.m_convertible + "\n"
        + "callable = " + contractDetails.m_callable + "\n"
        + "putable = " + contractDetails.m_putable + "\n"
        + "descAppend = " + contractDetails.m_descAppend + "\n"
        + "exchange = " + contract.m_exchange + "\n"
        + "currency = " + contract.m_currency + "\n"
        + "marketName = " + contractDetails.m_marketName + "\n"
        + "tradingClass = " + contractDetails.m_tradingClass + "\n"
        + "conid = " + contract.m_conId + "\n"
        + "minTick = " + contractDetails.m_minTick + "\n"
        + "orderTypes = " + contractDetails.m_orderTypes + "\n"
        + "validExchanges = " + contractDetails.m_validExchanges + "\n"
        + "nextOptionDate = " + contractDetails.m_nextOptionDate + "\n"
        + "nextOptionType = " + contractDetails.m_nextOptionType + "\n"
        + "nextOptionPartial = " + contractDetails.m_nextOptionPartial + "\n"
        + "notes = " + contractDetails.m_notes + "\n"
        + " ---- Bond Contract Details End ----\n";
        return msg;
    }
    
    static public String contractDetailsEnd(int reqId) {
    	return "reqId = " + reqId + " =============== end ===============";
    }
    
    static public String execDetails( int orderId, Contract contract, Execution execution) {
        String msg = "<ED>"
        + "orderId='" + Integer.toString(orderId) 
        + "' clientId='" + Integer.toString(execution.m_clientId) 
        + "' symbol='" + contract.m_symbol 
        + "' secType='" + contract.m_secType 
        + "' expiry='" + contract.m_expiry 
        + "' strike='" + contract.m_strike 
        + "' right='" + contract.m_right 
        + "' contractExchange='" + contract.m_exchange 
        + "' currency='" + contract.m_currency 
        + "' localSymbol='" + contract.m_localSymbol 
        + "' execId='" + execution.m_execId 
        + "' time='" + execution.m_time 
        + "' acctNumber='" + execution.m_acctNumber 
        + "' executionExchange='" + execution.m_exchange 
        + "' side='" + execution.m_side 
        + "' shares='" + execution.m_shares 
        + "' price='" + execution.m_price 
        + "' permId='" + execution.m_permId 
        + "' liquidation='" + execution.m_liquidation 
        + "' cumQty='" + execution.m_cumQty 
        + "' avgPrice='" + execution.m_avgPrice + "'</ED>";
        return msg;
    }
    
    static public String updateMktDepth( int tickerId, int position, int operation, int side,
    									 double price, int size) {
    	return "updateMktDepth: " + tickerId + " " + position + " " + operation + " " + side + " " + price + " " + size;
    }
    
    static public String updateMktDepthL2( int tickerId, int position, String marketMaker,
    									   int operation, int side, double price, int size) {
    	return "updateMktDepth: " + tickerId + " " + position + " " + marketMaker + " " + operation + " " + side + " " + price + " " + size;
    }
    
    static public String updateNewsBulletin( int msgId, int msgType, String message, String origExchange) {
    	return "MsgId=" + msgId + " :: MsgType=" + msgType +  " :: Origin=" + origExchange + " :: Message=" + message;
    }
    
    static public String managedAccounts( String accountsList) {
    	return "Connected : The list of managed accounts are : [" + accountsList + "]";
    }
    
    static public String receiveFA(int faDataType, String xml) {
    	return FINANCIAL_ADVISOR + " " + EClientSocket.faMsgTypeName(faDataType) + " " + xml;
    }
    
    static public String historicalData(int reqId, String date, double open, double high, double low,
                      					double close, int volume, int count, double WAP, boolean hasGaps) {
    	return "id='" + reqId +
        "' date='" + date +
        "' Open='" + open +
        "' High='" + high +
        "' Low='" + low +
        "' Close='" + close +
        "' Volume='" + volume +
        "' Count='" + count +
        "' WAP='" + WAP +
        "' hasGaps='" + hasGaps + "'";
    }
	public static String realtimeBar(int reqId, long time, double open,
			double high, double low, double close, long volume, double wap, int count) {
        return "id=" + reqId +
        " time = " + time +
        " open=" + open +
        " high=" + high +
        " low=" + low +
        " close=" + close +
        " volume=" + volume +
        " count=" + count +
        " WAP=" + wap;
	}
	
    static public String scannerParameters(String xml) {
    	return SCANNER_PARAMETERS + "\n" + xml;
    }
    
    static public String scannerData(int reqId, int rank, ContractDetails contractDetails,
    								 String distance, String benchmark, String projection,
    								 String legsStr) {
        Contract contract = contractDetails.m_summary;
    	return "id = " + reqId +
        " rank=" + rank +
        " symbol=" + contract.m_symbol +
        " secType=" + contract.m_secType +
        " expiry=" + contract.m_expiry +
        " strike=" + contract.m_strike +
        " right=" + contract.m_right +
        " exchange=" + contract.m_exchange +
        " currency=" + contract.m_currency +
        " localSymbol=" + contract.m_localSymbol +
        " marketName=" + contractDetails.m_marketName +
        " tradingClass=" + contractDetails.m_tradingClass +
        " distance=" + distance +
        " benchmark=" + benchmark +
        " projection=" + projection +
        " legsStr=" + legsStr;
    }
    
    static public String scannerDataEnd(int reqId) {
    	return "id = " + reqId + " =============== end ===============";
    }
    
    static public String currentTime(long time) {
		return "current time = " + time +
		" (" + DateFormat.getDateTimeInstance().format(new Date(time * 1000)) + ")";
    }

    static public String fundamentalData(int reqId, String data) {
		return "id  = " + reqId + " len = " + data.length() + '\n' + data;
    }           
            
            
            
}

