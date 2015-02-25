<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Bus Ticket Reservation System</title>
<!--  meta tags-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">

<!--  css links -->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css"
	type="text/css" />
<link rel="stylesheet" href="assets/css/mainStyle.css" type="text/css" />
<link rel="stylesheet" href="assets/css/dashboardStyle.css"
	type="text/css" />
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="assets/calendar/tcal.css" />
<link rel="stylesheet" href="assets/css/flexselect.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="assets/css/jqueryCalendar.css">
<link rel="stylesheet" type="text/css" href="assets/calendar/tcal.css" />
<!-- Fav icon  -->
<link rel="shortcut icon" href="assets/img/favicon.ico"/>

<!-- javascript links -->
<script type="text/javascript" src="assets/calendar/tcal.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/js/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/liquidmetal.js" type="text/javascript"></script>
<script src="assets/js/query.flexselect.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/calendar/tcal.js"></script>
<script>
	$(function() {
		var elements = $("input[type!='submit'], textarea, select");
		elements.focus(function() {
			$(this).parents('li').addClass('highlight');
		});
		elements.blur(function() {
			$(this).parents('li').removeClass('highlight');
		});
		$("#forgotpassword").click(function() {
			$("#password").removeClass("required");
			$("#login").submit();
			$("#password").addClass("required");
			return false;
		});
		$("#login").validate()
	});
</script>


<style>
.myheader {
	height: 100px;
	font-size: 32px;
	background-color: rgba(50, 50, 50, 0.5);
	height: 100px;
	text-transform: uppercase;
	text-align: center;
	margin-bottom: 10px;
	margin-top: 10px;
	padding-top: 25px;
}

@media ( min-width :768px) and (max-width:1024px) {
	.myheader {
		width: 768px;
		font-size: 28px;
		font-weight: bold;
		border-radius: 0px;
	}
}

@media ( min-width :600px) and (max-width:767px) {
	.myheader {
		width: 600px;
		font-size: 24px;
		font-weight: bold;
		border-radius: 0px;
	}
}

@media ( min-width :480px) and (max-width:599px) {
	.myheader {
		width: 480px;
		font-size: 20px;
		font-weight: bold;
		border-radius: 0px;
	}
}

@media ( max-width :479px) {
	.myheader {
		width: 300px;
		font-size: 16px;
		font-weight: bold;
		border-radius: 0px;
	}
}
</style>
</head>
<body background="assets/img/basha1.jpg" >
	<div class="container-fluid">
		<div class="myheader col-lg-12 col-md-12 col-sm-12 col-xs-12">
			BUS TICKET RESERVATION SYSTEM</div>