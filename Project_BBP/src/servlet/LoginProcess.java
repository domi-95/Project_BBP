package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.UserDao;
import user.User;

/**
 * Servlet implementation class LoginProcess
 */
@WebServlet("/login")
public class LoginProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String message = null;
		String prevUrlp2 = request.getParameter("prevUrl2"); //gets part 2 of previous url
		String prevUrlp1 = request.getParameter("prevUrl1"); // gets part 1 of preious url
		String prevUrl = "";
		
		if(prevUrlp2.equals("null")) {
			prevUrlp2 = "index.jsp";
			prevUrl = prevUrlp1 + prevUrlp2; //creates index.jsp as previous url to forward to index after login			
		}else {
			prevUrl = prevUrlp1 + prevUrlp2;	// creates previous url to forword to last called page after login		
		}

		if (email != null && password != null) {

			if (User.getUserLogin(email, password) == false) { //checks if user and password are correct and belongs to an user
				message = "Das hat leider nicht funktioniert. Versicheren Sie sich, dass Ihre E-Mail-Adresse und das Passwort korrekt ist."; //sets variable for message which is displayed on login page
				request.setAttribute("message", message);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				System.out.println("Sorry, invalid Email or Password ");
			}
			else {
				User u = User.getUser(email);
				HttpSession session = request.getSession(); 
				session.setAttribute("user", u); // create session with user object
				response.sendRedirect(prevUrl);
				
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
