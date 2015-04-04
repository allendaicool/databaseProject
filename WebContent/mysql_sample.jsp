<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page import="java.sql.*"%>
<%@ page import="dao.DButil"%>
<%@ page import="java.io.*"%>

<%
      Connection conn;
	  conn = DButil.getConnection();
	  PreparedStatement stat = null;
	  String addPlayer = "INSERT INTO Players (playerID, name, age,nationality,height,weight, plays,careerPrizeMoney,rank,points)"
      + " values(?,?,?,?,?,?,?,?,?,?)";
	  
	  stat = conn.prepareStatement(addPlayer);
	  Statement countNum = null;
	  String query = "select count(*) from Players ";
	  
	  //conn.setAutoCommit(false);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSP sample</title>
</head>
<body>
	<h1>add playering</h1>
	<% 
     String player_name = (request.getParameter("name"));
     System.out.println(player_name);
     int player_age = Integer.parseInt(request.getParameter("age"));
     System.out.println(player_age);

     String nationality = (request.getParameter("nationality"));
     System.out.println(nationality);

     double height = Double.parseDouble(request.getParameter("height"));
     System.out.println(height);

     double weight = Double.parseDouble(request.getParameter("weight"));
     System.out.println(weight);

     String hand_play = request.getParameter("plays");
     System.out.println(hand_play);

     double careerMoney = Double.parseDouble(request.getParameter("careerPrizeMoney"));
     System.out.println(careerMoney);

     int rank =Integer.parseInt(request.getParameter("rank"));
     System.out.println(rank);

     int points = Integer.parseInt(request.getParameter("points"));
    
     System.out.println(points);
     
     int num = -1;
     try {
     countNum = conn.createStatement();
     
     ResultSet rs = countNum.executeQuery(query);
     
        while(rs.next()){
    	   num = rs.getInt(1);
    	   System.out.println("the number of player is " + num);
       }
     }
     catch (SQLException e ) {
         throw new Exception("it is wrong");
     }
     String site = new String("addPlayer.jsp");
     response.setContentType("text/html"); 
     String message = "successfully added";
     request.setAttribute("message", message);
     
     PrintWriter outPut = response.getWriter(); 
     //output.print("")
     request.getRequestDispatcher("/addPlayer.jsp").forward(request, response);
     
%>


</body>
</html>