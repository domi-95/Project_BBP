package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.Project;
import project.State;

/**
 * Servlet implementation class ApproveProject
 */
public class ApproveProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApproveProject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String message = null;
		int id = Integer.parseInt(request.getParameter("pId"));
		int role = Integer.parseInt(request.getParameter("role"));
		String comment = request.getParameter("comment");
		System.out.println(comment);
		Project p = Project.getProject(id);
	//	p.approve(new State(2,"freigegeben"));
		
		switch(role){
		case 2:{
			if(request.getParameter("acceptreject").equals("approve")) {
				
				p.approveAdministration();
				message = "Projekt wurde freigegeben";
			}
			else {
				if(request.getParameter("acceptreject").equals("reject")) {
					
					p.declineAdministration(comment);			//give him here your comment with which is necessary
					message = "Projekt wurde abgelehnt";
				}
				else {
					message = "Es ist ein Fehler aufgetreten";
				}
			}
			break;
		}
		case 3: {
			if(request.getParameter("acceptreject").equals("approve")) {
				
				p.approveCouncil( comment);	//give him here your comment with which is necessary
				message = "Projekt wurde freigegeben";
			}
			else {
				if(request.getParameter("acceptreject").equals("reject")) {
					
					p.declineCouncil(comment);			//give him here your comment with which is necessary
					message = "Projekt wurde abgelehnt";
				}
				else {
					message = "Es ist ein Fehler aufgetreten";
				}
			}
			break;
		}
		}
		
		
		
		//request.setAttribute("message", message);
		//request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
