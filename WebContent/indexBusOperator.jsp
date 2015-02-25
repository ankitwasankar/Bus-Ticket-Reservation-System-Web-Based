

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="layout/Header.jsp" />


<!-- Session validation for bus operator  -->
<%
	if(session.getAttribute("type")==null || (!session.getAttribute("type").equals("busoperator"))){
		response.sendRedirect("BusOperatorLogin.jsp");
	}
%>
<!-- session validation ends -->


<!-- ***********   START   *********** -->
<div class="left-column col-lg-3 col-md-3 col-sm-3 col-xs-3">
	<ul>
		<li><a href="AddNewBus.jsp">Add new bus</a></li>
		<li><a href="GetAddedBuses.jsp">Show buses</a></li>
		<li><a href="EditProfile.jsp">Edit profile</a></li>
		<li><a href="ChangePassword.jsp">Change Password</a></li>
		<li><a href="DeleteBusOperator.jsp">Delete account</a></li>
		<li><a href="Logout.jsp">Logout</a>
	</ul>
</div>
<div class="dashboard container col-lg-9 col-md-9 col-sm-9 col-xs-7">
	<div class="dashboardBody col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="formTitle col-lg-12 col-md-12 col-sm-12 col-xs-12">BUS OPERATOR Dashboard</div>
		<div class="errordiv col-lg-10 col-md-10 col-sm-10 col-xs-10">
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
		<div class="dashboarddiv col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="odd col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="dashimg">
					Add new bus
				</div>
				<div class="dashcontent">
					<a href="AddNewBus.jsp">Add</a>
				</div>
			</div>
			<div class="even col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="dashimg">
					Show buses
					</div>
				<div class="dashcontent">					
					<a href="GetAddedBuses.jsp">Show</a>
				</div>
			</div>
			<div class="odd  col-lg-3 col-md-3 col-sm-3 col-xs-3">			
				<div class="dashimg">
					Change Password
				</div>
				<div class="dashcontent">
					<a href="ChangePassword.jsp">Change</a>	
				</div>
			</div>
			<div class="odd  col-lg-3 col-md-3 col-sm-3 col-xs-3">			
				<div class="dashimg">
					Delete account
				</div>
				<div class="dashcontent">
					<a href="DeleteBusOperator.jsp">Delete</a>	
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ***********   basha html ends   *********** -->

<jsp:include page="layout/Footer.jsp" />

-------------------------------------------------------------------------------------------------------


<ul>
	
</ul>
