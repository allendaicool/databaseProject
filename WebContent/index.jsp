<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="dao.DButil"%>
<%@ page import="java.io.*"%>

<%
      Connection conn;
	  conn = DButil.getConnection();
	  String findAllPlayer = "select * from Players order by rank";
	  Statement stmt = null;
	  stmt = conn.createStatement();
	  //conn.setAutoCommit(false);
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery UI Tabs - Default functionality</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>
</head>
<body>

	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">Players</a></li>
			<li><a href="#tabs-2">Tournament</a></li>
			<li><a href="#tabs-3"></a></li>
		</ul>
		<div id="tabs-1">
			<% ResultSet rs = stmt.executeQuery(findAllPlayer);   %>
       
       <table border="1" style="width:100%">
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
				   <form id = "playerid"  action="listPlayer.jsp" method="post">
				   	   <input type="hidden" value=<%=playerID%> name="playerID"> </input>
				    <a href="#" onclick="$(this).closest('form').submit();">      
				          <%= name%> 
				    </a> 
				   </form>
				   
				</td>
				<td><%= rank%></td>
			</tr>
    <% } %>
			</table>



		</div>
		<div id="tabs-2">
			<p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus
				gravida ante, ut pharetra massa metus id nunc. Duis scelerisque
				molestie turpis. Sed fringilla, massa eget luctus malesuada, metus
				eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet
				fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam.
				Praesent in eros vestibulum mi adipiscing adipiscing. Morbi
				facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut
				posuere viverra nulla. Aliquam erat volutpat. Pellentesque
				convallis. Maecenas feugiat, tellus pellentesque pretium posuere,
				felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris
				consectetur tortor et purus.</p>
		</div>
		<div id="tabs-3">
			<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse
				potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque
				rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante.
				Class aptent taciti sociosqu ad litora torquent per conubia nostra,
				per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim
				commodo pellentesque. Praesent eu risus hendrerit ligula tempus
				pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a,
				lacus.</p>
			<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at,
				semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra
				justo vitae neque. Praesent blandit adipiscing velit. Suspendisse
				potenti. Donec mattis, pede vel pharetra blandit, magna ligula
				faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque.
				Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi
				lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean
				vehicula velit eu tellus interdum rutrum. Maecenas commodo.
				Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus
				hendrerit hendrerit.</p>
		</div>
	</div>


</body>

<script type="text/javascript">
function post_form( )
{
    var form_post = document.getElementById("playerid");
    form_post.submit();
    return 0; //error: no form found in ancestors
}
</script>

</html>
