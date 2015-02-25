<%@page import="java.awt.geom.QuadCurve2D"%>
<%@page import="com.cognizant.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="layout/Header.jsp" />
<script type="text/javascript" src="assets/js/blank.js"></script>

<!-- ***********   START   *********** -->
<div class="mymainWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<div class="centerformWrapper col-lg-4 col-md-6 col-sm-12 col-xs-4">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			FORGOT PASSWORD</div>
		<div class="errordiv col-lg-10 col-md-10 col-sm-10 col-xs-10">
		
			<%
				String email="";
				String question="";
				String type = "";
				if (request.getParameter("msg") != null) {
					type = request.getParameter("msg");
				}
				type = request.getParameter("type");
				if(type.equalsIgnoreCase("user")){
					UserModel u1 = new UserModel();
					email = request.getParameter("username");
					u1.setEmail(email);
					question = u1.getSQ();
				}
			%>
		</div>
		<div class="centerform col-lg-12 col-md-12 col-sm-12c col-xs-12">
			<form name="ForgotPasswordController" action="ForgotPasswordController"
				onsubmit="return validateLogin10();" method="post">
				<div class="form-group">
					<label for="secQstn">Your security question</label> <input
						type="text" name="as" class="form-control" value="<%=question %>" disabled />
				</div>
				<div class="form-group">
					<label for="secAns">Enter your answer</label> <input type="text"
						name="secAns" class="form-control" />
				</div>
				<div class="form-group">
					<input type="hidden" name="type" value="<%=type%>">
					<input type="hidden" name="email" value="<%=email%>">
					<input
						type="hidden" name="secQstn" value="<%=question %>"/>
					<button type="submit" class="btn btn-danger" name="submit">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />