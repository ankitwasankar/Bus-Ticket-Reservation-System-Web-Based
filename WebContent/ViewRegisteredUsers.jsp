<%@page import="com.cognizant.model.AdminModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.cognizant.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Session validation for bus operator  -->
<%
	if (session.getAttribute("type") == null) {
		response.sendRedirect("AdminLogin.jsp");
	}
%>
<!-- session validation ends -->
<jsp:include page="layout/Header.jsp" />
<jsp:include page="layout/AdminSidebar.jsp" />
<!-- ***********   START   *********** -->
<%
	ResultSet rs = null;
	AdminModel am = new AdminModel();
	am.setUserid(String.valueOf(session.getAttribute("userid")));
	rs = am.showAllUsers();
%>
<div class="mymainWrapper col-lg-9 col-md-9 col-sm-9 col-xs-9">
	<div class="tableWrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			Registered Users</div>
		<div class="tableContent col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table class="table table-bordered">
				<tr>
					<td>User ID</td>
					<td>First Name</td>
					<td>Last Name</td>
					<td>Address</td>
					<td>City</td>
					<td>EMail</td>
					<td>Phone Number</td>
					<td>Password</td>
				</tr>
				<%
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
				</tr>
				<%
					}
					rs.close();
				%>
			</table>
		</div>
	</div>
</div>
<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />