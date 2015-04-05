<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="dao.DButil"%>
<%@ page import="java.io.*"%>


<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery UI Tabs - Default functionality</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

</head>
<body>

  
	<script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>
	<%
      Connection conn;
	  conn = DButil.getConnection();
	  String findAllPlayer = "select * from Players order by rank";
	  String listAllTour = "select * from Tournaments order by category";
	  Statement stmt = null;
	  stmt = conn.createStatement();
	  //conn.setAutoCommit(false);
%>
	<jsp:include page="navBar.html" />
	<div style="position: relative;top: 50px;">
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Players</a></li>
				<li><a href="#tabs-2">Tournaments</a></li>
				<li><a href="#tabs-3">Match</a></li>
			</ul>
			<div id="tabs-1">
				<% ResultSet rs1 = stmt.executeQuery(findAllPlayer);   %>

				<table border="1" style="width: 100%">
					<tr>
						<td>Rank</td>
						<td>Name</td>
					</tr>

					<%
         while (rs1.next()) {
           	 String name = rs1.getString("name");
           	 int rank = rs1.getInt("rank");
		     String playerID = rs1.getString("playerID");
     %>


					<tr>
						<td><%= rank%></td>
						<td>
							<form id="playerid" action="listPlayer.jsp" method="post">
								<input type="hidden" value=<%=playerID%> name="playerID">
								</input> <a href="#" onclick="$(this).closest('form').submit();"> <%= name%>
								</a>
							</form>

						</td>
						
					</tr>
					<% } %>
				</table>




			</div>
			<div id="tabs-2">
				<% ResultSet rs2 = stmt.executeQuery(listAllTour);   %>
				<table border="1" style="width: 100%">
					<tr>
						<td>Category</td>
						<td>Tournaments</td>
					</tr>
				<%
         while (rs2.next()) {
           	 String tour = rs2.getString("name");
           	 String category = rs2.getString("category");
		     String tournamentID = rs2.getString("tournamentID");
     %>


					<tr>
						<td><%= category%></td>
						<td>
							<form id="tourid" action="listTour.jsp" method="post">
								<input type="hidden" value=<%=tournamentID%> name="tournamentID">
								</input> <a href="#" onclick="$(this).closest('form').submit();"> <%= tour%>
								</a>
							</form>

						</td>
						
					</tr>
					<% } %>
				</table>
				<%
			   conn.close();
			%>
			</div>
			<div id="tabs-3">
				<p></p>
			</div>
		</div>
	</div>


</body>



</html>
