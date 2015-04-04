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
	  Statement stmt = null;
	  stmt = conn.createStatement();
	  //conn.setAutoCommit(false);
%>
	<jsp:include page="navBar.html" />
	<div style="position: relative;top: 50px;">
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Players</a></li>
				<li><a href="#tabs-2">Tournament</a></li>
				<li><a href="#tabs-3"></a></li>
			</ul>
			<div id="tabs-1">
				<% ResultSet rs = stmt.executeQuery(findAllPlayer);   %>

				<table border="1" style="width: 100%">
					<tr>
						<td>Name</td>
						<td>rank</td>
						<td>link</td>
					</tr>

					<%
         while (rs.next()) {
           	 String name = rs.getString("name");
           	 int rank = rs.getInt("rank");
		     String playerID = rs.getString("playerID");
     %>


					<tr>

						<td>
							<form id="playerid" action="listPlayer.jsp" method="post">
								<input type="hidden" value=<%=playerID%> name="playerID">
								</input> <a href="#" onclick="$(this).closest('form').submit();"> <%= name%>
								</a>
							</form>

						</td>
						<td><%= rank%></td>
					</tr>
					<% } %>
				</table>

				<%
			   conn.close();
			%>



			</div>
			<div id="tabs-2">
				<p></p>
			</div>
			<div id="tabs-3">
				<p></p>
			</div>
		</div>
	</div>


</body>



</html>
