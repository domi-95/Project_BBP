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

		
		switch(role){
		case 2:{
			if(request.getParameter("acceptreject").equals("approve")) { // Check if approve or reject button was clicked to call servlet
				
				p.approveAdministration();
				message = "Projekt wurde freigegeben"; //sets variable for message which is displayed in the snackbar after approve/reject
			}
			else {
				if(request.getParameter("acceptreject").equals("reject")) { // Check if approve or reject button was clicked to call servlet
					
					p.declineAdministration(comment);			//give him here your comment with which is necessary
					message = "Projekt wurde abgelehnt";
				}
				else {
					message = "Es ist ein Fehler aufgetreten"; //sets variable for message which is displayed in the snackbar after approve/reject
				}
			}
			break;
		}
		case 3: {
			if(request.getParameter("acceptreject").equals("approve")) {
				
				p.approveCouncil( comment);	//give him here your comment with which is necessary
				message = "Projekt wurde genehmigt"; //sets variable for message which is displayed in the snackbar after approve/reject
			}
			else {
				if(request.getParameter("acceptreject").equals("reject")) {
					
					p.declineCouncil(comment);			//give him here your comment with which is necessary
					message = "Projekt wurde zurückgewiesen"; //sets variable for message which is displayed in the snackbar after approve/reject
				}
				else {
					message = "Es ist ein Fehler aufgetreten"; //sets variable for message which is displayed in the snackbar after approve/reject
				}
			}
			break;
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
