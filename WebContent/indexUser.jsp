<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="layout/Header.jsp" />
<jsp:include page="layout/UserSidebar.jsp" />

<!-- Session validation for bus operator  -->
<%
	if(session.getAttribute("type")==null ){
		response.sendRedirect("index.jsp");
	}
%>
<!-- session validation ends -->


<!-- ***********   START   *********** -->

<div class="dashboard container col-lg-9 col-md-9 col-sm-12 col-xs-12">
	<div class="dashboardBody col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="formTitle col-lg-12 col-md-12 col-sm-12 col-xs-12">User Dashboard</div>
		<div class="dashboarddiv col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="odd col-lg-3 col-md-4 col-sm-12 col-xs-12">
				<div class="dashimg">
					<span class="glyphicon glyphicon-search"></span>Search Bus
				</div>
				<div class="dashcontent">
					<a href="SearchBusForm.jsp">Search</a>
				</div>
			</div>
			<div class="even col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="dashimg">
					<span class="glyphicon glyphicon-list-alt"></span>Book Ticket
					</div>
				<div class="dashcontent">					
					<a href="BookTicket.jsp">Book</a>
				</div>
			</div>
			<div class="odd  col-lg-3 col-md-3 col-sm-12 col-xs-12">		
				<div class="dashimg">
					<span class="glyphicon glyphicon-eye-open"></span>View Booking
				</div>
				<div class="dashcontent">
					<a href="GetBookingHistory.jsp">View</a>	
				</div>
			</div>
			<div class="even  col-lg-3 col-md-3 col-sm-12 col-xs-12">						
				<div class="dashimg">
					<!-- <img src="assets/img/4.png"/> -->
					<span class="glyphicon glyphicon-remove"></span>Cancel Ticket
				</div>
				<div class="dashcontent">
					<a href="GetBookingHistory.jsp">View</a>
				</div>
			</div>
			<div class="odd  col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="dashimg">
				<span class="glyphicon glyphicon-print"></span>Print Ticket
				</div>
				<div class="dashcontent">
					<a href="GetBookingInformation.jsp">Print</a>
				</div>			
			</div>
		</div>
	</div>
</div>

<!-- ***********   basha html ends   *********** -->

<jsp:include page="layout/Footer.jsp" />






