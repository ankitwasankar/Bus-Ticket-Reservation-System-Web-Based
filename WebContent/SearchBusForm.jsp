<%@page import="com.cognizant.model.BusModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>

<!-- ***********   START   *********** -->
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
<div class="mymainWrapper col-lg-9 col-md-9 col-sm-12 col-xs-12">
	<div class="centerformWrapper col-lg-4 col-md-6 col-sm-12 col-xs-4">
		<div class="centertitle row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			SEARCH BUS
		</div>
		<%
			String msg= request.getParameter("msg");
			if(msg!=null){
				out.print(msg);
			}
		%>
		<div class="centerform col-lg-12 col-md-12 col-sm-12c col-xs-12">
			<form name="SearchBusFormController" action="SearchBusFormController"
				onsubmit="return validateLogin12();" method="post">
				<div class="form-group">
					<label for="from">From</label>
					<select name="from" id="from" class="flexselect form-control">						
						<option value=""></option>
						<%
						BusModel model=new BusModel();
						ResultSet rs=model.getBusInfo1(1);

						while(rs.next())
						{%>
						
							<option value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase() %></option>
						<%} %>
					</select>
				</div>
				<div class="form-group">
					<label for="to">To</label>
					<select name="to" id="to" class="flexselect form-control">
					<option value=""></option>
<%					
						ResultSet rs1=model.getBusInfo1(2);
						
						while(rs1.next())
						{%>
							<option value="<%=rs1.getString(1)%>"><%=rs1.getString(1).toUpperCase() %></option>
						<%} %>	
					</select>
				</div>
				<div class="form-group">
					<label for="from">Date</label>
					<input class="tcal" type="text" name="date" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-success">Search</button>
					<button type="reset" class="btn btn-danger">Reset</button>
				</div>
			</form>	
		</div>
	</div>
</div>
<!-- ********************************* -->
<jsp:include page="layout/Footer.jsp" />
