package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DButil {
	public static void main(String[] args) throws Exception{
		System.out.println(getConnection());
	}
	public static Connection getConnection() throws Exception{
		Connection conn = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String urlMy = "jdbc:mysql://cs4111.caravgioak9g.us-west-2.rds.amazonaws.com:3306/cs4111";
			String userName = "yd2300";
			String passWord = "349677Allencool";
			conn = DriverManager.getConnection(urlMy,userName,passWord);
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		return conn;
	}
	/* 关闭数据库链接*/
	public static void close(Connection con) throws SQLException{
		con.close();
	}
}
