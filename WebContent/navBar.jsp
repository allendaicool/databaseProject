<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<link rel="stylesheet" href="/resources/demos/style.css">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="footer-distributed.css">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">



<link rel="stylesheet" href="/resources/demos/style.css">
<script>
  $(function() {
    $( "#tabs" ).tabs();
  });
 </script>


<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">ATP World Tour</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<%  if(session.getAttribute("currentSessionUser") ==null) {%>
			<form class="navbar-form navbar-right" action="loginServelet">
				<div class="form-group">
					<input type="text" placeholder="username" class="form-control"
						name="username">
				</div>
				<div class="form-group">
					<input type="password" placeholder="Password" class="form-control"
						name="Password">
				</div>
				<button type="submit" class="btn btn-success">Sign in</button>
			</form>
			<%  if(session.getAttribute("invalid password") != null) {%>
			   <p style="color: red">invalid password or username</p>
			   <% session.removeAttribute("invalid password");%>
			 <%} }else{%>
			<div class="navbar-form navbar-right">
				<p style="color: green">user successfully logged in</p>
				&nbsp &nbsp 
				
				<form class="navbar-form navbar-right" action="logout_Servelet">
					<input type="hidden" name="signout" value="signout">
				<button type="submit" class="btn btn-success">Sign out</button>
			</form>

			</div>
			 
			<%} %>
		</div>
		<!--/.navbar-collapse -->
	</div>
	</nav>