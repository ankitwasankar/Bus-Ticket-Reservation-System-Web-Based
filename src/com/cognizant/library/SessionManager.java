package com.cognizant.library;

import java.sql.SQLException;

import com.cognizant.model.SessionManagerModel;

public class SessionManager {

	public static String userID;
	public static String userEMail;
	public static String userPhoneNumber;

	public SessionManager() {
		SessionManager.userID = "NA";
		SessionManager.userEMail = "NA";
		SessionManager.userPhoneNumber = "NA";
	}

	public static void setSession(String email, String who) throws SQLException {
		SessionManager.userEMail = email;
		if (who.equalsIgnoreCase("user")) {
			SessionManagerModel sm = new SessionManagerModel();
			sm.getUserIDFromEmail(email);
		}		
		else {
			SessionManagerModel sm = new SessionManagerModel();
			sm.getBusOperatorIDFromEmail(email);
		}
	}

	public static void setUserID(String userID) {
		SessionManager.userID = userID;
	}

	public static void setUserEMail(String userEMail) {
		SessionManager.userEMail = userEMail;
	}

	public static void setUserPhoneNumber(String userPhoneNumber) {
		SessionManager.userPhoneNumber = userPhoneNumber;
	}

}
