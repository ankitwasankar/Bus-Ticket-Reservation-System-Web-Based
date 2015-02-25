<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.cognizant.model.BusModel" %>
<link rel="stylesheet" href="assets/css/flexselect.css" type="text/css" media="screen" />
<script type="text/javascript" src="assets/js/blank.js"></script>
<script src="assets/js/jquery.min.js" type="text/javascript"></script> 
<script src="assets/js/liquidmetal.js" type="text/javascript"></script>
<script src="assets/js/jquery.flexselect.js" type="text/javascript"></script>



<script>
	$(document).ready(function() {
		$("select.flexselect").flexselect();
	});
</script>
<script>
	jQuery(function() {
		jQuery("#inf_custom_someDateField").datepicker();
	});
</script>

<script type="text/javascript">
document.onkeydown = function (event) {
	
	if (!event) { /* This will happen in IE */
		event = window.event;
	}
		
	var keyCode = event.keyCode;
	
	if (keyCode == 8 &&
		((event.target || event.srcElement).tagName != "TEXTAREA") && 
		((event.target || event.srcElement).tagName != "INPUT")) { 
		
		if (navigator.userAgent.toLowerCase().indexOf("msie") == -1) {
			event.stopPropagation();
		} else {
			alert("prevented");
			event.returnValue = false;
		}
		
		return false;
	}
};
</script>





<jsp:include page="layout/Header.jsp" />

<!-- ***********   START   *********** -->
<div class="mymainWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<div  class="errordiv col-lg-10 col-md-10 col-sm-10 col-xs-10">
	<%
		if (request.getParameter("msg") != null) {
	%>
	<h4 style="color:#ffff22;"><%=request.getParameter("msg")%></h4>
	<%
		}
	%>
		</div>
	<div class="leftWrapper col-lg-6 col-md-6 col-sm-12 col-xs-12">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			ONLINE BUS TICKET BOOKING</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<form name="SearchBusFormController" action="SearchBusFormController"
				onsubmit="return validateLogin12();" method="post">
				
				<div class="form-group col-lg-8 col-md-7 col-sm-10 col-xs-10">
					<label for="from">From</label>
					<select name="from" id="from" class="form-control">						
						<option value=""></option>
						<%
						BusModel model=new BusModel();
						ResultSet rs=model.getBusInfo1(1);

						while(rs.next())
						{%>
						
							<option value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase() %></option>
						<%} %>
					</select>
						
				</div>
				<div class="form-group col-lg-8 col-md-7 col-sm-10 col-xs-10">
					<label for="to">To</label>
					<select name="to" id="to" class="form-control">
						<option value=""></option>
<%					
						ResultSet rs1=model.getBusInfo1(2);
						
						while(rs1.next())
						{%>
							<option value="<%=rs1.getString(1)%>"><%=rs1.getString(1).toUpperCase() %></option>
						<%} %>
					</select>
				</div>
				<div class="form-group col-lg-8 col-md-7 col-sm-10 col-xs-10">
					<label for="from">Date</label>
					<!-- <input type="text"
						class="form-control" id="date" name="date"> -->
					<input class="tcal" type="text" name="date" />
				</div>
				<div class="form-group col-lg-8 col-md-7 col-sm-10 col-xs-10">
					<button type="submit"
						class="btn btn-warning col-lg-5 col-md-5 col-sm-5 col-xs-5"
						style="float: left">Submit</button>
					<button type="reset"
						class="btn btn-warning col-lg-5 col-md-5 col-sm-5 col-xs-5"
						style="float: right">Clear</button>
				</div>
			</form>
		</div>
	</div>
	<!--  End of left wrapper -->
	<div class="rightWrapper col-lg-5 col-md-5 col-sm-12 col-xs-12">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			LOGIN</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<form name="LoginFormController" action="LoginFormController"
				onsubmit="return validateLogin13();" method="post">
			
				<div class="form-group col-lg-8 col-md-7 col-sm-10 col-xs-10">
					<label for="from">Email</label> <input type="text" id="email"
						class="form-control text required email" id="email"
						name="username">
				</div>
				<div class="form-group col-lg-8 col-md-7 col-sm-10 col-xs-10">
					<label for="password">Password</label> <input type="password"
						class="form-control" id="password" name="password">
				</div>
				<div class="form-group">
					<input type="hidden" name="type" value="user" />
				</div>
				<div class="form-group col-lg-8 col-md-7 col-sm-10 col-xs-10">
					<button type="submit"
						class="btn btn-danger col-lg-5 col-md-5 col-sm-5 col-xs-5"
						style="float: left">Submit</button>
					<button type="reset"
						class="btn btn-danger col-lg-5 col-md-5 col-sm-5 col-xs-5"
						style="float: right">Clear</button>
				</div>
			</form>
			<div
				class="centertitle forgotpwd col-lg-8 col-md-7 col-sm-10 col-xs-10">
				<a href="ForgotPassword1.jsp">Forgot Password? Click Here</a>
			</div>
			<div
				class="centertitle logOptions col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<a href="BusOperatorLogin.jsp">Login as Bus Operator </a> | <a href="RegisterUser.jsp"> Sign Up</a>
			</div>
		</div>
	</div>
</div>
<jsp:include page="layout/Footer.jsp" />
