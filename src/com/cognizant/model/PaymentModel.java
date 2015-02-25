package com.cognizant.model;

import com.cognizant.library.DBConnector;

public class PaymentModel {
	private String paymentID;
	private String bookingID;
	private String totalAmount;
	private String paymentDate;
	private String operatorID;
	private String totalSeats;
	private String status;
	
	public boolean insertPaymentData(){
		
		return true;
	}
	
	public boolean updatePaymentStatus(){
		
		return true;
	}

	public boolean deletePaymentData()
	{
		DBConnector dbc=new DBConnector();
		String query="delete from payment where OperatorId='"+this.operatorID+"'";
		int rowsUpdated=0;
		rowsUpdated=dbc.fireExecuteUpdate(query);
		
		if(rowsUpdated > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public void setPaymentID(String paymentID) {
		this.paymentID = paymentID;
	}

	public void setBookingID(String bookingID) {
		this.bookingID = bookingID;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public void setOperatorID(String operatorID) {
		this.operatorID = operatorID;
	}

	public void setTotalSeats(String totalSeats) {
		this.totalSeats = totalSeats;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
}
