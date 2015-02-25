<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!-- Session validation for bus operator  -->
<%
	if(session.getAttribute("type")==null ){
		response.sendRedirect("index.jsp");
	}
%>
<!-- session validation ends -->

<jsp:include page="layout/Header.jsp" />
<%
	if (session.getAttribute("type").equals("user")) {
%>	
	<jsp:include page="layout/UserSidebar.jsp" />
	<% } else {
		%>
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
<% } %>
<script type="text/javascript" src="assets/js/blank.js"></script>
<!-- ***********   START   *********** -->
<div class="mymainWrapper col-lg-9 col-md-12 col-sm-12 col-xs-12">
	<div class="centerformWrapper col-lg-6 col-md-6 col-sm-12 col-xs-4">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			CHANGE PASSWORD</div>
		<div class="errordiv col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<%
				if (request.getParameter("msg") != null) {
			%>
			<p><%=String.valueOf(request.getParameter("msg"))%>
				<%
					}
				%>
			
		</div>
		<div class="centerform col-lg-12 col-md-12 col-sm-12c col-xs-12">
			<form name="ChangePasswordFormController" action="ChangePasswordFormController"
				onsubmit="return validateLogin5();" method="post">

				<div class="form-group">
					<label for="oldpassword">Old Password</label> <input
						type="password" name="oldpassword" class="form-control" />
				</div>
				<div class="form-group">
					<label for="newpassword">New Password</label> <input
						type="password" name="newpassword" class="form-control" />
				</div>
				<div class="form-group">
					<label for="confirmpassword">Confirm Password</label> <input
						type="password" name="confirmpassword" class="form-control" />
				</div>
				<%
					if (String.valueOf(session.getAttribute("type")).equalsIgnoreCase(
							"admin")) {
				%>
				<div class="form-group">
					<input type="hidden" name="uname"
						value="<%=String.valueOf(session.getAttribute("email"))%>" />
				</div>

				<%
					}
				%>
				<div class="form-group">
					<input type="submit" class="btn btn-danger" value="Submit" /> <input
						type="reset" class="btn btn-danger" value="Reset" />
				</div>
			</form>
		</div>
	</div>
</div>


<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />
