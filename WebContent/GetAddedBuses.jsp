<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.cognizant.model.*"%>
<%@page import="com.cognizant.controller.DeleteBusDetailsController"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.*"%>
<jsp:include page="layout/Header.jsp" />

<!-- Session validation for bus operator  -->
<%
	if(session.getAttribute("type")==null || (!session.getAttribute("type").equals("busoperator"))){
		response.sendRedirect("BusOperatorLogin.jsp");
	}
%>
<!-- session validation ends -->


<!-- ***********   START   *********** -->
<%
	String operatorID=String.valueOf(session.getAttribute("userid"));
	 System.out.print(operatorID);
	ResultSet rs = null;
	BusModel model = new BusModel();
	model.setOperatorID(operatorID);
	rs = model.ViewBusData();
%>
	<div class="errordiv col-lg-10 col-md-10 col-sm-10 col-xs-10">
	<%
		if (request.getParameter("msg") != null) {
	%>
	<h4><%=request.getParameter("msg")%></h4>
	<%
		}
	%>
		</div>

<div class="left-column col-lg-3 col-md-3 col-sm-3 col-xs-3">
	<ul>
		<li><a href="AddNewBus.jsp">Add new bus</a></li>
		<li><a href="GetAddedBuses.jsp">Show buses</a></li>
		<li><a href="EditProfile.jsp">Edit profile</a></li>
		<li><a href="ChangePassword.jsp">Change Password</a></li>
		<li><a href="DeleteBusOperator.jsp">Delete account</a></li>
		<li><a href="Logout.jsp">Logout</a></li>
	</ul>
</div>
<br/><br/>
<div class="mymainWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<div class="tableWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			Added Buses
		</div>
		<div class="tableContent col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table class ="table table-bordered">
				<tr>
					<td>BusId</td>
					<td>Bus Name</td>
					<td>Bus Type</td>
					<td>Source City</td>
					<td>Destination City</td>
					<td>Departure Time</td>
					<td>Travel Time</td>
					<td>Cost</td>
					<td>Operating Days</td>
					<td>Seats</td>
					<td>  </td>
					<td>  </td>
				</tr>
	<%
		String busid = "";
		String busname = "";
		String bustype = "";
		String departuretime = "";
		String traveltime = "";
		String sourcecity = "";
		String destinationcity = "";
		float cost = 0;
		int seats = 0;
		String days = "";
		
		while (rs.next()) {
			if (busid.equals("")) {
				busid = rs.getString(1);
				busname = rs.getString(2);
				bustype = rs.getString(3);
				sourcecity = rs.getString(4);
				destinationcity = rs.getString(5);
				departuretime = rs.getString(6);
				traveltime = rs.getString(7);
				cost = rs.getFloat(8);
				days = days + rs.getString(9);
				seats = rs.getInt(10);
			} else {
				if (busid.equals(rs.getString(1))) {
					days = days + ",";
					days = days + rs.getString(9);
				} else {
	%>
				<tr>
					<td><%=busid%></td>
					<td><%=busname%></td>
					<td><%=bustype%></td>
					<td><%=sourcecity%></td>
					<td><%=destinationcity%></td>
					<td><%=departuretime%></td>
					<td><%=traveltime%></td>
					<td><%=cost%></td>
					<td><%=days%></td>
					<td><%=seats%></td>
					<td>
						<a href="EditBusDetails.jsp?busid=<%=busid%>"><span class="glyphicon glyphicon-edit"></span></a>
					</td>
					<td>
						<a href="DeleteBusDetailsController?busid=<%=busid%>"><span class="glyphicon glyphicon-trash"></span></a>
					</td>
				</tr>
	<%
		busid = rs.getString(1);
					busname = rs.getString(2);
					bustype = rs.getString(3);
					sourcecity = rs.getString(4);
					destinationcity = rs.getString(5);
					departuretime = rs.getString(6);
					traveltime = rs.getString(7);
					cost = rs.getFloat(8);
					days = rs.getString(9);
					seats = rs.getInt(10);
				}
			}
		}
	%>
				<tr>
					<td><%=busid%></td>
					<td><%=busname%></td>
					<td><%=bustype%></td>
					<td><%=sourcecity%></td>
					<td><%=destinationcity%></td>
					<td><%=departuretime%></td>
					<td><%=traveltime%></td>
					<td><%=cost%></td>
					<td><%=days%></td>
					<td><%=seats%></td>
					<td>
						<a href="EditBusDetails.jsp?busid=<%=busid%>"><span class="glyphicon glyphicon-edit"></span></a>
					</td>
					<td>
						<a href="DeleteBusDetailsController?busid=<%=busid%>"><span class="glyphicon glyphicon-trash"></span></a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />






