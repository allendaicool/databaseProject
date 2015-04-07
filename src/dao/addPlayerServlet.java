package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class addPlayerServlet
 */
public class addPlayerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addPlayerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		Connection conn = null;
		PreparedStatement stat = null;

		String addPlayer = "INSERT INTO Players (playerID, name, age,nationality,height,weight, plays,careerPrizeMoney,rank,points)"
				+ " values(?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = DButil.getConnection();
			stat = conn.prepareStatement(addPlayer);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Statement countNum = null;
		String query = "select count(*) from Players ";



		String player_name = (request.getParameter("name"));
		int player_age = Integer.parseInt(request.getParameter("age"));

		String nationality = (request.getParameter("nationality"));

		double height = Double.parseDouble(request.getParameter("height"));

		double weight = Double.parseDouble(request.getParameter("weight"));

		String hand_play = request.getParameter("plays");

		double careerMoney = Double.parseDouble(request.getParameter("careerPrizeMoney"));

		int rank =Integer.parseInt(request.getParameter("rank"));

		int points = Integer.parseInt(request.getParameter("points"));


		int num = -1;
		try {
			countNum = conn.createStatement();

			ResultSet rs = countNum.executeQuery(query);

			while(rs.next()){
				num = rs.getInt(1);
				System.out.println("the number of player is " + num);
			}
			String pid = "p" + (num+1);
			stat.setString(1,pid);
			stat.setString(2, player_name);
			stat.setInt(3, player_age);
			stat.setString(4, nationality);
			stat.setDouble(5, height);
			stat.setDouble(6, weight);
			stat.setString(7, hand_play);
			stat.setDouble(8, careerMoney);
			stat.setInt(9, rank);
			stat.setInt(10, points);
            stat.executeUpdate();
            conn.close();
		}
		catch (Exception e ) {
			try {
				throw new Exception("it is wrong");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
  	    HttpSession session = request.getSession();	
  	    session.setAttribute("addnewPlayer", true);
		response.sendRedirect("index.jsp");
	}

}
