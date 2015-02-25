<div class="left-column col-lg-3 col-md-3 col-sm-12 col-xs-12">
	<div class="userdetails">
	<%
	try {
		String msg = "";
		if (request.getParameter("msg") != null) {
			out.print("<div class='errorMessage'>" + msg + "</div>");
		}
	} catch (Exception e) {

	}

	try {
		if (session.getAttribute("type").equals("user")) {
			out.print("Welcome, "
					+ session.getAttribute("email"));
		}
	} catch (Exception e) {

	}
%>
	</div>
	<ul>
		<li><a href="indexUser.jsp">Home</a></li>
		<li><a href="SearchBusForm.jsp">Search Bus and book ticket</a></li>
		<li><a href="GetBookingInformation.jsp">Print ticket</a></li>
		<li><a href="CancelTicket.jsp">Cancel Ticket</a></li>
		<li><a href="GetBookingHistory.jsp">View booking history</a></li>
		<li><a href="EditProfile.jsp">Edit profile</a></li>
		<li><a href="ChangePassword.jsp">Change password</a></li>
		<li><a href="DeleteUser.jsp">Delete account</a></li>
		<li><a href="Logout.jsp">Logout</a></li>
	</ul>
</div>