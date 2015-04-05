package dao;

import java.sql.*;

import entity.user;

public class userlogin {
    
	 static Connection currentCon = null;
     static ResultSet rs = null;  
     public static int username_incorrect = 0;
     public static int password_incorrect = 1;
     public static int success_login = 2;

     
	 public static int checklogin (user temp){
		  Connection conn = null;
		  Statement stmt = null;
		  ResultSet rs;
		  try {
			conn = DButil.getConnection();
			String findAllUsers = "select * from users";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(findAllUsers); 
			if(rs.next()){
				   String admin = rs.getString(1);
				   String password = rs.getString(2);
				   if(!admin.equals(temp.getName())){
					   return username_incorrect;
				   }
				   if(!password.equals(temp.getPassword())){
					   return password_incorrect;
				   }
			}
           
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  return success_login;
	 }
}
