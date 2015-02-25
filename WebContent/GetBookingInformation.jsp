<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.cognizant.model.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page="layout/Header.jsp" />
<jsp:include page="layout/UserSidebar.jsp" />
<script type="text/javascript" src="assets/js/blank.js"></script>

<!-- ***********   START   *********** -->

<%
	try {
		String bookingID = "";
		if (request.getParameter("booking") != null) {
			out.print("<div class=''>" + bookingID + "</div>");
			ResultSet rs = null;
			BookingModel bm = new BookingModel();
			bm.setUserID(String.valueOf(session.getAttribute("userid")));
			bm.setBookingID(request.getParameter("booking"));
			rs = bm.getBookingInfo("user", "nothing");
			rs.last();
			int numRows = rs.getRow();
			if (numRows <= 0) {
				String msg = "No details found for given booking details..";
				response.sendRedirect("GetBookingInformation.jsp?msg="
						+ msg);
			} else {
				rs.beforeFirst();
				/* print ticket code */
				while (rs.next()) {
%>
<div class="mymainWrapper col-lg-9 col-md-12 col-sm-12 col-xs-12">
	<div class="tableWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			Booking Information
		</div>
		<div class="errordiv col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<%
			try {
				String msg = "";
				if (request.getParameter("msg") != null) {
					msg = request.getParameter("msg");
					out.print("<div><p>" + msg + "</p></div>");
					System.out.print("kkkk");
				}
			} catch (Exception e) {
			}
		%>
		</div>
		<div class="tableContent col-lg-9 col-md-9 col-sm-9 col-xs-9">
			<table class="table table-bordered">
				<tr>
				<tr>
					<td>Booking ID</td>
					<td>Bus ID</td>
					<td>User ID</td>
					<td>Departure Date</td>
					<td>Departure Time</td>
					<td>Seats</td>
				</tr>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					
				</tr>
			</table>
			</div>
			</div>
			
			<%
					rs.close();
					}
				}
				} else {
			/* print ticket form */
			%>
			<%
				ResultSet rs = null;
				UserModel um = new UserModel();
				um.setEmail(String.valueOf(session.getAttribute("userid")));
				rs = um.showUserBookings();
			%>
<div class="mymainWrapper col-lg-9 col-md-12 col-sm-12 col-xs-12">
	<div class="tableWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			Booking Information
		</div>
		<div class="errordiv col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<%
			try {
				String msg = "";
				if (request.getParameter("msg") != null) {
					msg = request.getParameter("msg");
					out.print("<div><p>" + msg + "</p></div>");
					System.out.print("kkkk");
				}
			} catch (Exception e) {
			}
		%>
		</div>
		<div class="tableContent col-lg-9 col-md-9 col-sm-9 col-xs-9">
			<table class ="table table-bordered">
				<tr>
					<td>Booking ID</td>
					<td>BusId</td>
					<td>Date</td>
					<td>Time</td>
				</tr>
				<%
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
				</tr>
				<%
					}
					rs.close();
				%>
			</table>
		</div>
		
		<div class="centerformWrapper col-lg-4 col-md-6 col-sm-12 col-xs-4">
			<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
				Booking Information
			</div>
			<div class="centerform col-lg-9 col-md-12 col-sm-12c col-xs-12">
			<form name="printTicketForm" action="GetBookingInformationController"
				onsubmit="return validateLogin11();" method="post">
				
					<div class="form-group">
						<label> Enter Booking Id</label> 
						<input type="text" name="booking" class="form-control">
					</div>
					<div class="form-group">
						<button type="submit" name="submit" class="btn btn-danger">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%
	}
	} catch (Exception e) {
		System.out.print(e);
	}
%>

</div>

<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />