<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="layout/Header.jsp" />
<jsp:include page="layout/UserSidebar.jsp" />
<script type="text/javascript" src="assets/js/blank.js"></script>


<!-- Session validation for bus operator  -->
<%
	if(session.getAttribute("type")==null ){
		response.sendRedirect("index.jsp");
	}
%>
<!-- session validation ends -->


<!-- ***********   START   *********** -->
<div class="mymainWrapper col-lg-9 col-md-9 col-sm-12 col-xs-12">
	<div class="errordiv col-lg-10 col-md-10 col-sm-10 col-xs-10">
	<%
		if (request.getParameter("msg") != null) {
	%>
	<h4><%=request.getParameter("msg")%></h4>
	<%
		}
	%>
		</div>
	<div class="centerformWrapper col-lg-6 col-md-6 col-sm-12 col-xs-4">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			DELETE USER
		</div>
		<div class="centerform col-lg-12 col-md-12 col-sm-12c col-xs-12">
		<form name="deleteuser" action="DeleteUserFormController"
				onsubmit="return validateLogin7();" method="post">
				
			<form name="deleteuser" method="get" action="DeleteUserFormController">
				<div class="form-group">
					<label for="phonenumber">Enter Phone No:</label>
					<input type="text" id="phonenumber" name="phonenumber" class="form-control">
				</div>
				<div class="form-group">
					<label for="password">Enter Password:</label>
					<input type="password" id="password" class="form-control" name="password">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-danger" value="Delete Account">
					<input type="reset"  class="btn btn-danger" value="Cancel">
				</div>	
			</form>	
		</div>
	</div>
</div>	
<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />

