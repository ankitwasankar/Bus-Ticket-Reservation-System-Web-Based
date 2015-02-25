<%@page import="com.cognizant.model.BusModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>

<!-- ***********   START   *********** -->
<jsp:include page="layout/Header.jsp" />
<script type="text/javascript" src="assets/js/blank.js"></script>

<div class="mymainWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<div class="centerformWrapper col-lg-4 col-md-6 col-sm-12 col-xs-4">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			LOGIN
		</div>
		<div class="centerform col-lg-12 col-md-12 col-sm-12c col-xs-12">
		<form name="loginForm" action="LoginFormController"
				onsubmit="return validateLogin14();" method="post">
			
				<div class="form-group">
					<label for="username">Username</label> 
					<input type="text" name="username" class="form-control"/>
				</div>
				<div class="form-group">
					<label for="password">Password</label> 
					<input type="password" name="password" class="form-control"/>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-success">Login</button>
					<button type="reset" class="btn btn-danger">Reset</button>
				</div>
			</form>	
		</div>
	</div>
</div>
<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />






