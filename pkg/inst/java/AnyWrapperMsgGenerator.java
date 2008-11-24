package com.ib.client;

public class AnyWrapperMsgGenerator {
    public static String error( Exception ex) { return "Error - " + ex;}
    public static String error( String str) { return str;}

	public static String error(int id, int errorCode, String errorMsg) {
		String err = "ERROR: (id=" + Integer.toString(id);
        err += ") | (code=";
        err += Integer.toString(errorCode);
        err += ") | ";
        err += errorMsg;
        return err;
	}

	public static String connectionClosed() {
		return "Connection Closed";
	}
}
