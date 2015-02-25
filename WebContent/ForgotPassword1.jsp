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
				String type = "";
				if (request.getParameter("msg") != null) {
					type = request.getParameter("msg");
				}
				if (type.equalsIgnoreCase("busoperator")) {
			%>
		</div>
		<div class="centerform col-lg-12 col-md-12 col-sm-12c col-xs-12">
			<form name="ForgotPasswordController" action="#"
				onsubmit="return validateLogin10();" method="post">
				<div class="form-group">
					<label for="username">Enter your username</label> <input
						type="text" name="username" class="form-control" />
				</div>
			</form>
		</div>
		<%
			} else {
		%>
		<div class="centerform col-lg-12 col-md-12 col-sm-12c col-xs-12">
			<form action="ForgotPassword2.jsp" method="post">
				<div class="form-group">
					<label for="username">Enter your email</label> <input
						type="text" name="username" class="form-control" />
				</div>
				<div class="form-group">
					<input type="hidden" name="type" value="user">
					<button type="submit" class="btn btn-danger" name="submit">Submit</button>
				</div>
			</form>
		</div>
		<%
			}
		%>
	</div>
</div>
<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />