<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="dao.DButil"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.player_opponent"%>


<style>

label{
			width: 200px;
			float: left;
			text-align: right;
			margin-right: 0.5em;
			display: block
		}

#pomatch, #pomatch th, #pomatch td {
    border: 1px solid black;
    
}
.center-block{
    vertical-align: middle;
    padding-left:auto;
    padding-right:auto;
    
}
.
</style>
	<%
	try {
      Connection conn;
	  conn = DButil.getConnection();
	  String findAllPlayer = "select * from Players order by rank";
	  String listAllTour = "select distinct name, tournamentID, category from Tournaments order by category";
	  Statement stmt = null;
	  stmt = conn.createStatement();
	  //conn.setAutoCommit(false);
    %>
	<jsp:include page="navBar.jsp" />
	<div style="position: relative;top: 100px;overflow:scroll">
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Players</a></li>
				<li><a href="#tabs-2">Tournaments</a></li>
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
								 
								<a href="#" onclick="$(this).closest('form').submit();"> <%= name%>
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
	} catch(Exception e){
		e.printStackTrace();
		throw e;
		
	}
			%>
			</div>
		</div>
		<%     if (session.getAttribute("currentSessionUser") != null) {%>
            
      <form action="addPlayerServlet" method="post"  style="Position:relative;top:30px; padding-left: 4cm; padding-right: auto;border: 1px solid red">
   		<fieldset  >
			<legend>
				Add New Player
			</legend>
   		<label for="name">Name:</label>
		<input name="name"/><br/>
		<label for="age">Age:</label>
    	<input name="age" /><br/>
    	<label for="nationality">Nationality:</label>
   		<input name="nationality" /> </br>
   		<label for="height">Height:</label>
   		<input name="height" /> </br>
   		<label for="weight">Weight:</label>
   		<input name="weight" align="right"/> </br>
   		<label for="careerPrizeMoney">Career Prize Money:</label>
   		<input name="careerPrizeMoney"/></br> 
   		<label for="rank">Rank:</label>
   		<input name="rank"/> </br>
   		<label for="points">Points:</label>
   		<input name="points"/> </br>
   		<label for="plays">Plays:</label>
   		<input type="radio" name="plays" value="Right-handed" checked>Right-handed
   		&nbsp &nbsp &nbsp  
   		<input type="radio" name="plays" value="Left-handed" checked>Left-handed</br>
   		<input type="submit" value="Add" />
   		</fieldset>
    </form>
    
   
    <form action="updatePlayerServlet" method="post" style="Position:relative;top:30px;padding-left: 4cm; padding-right: auto; border: 1px solid red">
    <fieldset  >
			<legend>
				Update Player Information
			</legend>
		<label for="name">Name:</label>
		<input name="name"/><br/>
		<label for="age">Age:</label>
    	<input name="age" /><br/>
    	<label for="nationality">Nationality:</label>
   		<input name="nationality" /> </br>
   		<label for="height">Height:</label>
   		<input name="height" /> </br>
   		<label for="weight">Weight:</label>
   		<input name="weight" align="right"/> </br>
   		<label for="careerPrizeMoney">Career Prize Money:</label>
   		<input name="careerPrizeMoney"/></br> 
   		<label for="rank">Rank:</label>
   		<input name="rank"/> </br>
   		<label for="points">Points:</label>
   		<input name="points"/> </br>
   		<label for="plays">Plays:</label>
   		<input type="radio" name="plays" value="Right-handed" checked>Right-handed
   		&nbsp &nbsp &nbsp  
   		<input type="radio" name="plays" value="Left-handed" checked>Left-handed</br>
   		<input type="submit" value="Update" /></br>
   		</fieldset>
    </form>
    
      <form action="deletePlayerServelet" method="post"  style="Position:relative;top:30px;padding-left: 4cm; padding-right: auto;border: 1px solid red">
   		<fieldset  >
			<legend>
				Delete Player
			</legend>
   		<label for="name">Player Name:</label>
		<input name="name" />&nbsp &nbsp &nbsp
   		<div style="Position:relative; left:208px;"><input type="submit" value="Delete" /></div>
   		</fieldset>
    </form>
    
    
    <%} %>
        <div  style="Position:relative;top:30px; padding-left: 4cm;padding-right: auto;border: 1px solid red">
   			<form action="checkPlayerServlet" method="post" >
   				<legend>
					Check Match
				</legend>
   			 	<label for="playerName">Player Name:</label> 
				 <input name="pname" /></br>
				 <label for="opponentName">Opponent Name:</label> 
   				 <input name="oname" /> </br>
   				<div style="Position:relative; left:208px;"><input type="submit" value="Check" /></div>
    		</form>     
        </div>
		<div class="center-block" style="Position:relative; top: 30px; left:4cm;" >

	     <% 
	        ArrayList<player_opponent> rst = (ArrayList<player_opponent>)session.getAttribute("resultSet");
	        session.removeAttribute("resultSet");
	     %>
	     <%if(rst!=null){ %>
	    <table id="pomatch" style="Position:relative; top: 30px;">
        	<tr>
       			 <th>Player Name</th>
    			 <th>Opponent Name</th>
    			 <th>Match Date</th>
    			 <th>Environment</th>
    			 <th>Score</th>  
  			</tr>
  
  		 <% for (player_opponent temp:rst) {%>
 			 <tr>
   				 <td><%=temp.playerName %></td>
    			 <td><%=temp.opponentName %></td>
   				 <td><%=temp.matchDate %></td>
   				 <td><%=temp.environment %></td>
   				 <td><%=temp.score %></td>
  			</tr>
  		<% } 
 		 }%>
  
		</table>
	 </div>
     <jsp:include page="footer.jsp" />
	
	</div>
	
</body>
</html>
	
	

	

