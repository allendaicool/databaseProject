package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class updatePlayerServlet
 */
public class updatePlayerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePlayerServlet() {
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
		
		String updatePlayer = "update Players set age=?, nationality=?, height=?, weight=?, plays=?, careerPrizeMoney=?,rank=?,points=? where name = ?";
		try {
			conn = DButil.getConnection();
			stat = conn.prepareStatement(updatePlayer);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String player_name = request.getParameter("name");
		int player_age = Integer.parseInt(request.getParameter("age"));
		String nationality = request.getParameter("nationality");
		double height = Double.parseDouble(request.getParameter("height"));
		double weight = Double.parseDouble(request.getParameter("weight"));
		String hand_play = request.getParameter("plays");
		double careerMoney = Double.parseDouble(request.getParameter("careerPrizeMoney"));
		int rank =Integer.parseInt(request.getParameter("rank"));
		int points = Integer.parseInt(request.getParameter("points"));
	
		try {
			stat.setInt(1, player_age);
			stat.setString(2, nationality);
			stat.setDouble(3, height);
			stat.setDouble(4, weight);
			stat.setString(5, hand_play);
			stat.setDouble(6, careerMoney);
			stat.setInt(7, rank);
			stat.setInt(8, points);
			stat.setString(9, player_name);
			
			stat.executeUpdate();
			conn.close();
		} catch (Exception e ) {
			try {
				throw new Exception("it is wrong");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		HttpSession session = request.getSession();	
		session.setAttribute("updatePlayer", true);
		response.sendRedirect("index.jsp");
		
	}

}
