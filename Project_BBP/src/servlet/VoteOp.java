package servlet;

import java.awt.Choice;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import opinionPoll.*;

/**
 * Servlet implementation class VoteOp
 */
@WebServlet("/voteop")
public class VoteOp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteOp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = (request.getParameter("id"));
		int op_id =Integer.parseInt(id);
		int column = Integer.parseInt(request.getParameter(id));
		int user_id = Integer.parseInt(request.getParameter("user"));
		if (OpChoice.voteSingle(column, user_id, op_id) == true) {
			response.getWriter().print("Erfolgreich");
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