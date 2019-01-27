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
		String prevUrlp2 = request.getParameter("prevUrl2");
		String prevUrlp1 = request.getParameter("prevUrl1");
		String prevUrl = "";
		//String prevUrl = request.getHeader("Referer");
		if(prevUrlp2.equals("null")) {
			prevUrlp2 = "index.jsp";
			prevUrl = prevUrlp1 + prevUrlp2;			
		}else {
			prevUrl = prevUrlp1 + prevUrlp2;			
		}

		if (email != null && password != null) {

			// out.print(email + password);

		

			if (User.getUserLogin(email, password) == false) {
				message = "Das hat leider nicht funktioniert. Versicheren Sie sich, dass Ihre E-Mail-Adresse und das Passwort korrekt ist.";
				request.setAttribute("message", message);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				System.out.println("Sorry, invalid Email or Password ");
			}
			else {
				User u = User.getUser(email);
				HttpSession session = request.getSession();
				session.setAttribute("user", u);
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
