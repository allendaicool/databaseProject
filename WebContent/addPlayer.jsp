<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<h1> add Players</h1>

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
   

