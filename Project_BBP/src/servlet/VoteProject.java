package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.*;

/**
 * Servlet implementation class VoteProject
 */
@WebServlet("/votep")
public class VoteProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteProject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = (request.getParameter("id"));
		System.out.println("ID:"+id);
		int p_id =Integer.parseInt(id);
		System.out.println("ID:"+id);
		int user_id = Integer.parseInt(request.getParameter("user"));
		if (Project.Vote(user_id, p_id) == true) {
			//response.getWriter().print("Erfolgreich");
		}else {
			response.getWriter().print("nicht erfolgreich");
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
