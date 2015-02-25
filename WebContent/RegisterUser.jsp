<%@page import="com.cognizant.model.BusModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>

<!-- ***********   START   *********** -->
<jsp:include page="layout/Header.jsp" />
<script type="text/javascript" src="assets/js/blank.js"></script>

<div class="mymainWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<div class="centerformWrapper col-lg-4 col-md-6 col-sm-12 col-xs-12">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			REGISTER FORM
		</div>
		<div class="errordiv col-lg-10 col-md-10 col-sm-10 col-xs-10">
		<%
			String msg= request.getParameter("msg");
			if(msg!=null){
				out.print(msg);
			}
		%>
		</div>
		<div class="centerform col-lg-12 col-md-12 col-sm-12c col-xs-12">
		<form name="RegisterUserController" action="RegisterUserController"
				onsubmit="return validateLogin15();" method="post">
				
			
				<div class="form-group">
					<label for="username">Email ID</label> 
					<input type="text" name="username" class="form-control"/>
				</div>
				<div class="form-group">
					<label for="password">Password</label> 
					<input type="password" name="password" class="form-control"/>
				</div>
				<div class="form-group">
					<label for="confirmPassword">Confirm Password</label> 
					<input type="password" name="confirmPassword" class="form-control"/>
				</div>
				<div class="form-group">
					<label for="fName">First Name</label> 
					<input type="text" name="fName" class="form-control"/>
				</div>
				<div class="form-group">
					<label for="lName">Last Name</label> 
					<input type="text" name="lName" class="form-control"/>
				</div>
				<div class="form-group">
					<label for="city">City</label> 
					<input type="text" name="city" class="form-control"/>
				</div>
				<div class="form-group">
					<label for="address">Address</label> 
					<textarea name="address" class="form-control" rows="3"></textarea>
				</div>
				<div class="form-group">
					<label for="phoneNumber">Phone Number</label> 
					<input type="text" name="phoneNumber" class="form-control"/>
				</div>
				<div class="form-group">
					<label for="sq">Security Question</label>
					<select name="sq" id="sq" class="form-control">
						<option value="What was the name of your elementary / primary school?">What was the name of your elementary / primary school?</option>
						<option value="What was your favorite place to visit as a child?">What was your favorite place to visit as a child?</option>
						<option value="What month were you born?">What month were you born?</option>
					</select>
				</div>
				<div class="form-group">
					<label for="sa">Security Answer</label> 
					<input type="text" name="sa" class="form-control"/>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-danger">Submit</button>
					<button type="reset" class="btn btn-danger">Reset</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />