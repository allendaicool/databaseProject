<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>


<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.DButil"%>
<%@ page import="java.io.*"%>



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
	   
	  
%>

<body>

   	<jsp:include page="navBar.jsp" />
   <div style="position:relative;top:100px;left: 50px; width: 800px; height: 500px;">
	<h2>Tournament Information</h2>
  
	
		<table border="1" style="width: 100%">
		
		<%
		if (rst.next()) {
	  	 	name = rst.getString("Tournaments.name");
	  		place = rst.getString("place");
	  	 	surface = rst.getString("surface");
	  	 	category = rst.getString("category");
		}
	   	%>
	   	
			
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
	
	
 		 
	<div style="position: relative;top: -250px;height:400px">
	<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Past Champions</a></li>
				<li><a href="#tabs-2">Prize Money</a></li>
				<li><a href="#tabs-3">Matches</a></li>
			</ul>
			<div id="tabs-1">
				<table border="1" style="width: 100%">
					<tr>
						<td>Year</td>
						<td>Champion</td>
					</tr>
		<%
		rst = stat.executeQuery();
		while (rst.next()){
	  	 	championID = rst.getString("championID");
	  	 	championName = rst.getString("Players.name");
	  	 	System.out.println(championName);
	   	 	year = rst.getInt("year");
	   	%>
					<tr>
						<td><%= year%></td>
						<td>
							<form id="playerid" action="listPlayer.jsp" method="post">
								<input type="hidden" value=<%=championID%> name="playerID">
								<a href="#" onclick="$(this).closest('form').submit();"> <%= championName%>
								</a>
							</form>

						</td>
						
					</tr>
				<% } %>
				</table>
			</div>
			
			<div id="tabs-2">
				<table border="1" style="width: 100%">
					<tr>
						<td>Year</td>
						<td>Prize Money</td>
					</tr>
				<%
					rst = stat.executeQuery();
					while (rst.next()){
						prizeMoney = rst.getDouble("prizeMoney");
	   	 				year = rst.getInt("year");
	   			%>
					<tr>
						<td><%= year%></td>
						<td><%= prizeMoney %></td>
					</tr>
				<% } %>
				</table>		
		</div>
		<div id="tabs-3">
			<%
				ResultSet rs = null;
			    
				PreparedStatement stat2 = null;
				String date = null; 
				String round = null;
				int duration = 0;
				String winner = null;
				String environment = null;
				String referee = null;
				String score = null;  
				String matchID = null;
				
				if (request.getParameter("matchYear") != null) {
					String findMatch = "select * from Matches, Players, Referees, Tournaments, Plays where Players.playerID = Plays.playerID and Plays.matchID = Matches.matchID and Tournaments.tournamentID = Matches.tournamentID and winnerID = Players.playerID and Matches.refereeID = Referees.refereeID and Tournaments.tournamentID = ? and year = ? and year(matchDate) = year order by matchDate desc";
			 		stat2 = conn.prepareStatement(findMatch);
				
			   		System.out.println(tourID);
			   		stat2.setString(1,tourID);
			   		int matchYear = 2015;
			   
			   		matchYear = Integer.valueOf(request.getParameter("matchYear"));
			   	
			   	
					System.out.println(matchYear);
					stat2.setInt(2,matchYear);
			   		rs = stat2.executeQuery();
			 }
				
				
			%>
			
				<form action="#tabs-3" style="width:110px;" method="post">
					<div>
						<select class="form-control" id="matchYear" name="matchYear">
							<option value="2015">2015</option>
							<option value="2014">2014</option>
							<option value="2013">2013</option>
							<option value="2012">2012</option>
							<option value="2011">2011</option>
							<option value="2010">2010</option>
						</select>
						<input type="hidden" value=<%=tourID%> name="tournamentID">
						<div style="Position:relative; left=20px;"><input type="submit" value="Filter Match"></div>
					</div>
				</form>	
				<table border="1" style="width: 100%">
					<tr>
						<td>Date</td>
						<td>Round</td>
						<td>Duration</td>
						<td>Environment</td>
						<td>Winner</td>
						<td>Referee</td>
						<td>Scores</td>
					</tr>
					<%
					if (rs!=null){
					   while (rs.next()){
					 date = rs.getDate("matchDate").toString();
					 matchID = rs.getString("matchID");
					 round = rs.getString("round");
					 duration = rs.getInt("time");
					 winner = rs.getString("Players.name");
					 environment = rs.getString("environment");
					 category = rs.getString("category");
					 referee = rs.getString("Referees.name");
					 score = rs.getString("score");
					 %>
				
					
					<tr>
						<td>
							<%= date%>			
						 </td>
						<td><%= round %></td>
						<td><%= duration %></td>
						<td><%= environment %></td>
						<td>
						 	<form id="playerid1" action="listPlayer.jsp" method="post">
								<input type="hidden" value=<%=rs.getString("playerId")%> name="playerID">
								<a href="#" onclick="$(this).closest('form').submit();">  <%= winner %>
								</a>
							</form>
						<td><%= referee %></td>
						<td>
							<form id="matchFact" action="matchFacts.jsp"  method="post">
								<input type="hidden" value=<%=matchID%> name="matchID">
								<input type="hidden" value=<%=tourID%> name="tournamentID">
								<input type="hidden" value=<%=date%> name="date">
								 
								<a href="#" onclick="$(this).closest('form').submit();"> <%= score %>
								</a>
					    	</form>
						</td>
					</tr>
					<% 	 }
					  }
		         %>
				</table>
				
			
		</div>
	<% conn.close(); %>
	</div>
	</div>

<jsp:include page="footer.jsp" />
</body>
</html>