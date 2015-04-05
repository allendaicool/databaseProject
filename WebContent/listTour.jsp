<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>

<%@ page import="java.sql.*"%>
<%@ page import="dao.DButil"%>
<%@ page import="java.io.*"%>

<html>
<head>

<link href="table.css" rel="stylesheet">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<%
      Connection conn;
	  conn = DButil.getConnection();
	  
	   PreparedStatement stat = null;
	   String addTour = "select * from Tournaments, Players where championID = playerID and tournamentID = ? order by year desc";
	  
	   stat = conn.prepareStatement(addTour);
	   String tourID = request.getParameter("tournamentID");
	   System.out.println(tourID);
	   stat.setString(1,tourID);
	   ResultSet rst = stat.executeQuery();
	   String name = null; 
	   int year = 0;
	   String place = null;
	   String surface = null;
	   String category = null;
	   double prizeMoney = 0;
	   String championID = null;
	   String championName = null;
	   
	   if(rst.next()){
		   name = rst.getString("Tournaments.name");
		   place = rst.getString("place");
		   surface = rst.getString("surface");
		   category = rst.getString("category");
		   prizeMoney = rst.getDouble("prizeMoney");
		   championID = rst.getString("championID");
		   championName = rst.getString("Players.name");
		   year = rst.getInt("year");
	   }
	  
%>
<title>Tournament</title>
</head>
<body>
	<h2>Tournament Information</h2>
  
	<div style="width: 400px; height: 500px;">
		<table border="1" style="width: 100%">
			<tr>
				<td>Tournament</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td>Place</td>
				<td><%=place %></td>
			</tr>
			<tr>
				<td>surface</td>
				<td><%=surface %></td>
			</tr>
			<tr>
				<td>category</td>
				<td><%=category %></td>
			</tr>
		</table>
	</div>
	
	<script>
 		 $(function() {
  		  $( "#tabs" ).tabs();
  		});
 		 </script>
 		 
	<jsp:include page="navBar.html" />
	<div style="position: relative;top: -350px;">
	<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Past Champions</a></li>
				<li><a href="#tabs-2">Prize Money</a></li>
			</ul>
			<div id="tabs-1">
				<table border="1" style="width: 100%">
					<tr>
						<td>Year</td>
						<td>Champion</td>
					</tr>
					<tr>
						<td><%= year%></td>
						<td>
							<form id="playerid" action="listPlayer.jsp" method="post">
								<input type="hidden" value=<%=championID%> name="playerID">
								</input> <a href="#" onclick="$(this).closest('form').submit();"> <%= championName%>
								</a>
							</form>

						</td>
						
					</tr>
				</table>
			</div>
			
			<div id="tabs-2">
				<table border="1" style="width: 100%">
					<tr>
						<td>Year</td>
						<td>Prize Money</td>
					</tr>
					<tr>
						<td><%= year%></td>
						<td><%= prizeMoney %></td>
					</tr>
				</table>		
		</div>
	<% conn.close(); %>
	</div>
	</div>


</body>
</html>