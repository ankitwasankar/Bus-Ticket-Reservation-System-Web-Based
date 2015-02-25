<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.cognizant.model.BusModel"%>
<%@page import="java.sql.ResultSet"%>

<!-- Session validation for bus operator  -->
<%
	if(session.getAttribute("type")==null || (!session.getAttribute("type").equals("busoperator"))){
		response.sendRedirect("BusOperatorLogin.jsp");
	}
%>
<!-- session validation ends -->

<jsp:include page="layout/Header.jsp" />
<script type="text/javascript" src="assets/js/blank.js"></script>
<script type="text/javascript" src="assets/blank.js"></script>
<!-- ***********   START   *********** -->
<div class="left-column col-lg-3 col-md-3 col-sm-3 col-xs-3">
	<ul>
		<li><a href="AddNewBus.jsp">Add new bus</a>
		</li>
		<li><a href="GetAddedBuses.jsp">Show buses</a>
		</li>
		<li><a href="EditProfile.jsp">Edit profile</a>
		</li>
		<li><a href="ChangePassword.jsp">Change Password</a>
		</li>
		<li><a href="DeleteBusOperator.jsp">Delete account</a>
		</li>
		<li><a href="Logout.jsp">Logout</a>
		</li>
	</ul>
</div>
<div class="mymainWrapper col-lg-9 col-md-9 col-sm-12 col-xs-12">
	<div class="centerformWrapper col-lg-4 col-md-6 col-sm-12 col-xs-4">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			Add new bus</div>


		<div class="errordiv col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<%
				if (request.getParameter("msg") != null) {
			%>
			<h4><%=request.getParameter("msg")%></h4>
			<%
				}
			%>
		</div>


		<div class="centerform col-lg-12 col-md-12 col-sm-12c col-xs-12">
			<form name="myForm" action="AddNewBusFormController"
				onsubmit="return validateLogin();" method="post">
				<div class="form-group">
					<label for="busname">Enter Bus Name</label> <input type="text"
						name="busname" class="form-control" />
				</div>
				<div class="form-group">
					<label for="bustype">Enter Bus Type</label> <select name="bustype1"
						class="form-control">
						<option Value="AC">AC</option>
						<option Value="Non-AC">Non-AC</option>
					</select> <label for="bustype2"> </label> <select name="bustype2"
						class="form-control">
						<option Value="Non-Sleeper">NonSleeper</option>
						<option Value="Sleeper">Sleeper</option>
						<option Value="Semi-Sleeper">SemiSleeper</option>
					</select>
				</div>
				<div class="form-group">
					<label for="departurecity">Enter Departure City </label> <input
						type="text" name="departurecity" class="form-control" />
				</div>
				<div class="form-group">
					<label for="arrivalcity">Enter Arrival City </label> <input
						type="text" name="arrivalcity" class="form-control" />
				</div>
				<div class="form-group">
					<label for="departuretime">Enter Departure Time in 24Hr
						format</label> <input type="text" name="departuretime"
						class="form-control" />
				</div>
				<div class="form-group">
					<label for="traveltime">Enter Travel Time in 24-hr
						format(HH:MM) </label> <input type="text" name="traveltime"
						class="form-control" />
				</div>
				<div class="form-group">
					<label for="operatingdays">Enter Operating Days </label><br /> <input
						type="checkbox" name="OperatingDays1" value="S" checked>Sunday<br />
					<input type="checkbox" name="OperatingDays2" value="M">Monday<br />
					<input type="checkbox" name="OperatingDays3" value="T">Tuesday<br />
					<input type="checkbox" name="OperatingDays4" value="W">Wednesday<br />
					<input type="checkbox" name="OperatingDays5" value="T">Thursday<br />
					<input type="checkbox" name="OperatingDays6" value="F">Friday<br />
					<input type="checkbox" name="OperatingDays7" value="S">Saturday<br />
				</div>
				<div class="form-group">
					<label for="cost">Cost of travel</label> <input type="text"
						name="cost" class="form-control" />
				</div>
				<div class="form-group">
					<label for="Number of Seats">Number of Seats </label> <input
						type="text" name="seats" class="form-control" />
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-danger" value="Add" /> <input
						type="reset" class="btn btn-danger" value="Cancel" />
				</div>
			</form>
		</div>
	</div>
</div>
<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />
