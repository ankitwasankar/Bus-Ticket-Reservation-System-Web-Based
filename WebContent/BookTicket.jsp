<%@page import="com.cognizant.model.BusModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>

<jsp:include page="layout/Header.jsp" />

<% 
	HttpSession session1 = request.getSession();
	if(session1.getAttribute("userid")!= null){ 
%>	
	<jsp:include page="layout/UserSidebar.jsp" />
<% } %>
<script type="text/javascript" src="assets/js/blank.js"></script>

<!-- ***********   START   *********** -->

<%
	String busId = request.getParameter("busid");
%>

	<div class="errordiv col-lg-9 col-md-9 col-sm-10 col-xs-10">
	<%
		if (request.getParameter("msg") != null) {
	%>
	<h4><%=request.getParameter("msg")%></h4>
	<%
		}
	%>
		</div>

<div class="mymainWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<div class="tableWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			Book a Ticket
		</div>
		<%
			BusModel bm = new BusModel();
			ResultSet rs = bm.getBusInfo(request.getParameter("busid"));
			String departureDate = "";
			String departureTime = "";
		%>
		<!-- ********  Enter seat details   *********** -->
		<div class="tableContent col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table class ="col-lg-6 col-md-6 col-sm-12 col-xs-12 table table-bordered">
				<tr>
					<th>Bus ID</th>
					<th>Bus Name</th>
					<th>Bus Type</th>
					<th>Departure Date</th>
					<th>Departure Time</th>
					<th>From</th>
					<th>To</th>
					<th>Cost</th>
				</tr>
				<%
					while (rs.next()) {
				%>				
				<tr>
					<td><%=rs.getString(1)%>
					<td><%=rs.getString(2)%>
					<td><%=rs.getString(3)%>
					<td><%=rs.getString(4)%>
					<td><%=rs.getString(5)%>
					<td><%=rs.getString(6)%>
					<td><%=rs.getString(7)%>
					<td><%=rs.getString(8)%>
				</tr>
				<%
						departureDate = request.getParameter("date");
						departureTime = rs.getString(5);
					}
					rs.close();
				%>
			</table>
	</div>
	<!-- ********  Enter seat details   *********** -->
	
	<div class="centerformWrapper col-lg-4 col-md-6 col-sm-2 col-xs-2">
		<div class="centerform col-lg-12 col-md-4 col-sm-12 col-xs-12">
			<form name="bookTicket" action="BookTicketFormController" onsubmit="return validateLogin3();" method="post">
		
				<div class="form-group">
					<label for="noOfseats">Enter number of seats to book</label>
					<input type="text" name="noOfseats" class="form-control">
				</div>
				<%
					if(session1.getAttribute("userid")==null){ 
				%>	
				<div class="form-group">
					<label for="username">Enter your email</label>
					<input type="text" name="email" class="form-control">
				</div>			
				<% } %>
				<div class="form-group">
					<label for="busid">Bus Id</label>
					<input type="text" name="busid"  class="form-control" value="<%=busId%>"/>
				</div>
				<div class="form-group">
					<label for="deptdate">Departure Date</label>
					<input type="text" name="deptdate"  class="form-control" value="<%=departureDate%>"/>
				</div>
				<div class="form-group">
					<label for="depttime">Departure Time</label>
					<input type="text" name="depttime"  class="form-control" value="<%=departureTime%>"/>
				</div>
				<div class="form-group">
					<button type="submit" name="submit" class="btn btn-danger">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />






