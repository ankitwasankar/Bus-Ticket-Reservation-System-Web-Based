<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="layout/Header.jsp" />

<!-- Session validation for bus operator  -->
<%
	if(session.getAttribute("type")==null ){
		response.sendRedirect("index.jsp");
	}
%>
<!-- session validation ends -->


<!-- ***********   START   *********** -->
<jsp:include page="layout/AdminSidebar.jsp" />
<div class="dashboard container col-lg-9 col-md-9 col-sm-9 col-xs-7">
	<div class="dashboardBody col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="formTitle col-lg-12 col-md-12 col-sm-12 col-xs-12">Admin Dashboard</div>
		<div class="dashboarddiv col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="odd col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="dashimg">
					View Bus Operator
				</div>
				<div class="dashcontent">
					<a href="ViewBusOperators.jsp">View</a>
				</div>
			</div>
			<div class="even col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="dashimg">
					Add Bus Operator
					</div>
				<div class="dashcontent">					
					<a href="addnewbusoperator.jsp">Add</a>
				</div>
			</div>
			<div class="even col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="dashimg">
					Delete Bus Operator
					</div>
				<div class="dashcontent">					
					<a href="DeleteBusOperatorByAdmin.jsp">Delete</a>
				</div>
			</div>
			<div class="even col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="dashimg">
					View Users
					</div>
				<div class="dashcontent">					
					<a href="ViewRegisteredUsers.jsp">View</a>
				</div>
			</div>
			<div class="even col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="dashimg">
					View Bookings
					</div>
				<div class="dashcontent">					
					<a href="ViewAllBookings.jsp">View</a>
				</div>
			</div>
			<div class="even col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="dashimg">
					Logout
					</div>
				<div class="dashcontent">					
					<a href="Logout.jsp">Signout</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ***********   basha html ends   *********** -->

<jsp:include page="layout/Footer.jsp" />
