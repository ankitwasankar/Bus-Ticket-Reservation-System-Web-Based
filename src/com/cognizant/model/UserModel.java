package com.cognizant.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.cognizant.helper.returnClass;
import com.cognizant.library.DBConnector;
import com.cognizant.library.IDGenerator;

public class UserModel {
	public String userID;
	public String firstName;
	public String lastName;
	public String address;
	public String city;
	public String email;
	public String phoneNumber;
	public String password;
	private String oldPassword;
	private String securityQuestion;

	private String securityAnswer;

	final public static Logger logger = Logger.getLogger(UserModel.class);

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public void setSecurityAnswer(String securityAnswer) {
		this.securityAnswer = securityAnswer;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// insert registration details into user table
	public boolean insertRegistrationData() throws SQLException {
		// this.userID=generateUserId();
		String table = "user";
		String column = "userId";
		IDGenerator idg = new IDGenerator();
		this.userID = idg.generateId(column, table);
		String query = "insert into user values('" + this.userID + "','"
				+ this.firstName + "','" + this.lastName + "','" + this.address
				+ "','" + this.city + "','" + this.email + "',"
				+ this.phoneNumber + ",'" + this.password + " ','"
				+ this.securityQuestion + "','" + this.securityAnswer + "' ); ";

		int numRows = 0;
		DBConnector dbc = new DBConnector();
		try {
			logger.setLevel(Level.INFO);
			logger.info("query fired is: " + query);
			numRows = dbc.fireExecuteUpdate(query);
		} catch (Exception e) {
			System.out.println("Email already in use");
			// MainClass.homePage();
		}

		dbc.close();
		if (numRows > 0) {
			return true;
		} else {
			return false;
		}
	}

	// select tuples for matching user-name
	public ResultSet selectLoginData() throws SQLException {
		ResultSet rs = null;
		String query = "select * from user where EMail='" + this.email
				+ "' and Password='" + this.password + "';";
		DBConnector dbc = new DBConnector();
		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		rs = dbc.fireExecuteQuery(query);
		return rs;
	}

	public boolean selectLoginData1() throws SQLException {
		ResultSet rs = null;
		String query = "select * from user where EMail='" + this.email
				+ "' and Password='" + this.password + "';";
		DBConnector dbc = new DBConnector();
		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		rs = dbc.fireExecuteQuery(query);
		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}

	// update user profile details
	public boolean updateUserProfileData() {
		String query = "update user set FirstName = '" + this.firstName
				+ "', LastName = '" + this.lastName + "', Address = '"
				+ this.address + "', City = '" + this.city
				+ "', PhoneNumber ='" + this.phoneNumber + "'"
				+ " where userID='" + this.userID + "';";
		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		DBConnector dbc = new DBConnector();
		int numRows = dbc.fireExecuteUpdate(query);
		if (numRows > 0) {
			dbc.close();
			return true;
		} else {
			dbc.close();
			return false;
		}
	}

	public boolean updatePassword() {
		String query = "update user set password='" + this.password
				+ "' where userID='" + this.userID + "' and password='"
				+ this.oldPassword + "';";
		DBConnector dbc = new DBConnector();
		int numRows = dbc.fireExecuteUpdate(query);
		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		if (numRows >= 1) {
			dbc.close();
			return true;
		} else {
			dbc.close();
			return false;
		}
	}

	public boolean deleteRow() {
		DBConnector dbc = new DBConnector();
		String query = "delete from user where userID='" + this.userID + "';";
		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		int numRows = dbc.fireExecuteUpdate(query);
		if (numRows >= 1) {
			dbc.close();
			return true;
		} else {
			dbc.close();
			return false;
		}
	}

	public boolean updatePasswordByEMail() {
		DBConnector dbc = new DBConnector();
		String query = "update user set password = '" + this.password
				+ "'where email='" + this.email + "'";
		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		int numRows = dbc.fireExecuteUpdate(query);
		if (numRows >= 1) {
			dbc.close();
			return true;
		} else {
			dbc.close();
			return false;
		}
	}

	public boolean deleteUserAccount() {
		DBConnector dbc = new DBConnector();
		
		String query = "delete from user where email='" + this.email + "'";

		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		int numRows = dbc.fireExecuteUpdate(query);
		if (numRows >= 1) {
			dbc.close();
			return true;
		} else {
			dbc.close();
			return false;
		}
	}

	public ResultSet showUserBookings() {
		DBConnector dbc = new DBConnector();
		String query = "select * from booking where userId = '" + this.email
				+ "'";
		System.out.println(query);
		ResultSet rs = dbc.fireExecuteQuery(query);
		return rs;
	}

	public String getUserIDFromEmail(String parameter) throws SQLException {
		// TODO Auto-generated method stub
		DBConnector dbc = new DBConnector();
		ResultSet rs = null;
		String query = "select userid from user where email = \"" + parameter
				+ "\"";
		rs = dbc.fireExecuteQuery(query);
		String userid = "";
		while (rs.next()) {
			userid = rs.getString(1);
		}
		return userid;
	}

	public ResultSet getUserData() {
		ResultSet rs = null;
		DBConnector dbc = new DBConnector();
		String query = "select * from user where userid='" + this.userID + "';";
		System.out.println(query);
		rs = dbc.fireExecuteQuery(query);
		return rs;
	}

	public String getSQ() throws SQLException {
		ResultSet rs = null;
		String str = "";
		String query = "select securityQusetion from user where email='"
				+ this.email + "';";
		DBConnector dbc = new DBConnector();

		rs = dbc.fireExecuteQuery(query);
		System.out.println(query);
		while (rs.next()) {
			str = rs.getString(1);
		}
		rs.close();
		return str;
	}

	public String checkAnswer() throws SQLException {
		String pass="";
		ResultSet rs = null;
		
		String query = "select password from user where email='"+this.email+"' and securityAnswer='"+this.securityAnswer+"'";
		System.out.println(query);
		
		DBConnector dbc = new DBConnector();
		rs= dbc.fireExecuteQuery(query);
		while(rs.next()){
			pass=rs.getString(1);
		}
		rs.close();
		return pass;
	}

}
