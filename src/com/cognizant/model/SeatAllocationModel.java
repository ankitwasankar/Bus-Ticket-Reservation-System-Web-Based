package com.cognizant.model;

public class SeatAllocationModel {
	private String seatID;
	private String bookingID;
	private String seatType;
	private String busID;
	
	public boolean insertNewSeatData(){
		String query="insert into ";
		return true;
	}

	public void setSeatID(String seatID) {
		this.seatID = seatID;
	}

	public void setBookingID(String bookingID) {
		this.bookingID = bookingID;
	}

	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}

	public void setBusID(String busID) {
		this.busID = busID;
	}
	
	
}
