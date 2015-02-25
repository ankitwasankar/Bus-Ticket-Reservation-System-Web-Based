package com.cognizant.helper;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.cognizant.controller.LoginFormController;

public class Validate {

	final public static Logger logger = Logger.getLogger(Validate.class);
	public static boolean phoneNumber(String phoneNumber) {
		int len = phoneNumber.length();
		if (len == 10) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean email(String email) {
		String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
		if (email.matches(EMAIL_REGEX)) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean length(String str, int minLen, int maxLen) {
		if (str.length() > minLen && str.length() < maxLen) {
			return true;
		} else {
			return false;
		}
	}

	public static String validateLogin(String username, String password) {
		String msg = "";
		logger.setLevel(Level.INFO);
		logger.info("Validation for "+username+" : ");
		if (username.equalsIgnoreCase("") || username == null) {
			msg = msg + "username should not be blank\n";
			logger.info(msg);
			return msg;
		} else if (password.equalsIgnoreCase("") || password == null) {
			msg = msg + "password should not be blank\n";
			logger.info(msg);
			return msg;
		} else if (!Validate.email(username)) {
			msg = msg + "username must be valid email\n";
			logger.info(msg);
			return msg;
		} else if (!Validate.length(username, 2, 40)) {
			msg = msg + "username must be between 2 to 40 character\n";
			logger.info(msg);
			return msg;
		} else if (!Validate.length(password, 4, 20)) {
			msg = msg + "password must be between 5 to 20 character\n";
			logger.info(msg);
			return msg;
		} else {
			logger.info(msg);
			return msg;
		}
	}

	public static String validateUserProfile(String fname, String lname,
			String address, String city, String email, String phone) {
		String msg = "";
		logger.info("Validation for "+email+" : ");
		if (fname.equalsIgnoreCase("") || fname == null) {
			msg = msg + "first name should not be blank\n";
			logger.info(msg);
			return msg;
		} else if (address.equalsIgnoreCase("") || address == null) {
			msg = msg + "address should not be blank\n";
			logger.info(msg);
			return msg;
		} else if (city.equalsIgnoreCase("") || city == null) {
			msg = msg + "city should not be blank\n";
			logger.info(msg);
			return msg;
		} else if (email.equalsIgnoreCase("") || email == null) {
			msg = msg + "email should not be blank\n";
			logger.info(msg);
			return msg;
		} else if (phone.equalsIgnoreCase("") || phone == null) {
			msg = msg + "phone should not be blank\n";
			logger.info(msg);
			return msg;
		} else if (!Validate.phoneNumber(phone)) {
			msg = msg + "phone number is 10 digit only\n";
			logger.info(msg);
			return msg;
		} else if (!Validate.email(email)) {
			msg = msg + "username must be valid email\n";
			logger.info(msg);
			return msg;
		}

		return msg;
	}

	public static String validateBusOperatorProfile(String fname,
			String address, String city, String email, String phone) {
		String msg = "";
		logger.info("Validation for "+email+" : ");
		if (fname.equalsIgnoreCase("") || fname == null) {
			msg = msg + "first name should not be blank\n";
			logger.info(msg);
			return msg;
		} else if (address.equalsIgnoreCase("") || address == null) {
			msg = msg + "address should not be blank\n";
			logger.info(msg);
			return msg;
		} else if (city.equalsIgnoreCase("") || city == null) {
			msg = msg + "city should not be blank\n";
			logger.info(msg);
			logger.info(msg);
			return msg;
		} else if (email.equalsIgnoreCase("") || email == null) {
			msg = msg + "email should not be blank\n";
			logger.info(msg);
			return msg;
		} else if (phone.equalsIgnoreCase("") || phone == null) {
			msg = msg + "phone should not be blank\n";
			logger.info(msg);
			return msg;
		} else if (!Validate.phoneNumber(phone)) {
			msg = msg + "phone number is 10 digit only\n";
			logger.info(msg);
			return msg;
		} else if (!Validate.email(email)) {
			msg = msg + "username must be valid email\n";
			logger.info(msg);
			return msg;
		}
		logger.info(msg);
		return msg;
	}

}
