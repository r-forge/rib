package dev;

//import java.util.*;
//import java.io.*;
import com.ib.client.*;
//import TestJavaClient.*;
//import dev.AAD_FileWriter;
//import com.jsystemtrader.platform.*;


public class AAD_Trader implements EWrapper{

     private final String host="";
     private final int port=7496;
     private final int clientID=0;
     
     public String Msg;    // keep all the messages from the API

     private EClientSocket socket;
     
//     aad_Frame frm = new aad_Frame();
     
    public AAD_Trader(int clientID, String host, int port){
        socket = new EClientSocket(this);
        socket.eConnect(host, port, clientID);
        // IB Log levels: 1 = SYSTEM 2 = ERROR 3 = WARNING 4 = INFORMATION 5 = DETAIL
        if (!socket.isConnected()){
           System.out.println("Could not connect to TWS.");
        }
        socket.setServerLogLevel(3);
        socket.reqNewsBulletins(true);
    }
    public String getMsg(){
        return (Msg);
    }
    
    public void clearMsgBuffer(){
       this.Msg = "";
    }
    
    public void twsDisconnect(){
       socket.eDisconnect();
    }
    
    public void getHistoricalData(int strategyId, Contract contract,
      String endDateTime, String durationStr,
      String barSizeSetting, String whatToShow,
      int useRTH, int formatDate) {
//        Account.log("Requested Historical data for " + tickerId + " ending on " + endDateTime, "Info", 1);
//         while (pendingHistDataRequest) {wait();}
//         pendingHistDataRequest = true;
//        QuoteHistory qh = (QuoteHistory) historicalData.get(strategyID);
        socket.reqHistoricalData(strategyId, contract, endDateTime, durationStr,
                                 barSizeSetting, whatToShow, useRTH, formatDate);
    }
    
    public void placeOrder(int orderId, Contract contract, Order order) {
      socket.placeOrder(orderId, contract, order);  
    } 
    
    public void reqOpenOrders(){
      socket.reqOpenOrders();
    }
    
    public void reqExecutions(ExecutionFilter filter){
      socket.reqExecutions(filter);
    }
    
    public void reqAccountUpdates( boolean subscribe, String acctCode){
//      this.Msg="";  // clear the buffer   
      socket.reqAccountUpdates(subscribe, acctCode);
    }
   
    public void reqMktData(int tickerId, Contract contract, 
      String genericTickList, boolean snapshot)
    {    
      socket.reqMktData(tickerId, contract, genericTickList, snapshot);
    }
    
    public void cancelMktData(int tickerId)
    {
      socket.cancelMktData(tickerId);
    }
    
    public void closeConnection(){
      socket.eDisconnect();
    }
    
//===========================================================================//
//                        IMPLEMENT Ewrapper interface                       //
//===========================================================================//
    public void tickPrice( int tickerId, int field, double price, int canAutoExecute) {
        // received price tick
    	String msg = EWrapperMsgGenerator.tickPrice( tickerId, field, price, canAutoExecute);
        this.Msg += msg;
    }

    public void tickOptionComputation( int tickerId, int field, double impliedVol, double delta, double modelPrice, double pvDividend) {
        // received computation tick
    	String msg = EWrapperMsgGenerator.tickOptionComputation( tickerId, field, impliedVol, delta, modelPrice, pvDividend);
        this.Msg += msg; 
    }

    public void tickSize( int tickerId, int field, int size) {
        // received size tick
    	String msg = EWrapperMsgGenerator.tickSize( tickerId, field, size);
        this.Msg += msg; 
    }

    public void tickGeneric( int tickerId, int tickType, double value) {
        // received generic tick
    	String msg = EWrapperMsgGenerator.tickGeneric(tickerId, tickType, value);
        this.Msg += msg; 
    }

    public void tickString( int tickerId, int tickType, String value) {
        // received String tick
    	String msg = EWrapperMsgGenerator.tickString(tickerId, tickType, value);
        this.Msg += msg; 
    }

    public void tickEFP(int tickerId, int tickType, double basisPoints, String formattedBasisPoints,
    					double impliedFuture, int holdDays, String futureExpiry, double dividendImpact,
    					double dividendsToExpiry) {
        // received EFP tick
    	String msg = EWrapperMsgGenerator.tickEFP(tickerId, tickType, basisPoints, formattedBasisPoints,
				impliedFuture, holdDays, futureExpiry, dividendImpact, dividendsToExpiry);
        this.Msg += msg;
     }

    public void orderStatus( int orderId, String status, int filled, int remaining,
    						 double avgFillPrice, int permId, int parentId,
    						 double lastFillPrice, int clientId, String whyHeld) {
        // received order status
    	String msg = EWrapperMsgGenerator.orderStatus( orderId, status, filled, remaining,
    	        avgFillPrice, permId, parentId, lastFillPrice, clientId, whyHeld);
        this.Msg += msg;

        // make sure id for next order is at least orderId+1
//        m_orderDlg.setIdAtLeast( orderId + 1);
    }

    public void openOrder( int orderId, Contract contract, Order order, OrderState orderState) {
        // received open order
   	String msg = EWrapperMsgGenerator.openOrder( orderId, contract, order, orderState);
        this.Msg += msg;
   }

    public void contractDetails(int reqId, ContractDetails contractDetails)
    {
    	String msg = EWrapperMsgGenerator.contractDetails( reqId, contractDetails);
        this.Msg += msg;
//    	m_TWS.add(msg);
    }
    
    public void contractDetailsEnd(int reqId) {
  	String msg = EWrapperMsgGenerator.contractDetailsEnd(reqId);
        this.Msg += msg;
//		m_TWS.add(msg);
	}

    public void scannerData(int reqId, int rank, ContractDetails contractDetails,
                            String distance, String benchmark, String projection, String legsStr) {
    	String msg = EWrapperMsgGenerator.scannerData(reqId, rank, contractDetails, distance,
    			benchmark, projection, legsStr);
        this.Msg += msg; //       m_tickers.add(msg);
    }
    
    public void scannerDataEnd(int reqId) {
    	String msg = EWrapperMsgGenerator.scannerDataEnd(reqId);
        this.Msg += msg;
 //   	m_tickers.add(msg);
    }

    public void bondContractDetails(int reqId, ContractDetails contractDetails)
    {
    	String msg = EWrapperMsgGenerator.contractDetails( reqId, contractDetails);
        this.Msg += msg;//    	m_TWS.add(msg);
    }

    public void execDetails(int orderId, Contract contract, Execution execution){
   	String msg = EWrapperMsgGenerator.execDetails(orderId, contract, execution);
        this.Msg += msg;//   	m_TWS.add(msg);
    }

    public void updateMktDepth( int tickerId, int position, int operation,
                    int side, double price, int size) {
//        m_mktDepthDlg.updateMktDepth( tickerId, position, "", operation, side, price, size);
    }

    public void updateMktDepthL2( int tickerId, int position, String marketMaker,
                    int operation, int side, double price, int size) {
 //       m_mktDepthDlg.updateMktDepth( tickerId, position, marketMaker, operation, side, price, size);
    }

    public void nextValidId( int orderId) {
        // received next valid order id
    	String msg = EWrapperMsgGenerator.nextValidId( orderId);
        this.Msg += msg;//       m_TWS.add(msg) ;
 //       m_orderDlg.setIdAtLeast( orderId);
    }

    public void error(Exception ex) {
        // do not report exceptions if we initiated disconnect
//        if (!m_disconnectInProgress) { 
        String msg = EWrapperMsgGenerator.error(ex);
        this.Msg += msg;//            Main.inform( this, msg);            
 //       }
    }

    public void error( String str) {
    	String msg = EWrapperMsgGenerator.error(str);
        this.Msg += msg;//       m_errors.add( msg);
    }

    public void error( int id, int errorCode, String errorMsg) {
        // received error
    	String msg = EWrapperMsgGenerator.error(id, errorCode, errorMsg);
        this.Msg += msg;
//        m_errors.add( msg);
 //       for (int ctr=0; ctr < faErrorCodes.length; ctr++) {
 //           faError |= (errorCode == faErrorCodes[ctr]);
 //       }
 //       if (errorCode == MktDepthDlg.MKT_DEPTH_DATA_RESET) {
//            m_mktDepthDlg.reset();
//        }
    }

    public void connectionClosed() {
        String msg = EWrapperMsgGenerator.connectionClosed();
        this.Msg += msg;//       Main.inform( this, msg);
    }

    public void updateAccountValue(String key, String value,
                                   String currency, String accountName) {
      String msg = EWrapperMsgGenerator.updateAccountValue(key, value, currency, accountName);
      this.Msg += msg;
    }

    public void updatePortfolio(Contract contract, int position, double marketPrice,
        double marketValue, double averageCost, double unrealizedPNL, double realizedPNL,
        String accountName) {
      String msg =  EWrapperMsgGenerator.updatePortfolio(contract, position, marketPrice, marketValue,
            averageCost, unrealizedPNL, realizedPNL, accountName);
      this.Msg += msg;
    }

    public void updateAccountTime(String timeStamp) {
      String msg = EWrapperMsgGenerator.updateAccountTime(timeStamp);
      this.Msg += msg;
    }

    public void updateNewsBulletin( int msgId, int msgType, String message, String origExchange) {
        String msg = EWrapperMsgGenerator.updateNewsBulletin(msgId, msgType, message, origExchange);
        this.Msg += msg;//        JOptionPane.showMessageDialog(this, msg, "IB News Bulletin", JOptionPane.INFORMATION_MESSAGE);
    }

    public void managedAccounts( String accountsList) {
 //       m_bIsFAAccount = true;
 //       m_FAAcctCodes = accountsList;
 //       String msg = EWrapperMsgGenerator.managedAccounts(accountsList);
 //       m_TWS.add( msg);
    }

    public void historicalData(int reqId, String date, double open, double high, double low,
                               double close, int volume, int count, double WAP, boolean hasGaps) {
        String msg = EWrapperMsgGenerator.historicalData(reqId, date, open, high, low, close, volume, count, WAP, hasGaps);
        this.Msg = this.Msg + "\n" + msg; 
    }
    public void realtimeBar(int reqId, long time, double open, double high, double low, double close, long volume, double wap, int count) {
		String msg = EWrapperMsgGenerator.realtimeBar(reqId, time, open, high, low, close, volume, wap, count);
  //      m_tickers.add( msg );
	}
    public void scannerParameters(String xml) {
//        displayXML(EWrapperMsgGenerator.SCANNER_PARAMETERS, xml);
    }
    
    public void currentTime(long time) {
	String msg = EWrapperMsgGenerator.currentTime(time);
        this.Msg += msg;//	m_TWS.add(msg);
    }
    public void fundamentalData(int reqId, String data) {
	String msg = EWrapperMsgGenerator.fundamentalData(reqId, data);
        this.Msg += msg;//		m_tickers.add(msg);
    }

//    void displayXML(String title, String xml) {
//  //      m_TWS.add(title);
//  //      m_TWS.addText(xml);
//    }
   public void receiveFA(int faDataType, String xml) {
//        displayXML(EWrapperMsgGenerator.FINANCIAL_ADVISOR + " " + EClientSocket.faMsgTypeName(faDataType), xml);
//      switch (faDataType) {
//        case EClientSocket.GROUPS:
//          faGroupXML = xml ;
//          break ;
//        case EClientSocket.PROFILES:
//          faProfilesXML = xml ;
//          break ;
//        case EClientSocket.ALIASES:
//          faAliasesXML = xml ;
//          break ;
//      }

//      if (!faError &&
//          !(faGroupXML == null || faProfilesXML == null || faAliasesXML == null)) {
//          FinancialAdvisorDlg dlg = new FinancialAdvisorDlg(this);
//          dlg.receiveInitialXML(faGroupXML, faProfilesXML, faAliasesXML);
//          dlg.show();

//          if (!dlg.m_rc) {
//            return;
//          }

 //         m_client.replaceFA( EClientSocket.GROUPS, dlg.groupsXML );
//          m_client.replaceFA( EClientSocket.PROFILES, dlg.profilesXML );
//          m_client.replaceFA( EClientSocket.ALIASES, dlg.aliasesXML );
//
//      }
    }

}
