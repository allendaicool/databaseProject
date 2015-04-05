package dao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.user;

/**
 * Servlet implementation class loginServelet
 */
public class loginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try
		{	    
			 user tempUser = new user();
			 tempUser.setName(request.getParameter("username"));
			 tempUser.setPassword(request.getParameter("Password"));
             
		     if (userlogin.checklogin(tempUser) == userlogin.success_login)
		     {
			        
		          HttpSession session = request.getSession(true);	
		          session.setAttribute("currentSessionUser",tempUser); 
		          response.sendRedirect("index.jsp"); //logged-in page      		
		     }
		     else {
		    	  HttpSession session = request.getSession();	
		    	  session.setAttribute("invalid password", true);
		          response.sendRedirect("index.jsp"); //error page 
		     }
		} 
				
				
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
