<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1> add Players</h1>


   <%     String temp = (String)request.getAttribute("message"); %>
          <p>  Message: <%=temp %></p> 
   
  

 

<form action="mysql_sample.jsp" method="post"/>
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
   		careerPrizeMoney: <input name="careerPrizeMoney"/> </br>
   		rank: <input name="rank"/> </br>
   		points:<input name="points"/> </br>
   		<input type="submit" value="add" />
	
   		</fieldset>
   </form>
   

</body>
</html>