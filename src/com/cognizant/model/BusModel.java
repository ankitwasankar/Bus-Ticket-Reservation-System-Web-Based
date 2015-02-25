package com.cognizant.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.cognizant.helper.returnClass;
import com.cognizant.library.DBConnector;
import com.cognizant.library.IDGenerator;

public class BusModel {

	private String busID;
	private String busName;
	private String busType;
	private String departureTime;
	private String travelTime;
	private String departureDate;
	private String sourceCity;
	private String destinationCity;
	private float cost;
	private String operatorID;
	private int totalSeats;
	final public static Logger logger = Logger.getLogger(BusModel.class);

	public void setBusId(String busId) {
		this.busID = busId;
	}

	public void setBusName(String busName) {
		this.busName = busName;
	}

	public void setBusType(String busType) {
		this.busType = busType;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	public void setTravelTime(String travelTime) {
		this.travelTime = travelTime;
	}

	public void setSourceCity(String sourceCity) {
		this.sourceCity = sourceCity;
	}

	public void setDestinationCity(String destinationCity) {
		this.destinationCity = destinationCity;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public void setOperatorID(String operatorID) {
		this.operatorID = operatorID;
	}

	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}

	public String getBusId() {
		return busID;
	}

	public returnClass InsertBusData() {
		IDGenerator idg = new IDGenerator();
		returnClass r = new returnClass();
		int success = 0;
		// BusFrequencyModel theModel = new BusFrequencyModel();

		this.busID = idg.generateId("BusId", "bus");
		// theModel.setBusID(busID);
		r.setS(this.busID);
		DBConnector dbc = new DBConnector();
		PreparedStatement pstmt = null;

		String query = "insert into bus(BusId,BusName,BusType,DepartureTime,TravelTime,DepartureCity,"
				+ "ArrivalCity,cost,OperatorId,TotalSeats)"
				+ "values(?,?,?,?,?,?,?,?,?,?)";

		try {		
			pstmt = dbc.fireExecuteQueryPrepare(query);
			pstmt.setString(1, this.busID);
			pstmt.setString(2, this.busName);
			pstmt.setString(3, this.busType);
			pstmt.setString(4, this.departureTime);
			pstmt.setString(5, this.travelTime);
			pstmt.setString(6, this.sourceCity);
			pstmt.setString(7, this.destinationCity);
			pstmt.setFloat(8, this.cost);
			pstmt.setString(9, this.operatorID);
			pstmt.setInt(10, this.totalSeats);
			
			success = pstmt.executeUpdate();
			

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		finally {
			try {
				dbc.close();

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

	public boolean EditBusData(int no) {

		int success = 0;
		DBConnector dbc = new DBConnector();

		String query = null;

		switch (no) {
		case 1: {
			query = "update bus set BusName='" + busName + "' where BusId='"
					+ busID + "'";
			break;
		}
		case 2: {
			query = "update bus set BusType='" + busType + "' where BusId='"
					+ busID + "'";
			break;
		}
		case 3: {
			query = "update bus set DepartureTime='" + departureTime
					+ "' where BusId='" + busID + "'";
			break;
		}
		case 4: {
			query = "update bus set TravelTime='" + travelTime
					+ "' where BusId='" + busID + "'";
			break;
		}
		case 5: {
			query = "update bus set DepartureCity='" + sourceCity
					+ "' where BusId='" + busID + "'";
			break;
		}
		case 6: {
			query = "update bus set ArrivalCity='" + destinationCity
					+ "' where BusId='" + busID + "'";
			break;
		}
		case 7: {
			query = "update bus set cost='" + cost + "' where BusId='" + busID
					+ "'";
			break;
		}
		case 8: {
			query = "update bus set TotalSeats='" + totalSeats
					+ "' where BusId='" + busID + "'";
			break;
		}
		}

		try {
			success = dbc.fireExecuteUpdate(query);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		finally {
			try {
				dbc.close();

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}

		if (success >= 1) {
			return true;
		} else {
			return false;
		}
	}

	public ResultSet ViewBusData() {
		DBConnector dbc = new DBConnector();
		String busid, temp = null;
		String temp_id = null;
		String temp_name = null;
		String temp_type = null;
		String temp_dcity = null;
		String temp_acity = null;
		String temp_dtime = null;
		String temp_ttime = null;
		int temp_cost = 0;
		String temp_days = null;
		String query = "select a.BusId,b.BusName,b.BusType,b.DepartureCity,b.ArrivalCity,b.DepartureTime,b.TravelTime,b.cost,a.FrequencyDays,b.TotalSeats from (select BusId,FrequencyDays from busfrequency where BusId in(select BusId from bus where OperatorId='"
				+ operatorID
				+ "'))a inner join bus b on a.BusId=b.BusId order by a.BusId";
		ResultSet rs;
		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		rs = dbc.fireExecuteQuery(query);
		return rs;
	}

	public String getBusID() {
		return busID;
	}

	public String getBusName() {
		return busName;
	}

	public String getBusType() {
		return busType;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public String getTravelTime() {
		return travelTime;
	}

	public String getDepartureDate() {
		return departureDate;
	}

	public String getSourceCity() {
		return sourceCity;
	}

	public String getDestinationCity() {
		return destinationCity;
	}

	public float getCost() {
		return cost;
	}

	public String getOperatorID() {
		return operatorID;
	}

	public int getTotalSeats() {
		return totalSeats;
	}

	public ResultSet searchBusBetweenStations() {
		DBConnector dbc = new DBConnector();
		String query = "select * from bus where DepartureCity='"
				+ this.sourceCity
				+ "' and ArrivalCity = '"
				+ this.destinationCity
				+ "' and BusId in "
				+ "(select BusId from busFrequency where FrequencyDays = (select DAYNAME('"
				+ this.departureDate + "')));";
		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		ResultSet rs = dbc.fireExecuteQuery(query);
		return rs;
	}

	public ResultSet getBusInfo(String bid) {
		DBConnector dbc = new DBConnector();
		ResultSet rs = null;
		String query = "select * from bus where busid='" + bid + "';";

		rs = dbc.fireExecuteQuery(query);
		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		return rs;
	}

	public ResultSet getBusInfo1(int no) {
		DBConnector dbc = new DBConnector();
		ResultSet rs = null;
		String query = null;
		if (no == 1) {
			query = "select distinct(DepartureCity) from bus";
			logger.setLevel(Level.INFO);
			logger.info("query fired is: " + query);
			rs = dbc.fireExecuteQuery(query);
		} else if (no == 2) {
			query = "select distinct(ArrivalCity) from bus";
			logger.setLevel(Level.INFO);
			logger.info("query fired is: " + query);
			rs = dbc.fireExecuteQuery(query);
		}
		return rs;
	}

	public boolean DeleteBusData() {
		DBConnector dbc = new DBConnector();
		String query = "delete from bus where BusId='" + this.busID + "'";
		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		int rowsUpdated = dbc.fireExecuteUpdate(query);
		dbc.close();
		if (rowsUpdated > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean EditBusData1() {
		int success = 0;
		DBConnector dbc = new DBConnector();
		String query = "update bus set BusName='" + busName + "',BusType='"
				+ busType + "',DepartureTime='" + departureTime
				+ "',TravelTime='" + travelTime + "',DepartureCity='"
				+ sourceCity + "',ArrivalCity='" + destinationCity + "',cost='"
				+ cost + "',OperatorId='" + operatorID + "',TotalSeats='"
				+ totalSeats + "' where BusId='" + busID + "';";
		// System.out.println(query);
		try {

			logger.setLevel(Level.INFO);
			logger.info("query fired is: " + query);
			success = dbc.fireExecuteUpdate(query);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				dbc.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		if (success > 0) {
			// System.out.println("true");
			return true;
		} else {
			// System.out.println("false");
			return false;
		}
	}

	public ResultSet getAllCities() {
		ResultSet rs = null;
		String query = " select distinct departureCity as city from bus union select arrivalCity as city from bus;";
		DBConnector dbc = new DBConnector();
		rs = dbc.fireExecuteQuery(query);
		logger.setLevel(Level.INFO);
		logger.info("query fired is: " + query);
		return rs;
	}

}
