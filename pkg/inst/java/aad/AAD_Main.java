/*
 * 
 *
 */
 
//import TestJavaClient.*;
import com.ib.client.*;
import dev.AAD_Trader;
import java.util.Vector;

public class AAD_Main{
    
  public static void main(String[] args){

//      AAD_FileWriter writer;      
      Contract ctr = new Contract();
      ctr.m_symbol      = "YHOO";
      ctr.m_secType     = "STK";      // "OPT"
      ctr.m_expiry      = "";         // "200901"
      ctr.m_strike      = 0;          // 15.0
      ctr.m_right       = "";         // "PUT"
      ctr.m_multiplier  = "1";        // "100" 
      ctr.m_exchange    = "SMART";
      ctr.m_currency    = "USD";
      ctr.m_localSymbol = null;
      ctr.m_comboLegs   = new Vector();
      ctr.m_primaryExch = "SMART";  
     
      Order ord = new Order();
      ord.m_action  = "SELL";
      ord.m_totalQuantity = 100;
      ord.m_orderType = "LMT";
      ord.m_lmtPrice = 13.80;
      ord.m_auxPrice = 0;
      ord.m_goodAfterTime = "";
      ord.m_goodTillDate = "";
      ord.m_transmit = true;
      
      
      AAD_Trader trd = new AAD_Trader(1, "", 7496);
 //     trd.getHistoricalData(1, ctr, "20081007 00:00:00 GMT", 
 //         "10 D", "1 day", "MIDPOINT", 1, 1); 
 //     trd.reqAccountUpdates(true, "dragu554");
      
      trd.placeOrder(3, ctr, ord);
      
      try {
        Thread.sleep(10000);
      } catch (InterruptedException e){
        System.out.println("Exception main thread interrupted");
      }
      String Msg = trd.getMsg();
 //     trd.reqAccountUpdates(false, "dragu554");
      
      System.out.println(Msg);
//      sleep(2000);
//      trd.eDisconnect();
      System.out.println("Done!"); 
       
  }

}
