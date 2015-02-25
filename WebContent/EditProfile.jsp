<%@page import="com.cognizant.model.BusOperatorModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.cognizant.model.UserModel"%>
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
<%
	} else {
%>
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
<%
	}
%>
<script type="text/javascript" src="assets/js/blank.js"></script>

<!-- ***********   START   *********** -->
<div class="mymainWrapper col-lg-9 col-md-9 col-sm-12 col-xs-12">
	<div class="centerformWrapper col-lg-6 col-md-6 col-sm-12 col-xs-4">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			EDIT PROFILE</div>
		<div class="errordiv col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<%
				try {
					if (request.getParameter("msg") != null) {
						out.print("<div>" + request.getParameter("msg") + "</div>");
					}
				} catch (Exception e) {
					out.print("some error occured..");
				}
			%>
		</div>
		<%
			if (session.getAttribute("type").equals("user")) {
				UserModel um = new UserModel();
				um.setUserID(String.valueOf(session.getAttribute("userid")));
				ResultSet rs = um.getUserData();
				while (rs.next()) {
		%>
		<div class="centerform col-lg-12 col-md-12 col-sm-12c col-xs-12">
			<form name="EditProfileFormController"
				action="EditProfileFormController"
				onsubmit="return validateLogin9();" method="post">

				<div class="form-group">
					<label for="firstname">FirstName</label> <input type="text"
						name="firstname" class="form-control" value="<%=rs.getString(2)%>" />
				</div>
				<div class="form-group">
					<label for="lastname">LastName</label> <input type="text"
						name="lastname" class="form-control" value="<%=rs.getString(3)%>" />
				</div>
				<div class="form-group">
					<label for="address">Address</label> <input type="text"
						name="address" class="form-control" value="<%=rs.getString(4)%>" />
				</div>
				<div class="form-group">
					<label for="city">City</label> <input type="text" name="city"
						class="form-control" value="<%=rs.getString(5)%>" />
				</div>
				<div class="form-group">
					<label for="email">EMail</label> <input type="text" name="email"
						class="form-control" value="<%=rs.getString(6)%>" />
				</div>
				<div class="form-group">
					<label for="phonenumber">Phone Number</label> <input type="text"
						name="phonenumber" class="form-control"
						value="<%=rs.getString(7)%>" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-danger">Update</button>
				</div>
			</form>
			<%
				}
					rs.close();
				} else {
					BusOperatorModel bom = new BusOperatorModel();
					bom.setOperatorID(String.valueOf(session.getAttribute("userid")));
					ResultSet rs = null;
					rs = bom.getOperatorData();
					while (rs.next()) {
			%>

			<div class="centerform col-lg-12 col-md-12 col-sm-12c col-xs-12">
				<form name="EditProfileFormController" action="EditProfileFormController" onsubmit="return validateLogin9();" method="post">
					<div class="form-group">
						<label for="email">EMail</label> <input type="text" name="email"
							class="form-control" value="<%=rs.getString(4)%>" />
							 <input type="hidden" name="lastname"  value="<%=rs.getString(4)%>" />
							 <input type="hidden" name="type"  value="busOperator" />
					</div>
					<div class="form-group">
						<label for="firstname">Name</label> <input type="text"
							name="firstname" class="form-control" value="<%=rs.getString(2)%>" />
					</div>
					<div class="form-group">
						<label for="address">Address</label> <input type="text"
							name="address" class="form-control" value="<%=rs.getString(3)%>" />
					</div>
					<div class="form-group">
						<label for="city">City</label> <input type="text" name="city"
							class="form-control" value="<%=rs.getString(5)%>" />
					</div>

					<div class="form-group">
						<label for="phonenumber">Phone Number</label> <input type="text"
							name="phonenumber" class="form-control"
							value="<%=rs.getString(6)%>" />
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-danger">Update</button>
					</div>
					<%
						}
						}
					%>
				</form>				
			</div>
		</div>
	</div>
</div>
	

	<!-- ********************************* -->
	<jsp:include page="layout/Footer.jsp" />