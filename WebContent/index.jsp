<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="dao.DButil"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.player_opponent"%>


<style>
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
      Connection conn;
	  conn = DButil.getConnection();
	  String findAllPlayer = "select * from Players order by rank";
	  Statement stmt = null;
	  stmt = conn.createStatement();
	  //conn.setAutoCommit(false);
    %>
	<jsp:include page="navBar.jsp" />
	<div style="position: relative;top: 50px;overflow:scroll">
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
		<%     if (session.getAttribute("currentSessionUser") != null) {%>
            
      <form action="addPlayerServlet" method="post"  style="padding-left: 4cm; padding-right: auto;border: 1px solid red">
   		<fieldset  >
			<legend>
				add_player
			</legend>
   		Name: 
		<input name="name" /><br/>
   		Age: <input name="age" /><br/>
   		nationality: <input name="nationality" /> </br>
   		height: <input name="height" /> </br>
   		weight: <input name="weight" /> </br>
   		plays: <input type="radio" name="plays" value="Right-handed" checked>Right-handed
   		&nbsp &nbsp &nbsp  
   		<input type="radio" name="plays" value="Left-handed" checked>Left-handed
   		careerPrizeMoney: <input name="careerPrizeMoney"/> 
   		rank: <input name="rank"/> 
   		points:<input name="points"/> 
   		<input type="submit" value="add" />
   		</fieldset>
    </form>
    
    
    <%} %>
        <div class="center-block">
    <form action="checkPlayerServlet" method="post" >
   		playerName: 
		 <input name="pname" /> &nbsp &nbsp
   		opponentName: <input name="oname" /> 
   		&nbsp &nbsp   
   		<input type="submit" value="checkMatch" />
    </form>     
        </div>
	<div class="center-block"  >

	     <% 
	        ArrayList<player_opponent> rst = (ArrayList<player_opponent>)session.getAttribute("resultSet");
	        session.removeAttribute("resultSet");
	     %>
	     <%if(rst!=null){ %>
	         <table id="pomatch" style="margin-left: auto;margin-right: auto">
        <tr>
       	 <th>playerName</th>
    	 <th>opponentName</th>
    	<th>matchDate</th>
    	<th>environment</th>
    	<th>score</th>  
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
	
	

	

