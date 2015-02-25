<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<jsp:include page="layout/Header.jsp" />
<script type="text/javascript" src="assets/js/blank.js"></script>

<!-- ***********   START   *********** -->
<div class="mainWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<div class="centerformWrapper col-lg-4 col-md-6 col-sm-12 col-xs-4">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			Bus Operator Login
		</div>
		<div class="errordiv col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<!-- code to display error message  -->
			<%if(request.getParameter("msg")!=null){%>
				<h4><%=request.getParameter("msg") %></h4>	
			<%}%>
			<!-- error message code ends here -->
		</div>
		<div class="centerform col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<form name="loginForm" action="LoginFormController" onsubmit="return validateLogin4();" method="post" >
			
				<div class="form-group">
					<label for="username">Email</label>
					<input type="text" name="username" class="form-control"/>
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					<input type="password" name="password" class="form-control"/>
				</div>		
				<div class="form-group">
					<input type="hidden" name="type" value="busoperator"/>
				</div>		
				<div class="form-group">
					<input type="submit" class="btn btn-danger" value="Submit"/>
					<input type="reset" class="btn btn-danger" value="Reset"/>
				</div>
			</form>			
		</div>
	</div>
</div>

<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />






