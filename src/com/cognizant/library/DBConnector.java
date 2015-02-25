package com.cognizant.library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnector {
	private Connection conn;
	private String driver;
	private String uname;
	private String pwd;
	private String url;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public DBConnector() {
		driver = "com.mysql.jdbc.Driver";
		uname = "root";
		pwd = "root";
		url = "jdbc:mysql://127.0.0.1/btrs";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uname, pwd);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// use to fire update, insert, delete queries
	public int fireExecuteUpdate(String query) {
		int n = 0;
		try {
			stmt = conn.createStatement();
			n = stmt.executeUpdate(query);
		} catch (SQLException e) {
			System.out.println(e.getMessage());	
		}
		return n;
	}

	// use to fire select query
	public ResultSet fireExecuteQuery(String query) {
		rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return rs;
	}
	
	public PreparedStatement fireExecuteQueryPrepare(String query ){
		
		try {
			pstmt = conn.prepareStatement(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pstmt;
		
	}

	// close the connection
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
