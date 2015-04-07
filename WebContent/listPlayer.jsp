<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>

<%@ page import="java.sql.*"%>
<%@ page import="dao.DButil"%>
<%@ page import="java.io.*"%>

<html>
<head>

<link href="table.css" rel="stylesheet">
<style>
#listOpponent, #listOpponent th, #listOpponent td {
    border: 1px solid black;
}
</style>
<%
      Connection conn;
	   conn = DButil.getConnection();
	  
	   PreparedStatement stat = null;
	   PreparedStatement match = null;
	   String addPlayer = "select * from Players where playerID = ?";
	   String list_match = "select A.name, B.name, D.matchDate, D.environment, C.score from Players A, Players B, Plays C, Matches D where A.playerID = ?" 
			   +" and A.playerID = C.playerID and C.opponentID=B.playerID and C.matchID = D.matchID";
	   stat = conn.prepareStatement(addPlayer);
	   match = conn.prepareStatement(list_match);
	   String playerID = request.getParameter("playerID");
	   
	   stat.setString(1,playerID);
	   match.setString(1,playerID);
	   ResultSet rst = stat.executeQuery();
	   ResultSet match_rst = match.executeQuery();
	   
	   
	   String name = null; 
	   int age = 0;;
	   String nationality = null;
	   double height = 0;
	   double weight = 0;
	   String plays = null;
	   double careerPrizeMoney = 0;
	   int rank = 0; 
	   int points = 0;
	   if(rst.next()){
		   name = rst.getString(2);
		   age = rst.getInt(3);
		   nationality = rst.getString(4);
		   height = rst.getDouble(5);
		   weight = rst.getDouble(6);
		   plays = rst.getString(7);
		   careerPrizeMoney = rst.getDouble(8);
		   rank = rst.getInt(9);
		   points = rst.getInt(10);
	   }
	  
%>
<title>Player</title>
</head>
<body>
	<h2>Player Information</h2>

	<div style="width: 250px; height: 500px;">
		<table border="1" style="width: 100%">
			<tr>
				<td>name</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td>age</td>
				<td><%=age %></td>
			</tr>
			<tr>
				<td>nationality</td>
				<td><%=nationality %></td>
			</tr>
			<tr>
				<td>height</td>
				<td><%=height %></td>
			</tr>
			<tr>
				<td>weight</td>
				<td><%=weight %></td>
			</tr>
			<tr>
				<td>plays</td>
				<td><%=plays %></td>
			</tr>
			<tr>
				<td>careerPrizeMoney</td>
				<td><%=careerPrizeMoney %></td>
			</tr>
			<tr>
				<td>rank</td>
				<td><%=rank %></td>
			</tr>
			<tr>
				<td>points</td>
				<td><%=points %></td>
			</tr>
		</table>
	</div>
	
	<br/>
	
	<table id="listOpponent">
  <tr>
    <th>playerName</th>
    <th>opponentName</th>
    <th>matchDate</th>
    <th>environment</th>
    <th>score</th>  
  </tr>
  
  <% while (match_rst.next()) {%>
  <tr>
    <td><%=match_rst.getString(1) %></td>
    <td><%=match_rst.getString(2) %></td>
    <td><%=match_rst.getDate(3) %></td>
    <td><%=match_rst.getString(4) %></td>
    <td><%=match_rst.getString(5) %></td>
  </tr>
  <% } %>
</table>
<% conn.close(); %>
	





</body>
</html>