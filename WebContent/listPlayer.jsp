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
	   String addPlayer = "select * from Players, Coaches where Players.playerID = ? and Players.playerID = Coaches.playerID";
	   String list_match = "select distinct A.name, B.name, D.matchDate, D.environment, C.score, T.name, C.matchID, A.playerID, C.opponentID, D.tournamentID from Players A, Players B, Plays C, Matches D, Tournaments T where A.playerID = ?" 
			   +" and A.playerID = C.playerID and C.opponentID=B.playerID and C.matchID = D.matchID and D.tournamentID = T.tournamentID";
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
	   String coach = null;
	   
	   if(rst.next()){
		   name = rst.getString("Players.name");
		   age = rst.getInt("Players.age");
		   nationality = rst.getString("Players.nationality");
		   height = rst.getDouble("height");
		   weight = rst.getDouble("weight");
		   plays = rst.getString("plays");
		   careerPrizeMoney = rst.getDouble("careerPrizeMoney");
		   rank = rst.getInt("rank");
		   points = rst.getInt("points");
		   coach = rst.getString("Coaches.name");
	   }
	  
%>
<title>Player</title>
</head>
<body>
	<jsp:include page="navBar.jsp" />
	<div style="position: relative;overflow:scroll">
	<div style="position:relative;top:100px;left: 50px; width: 1000px; height: 550px;">
	<h2>Player Information</h2>

	<div style="width: 400px; height: 550px;">
		<table border="1" style="width: 100%">
			<tr>
				<td>Name</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td>Age</td>
				<td><%=age %></td>
			</tr>
			<tr>
				<td>Nationality</td>
				<td><%=nationality %></td>
			</tr>
			<tr>
				<td>Height</td>
				<td><%=height %></td>
			</tr>
			<tr>
				<td>Weight</td>
				<td><%=weight %></td>
			</tr>
			<tr>
				<td>Plays</td>
				<td><%=plays %></td>
			</tr>
			<tr>
				<td>Career Prize Money</td>
				<td><%=careerPrizeMoney %></td>
			</tr>
			<tr>
				<td>Rank</td>
				<td><%=rank %></td>
			</tr>
			<tr>
				<td>Points</td>
				<td><%=points %></td>
			</tr>
			<tr>
				<td>Coach</td>
				<td><%=coach %></td>
			</tr>
				
		</table>
	</div>
	
	<br/>
<div style="position:relative;top: -350px; width: 1000px; height: 500px;">
<h3>Match History</h3>
	<table id="listOpponent" width="100%">
  <tr>
  	<th>Match Date</th>
    <th>Player Name</th>
    <th>Opponent Name</th>
    <th>Tournament</th>
    <th>Score</th>  
  </tr>
  
  <% while (match_rst.next()) {%>
  <tr>
   	<td>
    	 <%= match_rst.getDate(3)%>
	</td>
    <td>
   		 <form id="playerid1" action="listPlayer.jsp" method="post">
			<input type="hidden" value=<%=match_rst.getString(8)%> name="playerID">
			<a href="#" onclick="$(this).closest('form').submit();">  <%= match_rst.getString(1) %>
			</a>
		</form>
    
    </td>
    <td>
    	<form id="playerid2" action="listPlayer.jsp" method="post">
			<input type="hidden" value=<%=match_rst.getString(9)%> name="playerID">
			<a href="#" onclick="$(this).closest('form').submit();">  <%= match_rst.getString(2) %>
			</a>
		</form>
	</td>
    <td>
    	<form id="tourid" action="listTour.jsp" method="post">
				<input type="hidden" value=<%=match_rst.getString(10)%> name="tournamentID">
				</input> <a href="#" onclick="$(this).closest('form').submit();"> <%= match_rst.getString(6)%>
				</a>
		</form>
    </td>
    <td>
   		 <form id="matchFact" action="matchFacts.jsp"  method="post">
			<input type="hidden" value=<%=match_rst.getString(7)%> name="matchID">
			<input type="hidden" value=<%=match_rst.getDate(3)%> name="date">
			<a href="#" onclick="$(this).closest('form').submit();"> <%= match_rst.getString(5)%></a>
		</form>
  </tr>
  <% } %>
</table>
<% conn.close(); %>
	
	</div>
	</div>
	
</div>
 <jsp:include page="footer.jsp" />
</body>
</html>