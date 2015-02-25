<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="layout/Header.jsp" />
<script type="text/javascript" src="assets/js/blank.js"></script>

<!-- Session validation for bus operator  -->
<%
	if(session.getAttribute("type")==null || (!session.getAttribute("type").equals("busoperator"))){
		response.sendRedirect("BusOperatorLogin.jsp");
	}
%>
<!-- session validation ends -->


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
<!-- ***********   START   *********** -->
<div class="mymainWrapper col-lg-9 col-md-9 col-sm-12 col-xs-12">
	<div class="centerformWrapper col-lg-4 col-md-6 col-sm-12 col-xs-4">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			DELETE BUSOPERTOR</div>


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
			<form name="deletebusoperator"
				action="DeleteBusOperatorFormController"
				onsubmit="return validateLogin6();" method="post">

				<div class="form-group">
					<label for="phonenumber">Enter Phone No:</label> <input type="text"
						id="phonenumber" class="form-control" name="phonenumber">
				</div>
				<div class="form-group">
					<label for="password">Enter Password:</label> <input
						type="password" id="password" class="form-control" name="password">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-danger" value="Delete Account">
					<input type="reset" class="btn btn-danger" value="Cancel">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />






