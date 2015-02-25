<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.cognizant.model.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page="layout/Header.jsp" />
<script type="text/javascript" src="assets/js/blank.js"></script>
<jsp:include page="layout/UserSidebar.jsp" />
<!-- ********  Start  *********** -->



<%
		ResultSet rs = null;
		UserModel um = new UserModel();
		um.setEmail(String.valueOf(session.getAttribute("userid")));
		rs = um.showUserBookings();
	%>
	

	
<div class="mymainWrapper col-lg-9 col-md-9 col-sm-9 col-xs-9">
	<div class="tableWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			Booking History
		</div>
		<div class="tableContent col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table class ="table table-bordered">
				<tr>
					<td>booking ID</td>
					<td>BusId</td>
					<td>Date</td>
					<td>Time</td>
				</tr>
				<%
					while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
				</tr>
					<%} 
						rs.close();
					%>
			</table>
		</div>
	</div>
</div>






	<div class="centerformWrapper col-lg-5 col-md-5 col-sm-2 col-xs-2">
		<div class="formTitle col-lg-12 col-md-12 col-sm-12 col-xs-12">Cancel Ticket</div>
		<div class="errordiv col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<%
			if (request.getParameter("msg") != null) {
		%>
		<h4><%=request.getParameter("msg")%> for booking ID <%=request.getParameter("bid")%></h4>
		<%
			}
		%>
		</div>
		<div class="centerform col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<form name="cancelTicket" action="CancelTicketFormController" method="post">
				<% 
					HttpSession session1 = request.getSession();
					if(session1.getAttribute("userid")!=null){ 
				%>	
				<div class="form-group">
					<label for="bookingid">Enter the booking id</label>
					<input type="text" name="bookingid" class="form-control">
				</div>		
				<% } else { %>
				<div class="form-group">
					<label for="bookingid">Enter the booking id</label>
					<input type="text" name="bookingid" class="form-control">
				</div>
				<div class="form-group">
					<label for="username">Enter your email</label>
					<input type="text" name="email" class="form-control">
				</div>
				<% } %>
				<div class="form-group">
					<button type="submit" name="submit" class="btn btn-danger">Submit</button>
				</div>
			</form>
		</div>
	</div>

<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />







