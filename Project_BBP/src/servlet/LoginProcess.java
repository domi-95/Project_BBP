package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

		if (email != null && password != null) {

			// out.print(email + password);

			User u = User.getUserLogin(email, password);

			if (u == null) {
				message = "Das hat leider nicht funktioniert. Versicheren Sie sich, dass Sie die richtige E-Mail-Adresse und das richtige Passwort verwenden.";
				request.setAttribute("message", message);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				System.out.println("Sorry, invalid Email or Password ");
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("objekt", u);
				if (u.getRole().getId() == 1) {
					response.sendRedirect("welcome_buerger.jsp");
				}
				if (u.getRole().getId() == 2) {
					response.sendRedirect("welcome_verwaltung.jsp");
				}
				if (u.getRole().getId() == 3) {
					response.sendRedirect("DisplayProjectAll");
				}
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
