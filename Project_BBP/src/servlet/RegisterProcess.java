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
 * Servlet implementation class RegisterProcess
 */
@WebServlet("/register")
public class RegisterProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterProcess() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		//get session user if exist
		User u = null;
		if ((User) session.getAttribute("user") != null) {
			u = (User) session.getAttribute("user");
		}
		
		//get parameters from form

		String firstname = request.getParameter("firstname");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String message = null;

		// default for citizen
		int role_id = 1;

		// check if administration register an user
		if (u != null && u.getRole().getId() == 2 && request.getParameter("usercategory") != null) {
			role_id = Integer.parseInt(request.getParameter("usercategory"));
		}

		// Check if all fields are filled
		if (firstname != null && name != null && email != null && password1 != null && password2 != null) {

			// get user from db
			User user = UserDao.searchUser(email);
			// Check if user exists
			if (user != null) {
				if (email.equals(user.getEmail())) {
					message = "Es gibt bereits einen Account mit der gleichen E-Mail Adresse";
					request.setAttribute("message", message);
					request.getRequestDispatcher("register.jsp").forward(request, response);
					System.out.println("Sorry, you are already registered");
				}
			} else {
				// Check if passwords match
				if (!password1.equals(password2)) {
					message = "Passwörterr stimmen nicht überein" + password1 + password2;
					request.setAttribute("message", message);
					request.getRequestDispatcher("register.jsp").forward(request, response);
				}
				// Safe User and forward to index
				else {
					if (User.createUser(email, name, firstname, password1, role_id)) {
						User n = User.getUser(email);

						if (n.getRole().getId() == 1) {
							if (u == null) {
								session.setAttribute("user", n);
								message = "Sie haben sich erfolgreich registriert und werden angemeldet!";
								request.setAttribute("message", message);
								getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
								return;
							}
							if (u != null) {

								message = "Sie haben sich erfolgreich einen Bürger registriert!";
							}
						}
						if (n.getRole().getId() == 2) {
							// response.sendRedirect("index.jsp");
							message = "Sie haben erfolgreich ein Verwaltungsmitglied registriert!";
						}
						if (n.getRole().getId() == 3) {
							// response.sendRedirect("index.jsp");
							message = "Sie haben erfolgreich ein Gemeinderatsmitglied registriert!";
						}
						// sets the message in request scope
						request.setAttribute("Message", message);
						getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);

					} else {
						message = "Fehler beim registrieren!";
						request.setAttribute("message", message);
						getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);

					}
				}
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
