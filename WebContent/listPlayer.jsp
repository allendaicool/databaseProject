<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>

<%@ page import="java.sql.*"%>
<%@ page import="dao.DButil"%>
<%@ page import="java.io.*"%>

<html>
<head>

<link href="table.css" rel="stylesheet">

<%
      Connection conn;
	  conn = DButil.getConnection();
	  
	   PreparedStatement stat = null;
	   String addPlayer = "select * from Players where playerID = ?";
	  
	   stat = conn.prepareStatement(addPlayer);
	   String playerID = request.getParameter("playerID");
	   System.out.println(playerID);
	   stat.setString(1,playerID);
	   ResultSet rst = stat.executeQuery();
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
<title>HTTP Header Request Example</title>
</head>
<body>
	<h2>Player Information</h2>

	<div class="CSS_Table_Example" style="width: 250px; height: 500px;">
		<table>
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


	<% conn.close(); %>



</body>
</html>