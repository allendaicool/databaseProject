<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>


<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.DButil"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<jsp:include page="navBar.jsp" />
     
     <%
       Connection conn;
	   conn = DButil.getConnection();
	   
	   String listMatchFacts = "select distinct D.name, C.setswon, C.pointsWon, C.aces,"
			   +"C.doubleFaults, B.matchDate from Tournaments A, Matches B, MatchFacts C , Players D where A.tournamentID = B.tournamentID and B.matchID = C.matchID and C.playerID = D.playerID and A.tournamentID=? and B.matchDate = ? ";
	   
	   PreparedStatement match_fact = null;
	   match_fact =  conn.prepareStatement(listMatchFacts);
       String tourID = request.getParameter("tourID");
       String date = request.getParameter("date");
	   java.sql.Date playerdate = java.sql.Date.valueOf(request.getParameter("date"));
	   match_fact.setString(1,tourID);
	   match_fact.setDate(2, playerdate);
	   ResultSet rst = match_fact.executeQuery();

      %>
      
      <table border="1" style="margin-left: auto;margin-right: auto;position:relative;top:200px;width: 70%">
          <tr>
						<td>name</td>
						<td>setswon</td>
						<td>pointsWon</td>
						<td>aces</td>
						<td>doubleFaults</td>
						<td>matchDate</td>
		</tr>
		
		        <%while(rst.next()){ %>
					   <tr>
					       <td>
					       <%= rst.getString(1) %>
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

</body>
</html>