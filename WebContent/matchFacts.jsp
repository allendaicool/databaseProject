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
	   
	   String listMatchFacts = "select distinct D.name, C.setswon, C.pointsWon, C.aces,"
			   +"C.doubleFaults, B.matchDate, D.playerID from Tournaments A, Matches B, MatchFacts C, Players D where A.tournamentID = B.tournamentID and B.matchID = C.matchID and C.playerID = D.playerID and B.matchID=? and B.matchDate = ? ";
	   
	   PreparedStatement match_fact = null;
	   match_fact =  conn.prepareStatement(listMatchFacts);
       String matchID = request.getParameter("matchID");
       String date = request.getParameter("date");
	   java.sql.Date playerdate = java.sql.Date.valueOf(request.getParameter("date"));
	   match_fact.setString(1,matchID);
	   match_fact.setDate(2, playerdate);
	   ResultSet rst = match_fact.executeQuery();
%>

<body> 
	<jsp:include page="navBar.jsp" />
    <div style="position:relative;top:100px;left: 50px; width: 800px; height: 500px;">
      <h2>Match Information</h2>
      <table border="1" style="margin-left: auto;margin-right: auto;position:relative;top:50px;width: 100%">
          <tr>
						<td>Name</td>
						<td>Sets Won</td>
						<td>Points Won</td>
						<td>Aces</td>
						<td>Double Faults</td>
						<td>Match Date</td>
		</tr>
		
		        <%while(rst.next()){ %>
					   <tr>
					       <td>
					       <form id="playerid" action="listPlayer.jsp" method="post">
								<input type="hidden" value=<%=rst.getString(7)%> name="playerID">
								 
								<a href="#" onclick="$(this).closest('form').submit();">  <%= rst.getString(1) %>
								</a>
							</form>
					       </td>
					       <td>
					       <%= rst.getInt(2) %>
					       </td>
					        <td>
					       <%= rst.getInt(3) %>
					       </td>
					        <td>
					       <%= rst.getInt(4) %>
					       </td>
					       <td>
					       <%= rst.getInt(5) %>
					       </td>
					       <td>
					       <%= rst.getDate(6) %>
					       </td>
					       
					   </tr>
					       <%} %>
		       
		
        
      
      </table>
      
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>