package com.cognizant.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cognizant.helper.returnClass;
import com.cognizant.library.DBConnector;
import com.cognizant.library.IDGenerator;
import com.cognizant.library.SessionManager;

public class BusOperatorModel {

	private String operatorID;
	private String opeartorName;
	private String address;
	private String email;
	private String city;
	private String phoneNumber;
	private String password;
	private String oldPassword;
	private String name;

	public void setName(String name) {
		this.name = name;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public returnClass insertRegistrationData() {
		IDGenerator idg = new IDGenerator();
		DBConnector dbc = new DBConnector();
		int success = 0;
		returnClass r = new returnClass();
		this.operatorID = idg.generateId("OperatorId", "busoperator");
		r.setS(this.operatorID);
		PreparedStatement pstmt = null;

		String query = "insert into busoperator(OperatorId,OperatorName,Address,EMail,City,PhoneNumber,Password) values(?,?,?,?,?,?,?)";

		try {
			pstmt = dbc.fireExecuteQueryPrepare(query);
			pstmt.setString(1, this.operatorID);
			pstmt.setString(2, this.opeartorName);
			pstmt.setString(3, this.address);
			pstmt.setString(4, this.email);
			pstmt.setString(5, this.city);
			pstmt.setString(6, this.phoneNumber);
			pstmt.setString(7, this.password);

			success = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		finally {
			try {
				;

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}

		if (success >= 1) {
			r.setB(true);
		} else {
			r.setB(false);
		}
		return r;

	}

	// select tuples for matching user-name
	public boolean selectLoginData() throws SQLException {
		DBConnector dbc = new DBConnector();
		ResultSet rs = null;
		boolean result = false;
		String query = "select * from busoperator where EMail='" + this.email+ "' and password='" + this.password + "';";
		/*System.out.println(query);*/
		rs = dbc.fireExecuteQuery(query);
		Boolean result1 = false;
		while (rs.next()) {
			result1 = true;
		}
		return result1;
	}

public ResultSet selectLoginData1() {
		DBConnector dbc = new DBConnector();
		ResultSet rs = null;
		boolean result=false;
		String query = "select * from busoperator where email='" + this.email+ "' and Password='"+this.password+"'";
		System.out.println(query);
		rs = dbc.fireExecuteQuery(query);
		
		return rs;
	}
	

	public boolean operator_available(String s) {
		DBConnector dbc = new DBConnector();
		String query = "select OperatorId from busoperator";
		ResultSet rs = null;
		rs = dbc.fireExecuteQuery(query);
		boolean result = false;
		try {
			while (rs.next()) {
				if (rs.getString(1).equals(s)) {
					result = true;
					break;
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	public void setOperatorID(String operatorID) {
		this.operatorID = operatorID;
	}

	public void setOpeartorName(String opeartorName) {
		this.opeartorName = opeartorName;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean deleteOperatorAccount() {
		DBConnector dbc = new DBConnector();
		String query = "create TRIGGER beforeOperatorDelete"
				+ "BEFORE DELETE ON busoperator" + "FOR EACH ROW"
				+ "INSERT INTO operatorhistory" + "select * from user;";
		String query1 = "delete from busoperator where email='"
				+ this.email + "' and password='" + this.password
				+ "';";
		// System.out.println(query1);
		int numRows = 0;
		numRows = dbc.fireExecuteUpdate(query1);
		dbc.close();
		if (numRows > 0) {
			return true;
		} else {
			return false;
		}
	}

	// Method created by basha. consist of code for changing password for bus
	// operator
	public boolean updatePasswordByEMail() {
		// TODO Auto-generated method stub
		DBConnector dbc = new DBConnector();
		String query = "update busoperator set password = '" + this.password
				+ "'where email='" + this.email + "' and password='"
				+ this.oldPassword + "'";
		int numRows = dbc.fireExecuteUpdate(query);
		System.out.println(query);
		if (numRows >= 1) {
			dbc.close();
			return true;
		} else {
			dbc.close();
			return false;
		}
	}

	public Boolean deleteOperatorAccountFromAdmin() {
		DBConnector dbc = new DBConnector();
		String query = "create TRIGGER beforeOperatorDelete"
				+ "BEFORE DELETE ON busoperator" + "FOR EACH ROW"
				+ "INSERT INTO operatorhistory" + "select * from user;";
		String query1 = "delete from busoperator where email='" + this.email
				+ "' or operatorid='" + this.operatorID + "';";
		// System.out.println(query1);
		int numRows = 0;
		numRows = dbc.fireExecuteUpdate(query1);
		dbc.close();
		if (numRows > 0) {
			return true;
		} else {
			return false;
		}
	}

	public String getUserIDFromEmail(String email2) throws SQLException {
		String query = "select operatorID from busoperator where email='"
				+ email2 + "';";
		System.out.println(query);
		DBConnector dbc = new DBConnector();
		ResultSet rs = dbc.fireExecuteQuery(query);
		String uid = "";
		try {
			uid = "";
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			while (rs.next()) {
				uid = rs.getString(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return uid;
	}

	public ResultSet getOperatorData() {
		String query = "select * from busoperator where operatorid='"
				+ this.operatorID + "';";

		DBConnector dbc = new DBConnector();
		ResultSet rs = null;
		rs = dbc.fireExecuteQuery(query);
		System.out.println(query);
		return rs;
	}

	// update user profile details
	public boolean updateUserProfileData() {
		String query = "update busoperator set OperatorName = '" + this.name
				+ "', Address = '" + this.address + "', City = '" + this.city
				+ "', PhoneNumber ='" + this.phoneNumber + "', email ='"
				+ this.email + "'" + " where operatorID='" + this.operatorID + "';";
		System.out.println(query);
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
	
	public ResultSet getAllOperatorData()
	{
		DBConnector dbc=new DBConnector();
		String query="select * from busoperator";
		ResultSet rs=dbc.fireExecuteQuery(query);
		
		return rs;
	}
}
