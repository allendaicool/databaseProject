package dao;

import java.util.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class checkPlayerServlet
 */

public class checkPlayerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public checkPlayerServlet() {
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
		PreparedStatement match = null;
		String list_match = "select distinct A.name, B.name, D.matchDate, D.environment, C.score from Players A, Players B, Plays C, Matches D, Tournaments T where A.name = ?" 
				+" and B.name=? and A.playerID = C.playerID and C.opponentID=B.playerID and C.matchID = D.matchID and D.tournamentID = T.tournamentID";
		try {
			conn = DButil.getConnection();

			match = conn.prepareStatement(list_match);
			String playerName = request.getParameter("pname").trim();
			String opponent = request.getParameter("oname").trim();
			match.setString(1,playerName);
			match.setString(2,opponent);
			ResultSet set = match.executeQuery();
	        HttpSession session = request.getSession();	
	        List<player_opponent> listing = new ArrayList<player_opponent>();
	        
	        while(set.next()){
	        	player_opponent temp = new player_opponent(set.getString("A.name"),set.getString("B.name"),set.getDate("D.matchDate"), set.getString("T.name"),set.getString("C.score"));
	        	listing.add(temp);
	        }
	        session.setAttribute("resultSet", listing);
	        conn.close();
	        response.sendRedirect("index.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
