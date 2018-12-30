package servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ProjectDao;
import project.Project;

/**
 * Servlet implementation class DisplayProjectAll
 */
public class DisplayProjectAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayProjectAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		List<Project> projectlist = ProjectDao.getAllProject(1);
		
		
		//HTML Header
		out.println("<html>\n" + 
				"<head>\n" + 
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n" + 
				"\n" + 
				"    <meta charset=\"utf-8\">\n" + 
				"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n" + 
				"\n" + 
				"   <!-- Bootstrap style -->\n" + 
				"	<link rel=\"stylesheet\" type=\"text/css\" href=\"style/bootstrap.min.css\" media=\"screen\" />\n" + 
				"    \n" + 
				"	<!-- Custom styles -->\n" + 
				"	<link rel=\"stylesheet\" type=\"text/css\" href=\"style/signin.css\" media=\"screen\">\n" + 
				"	\n" + 
				"\n" + 
				"    <title>Login</title>\n" + 
				"\n" + 
				"  </head>");
		//HTML Body beginn
		out.println("<body>");
		out.println("<h1>Dies ist ein Test</h1>");
		
		for (Project p : projectlist){
			try {

				if (p.getPicture().length == 0) {
					// No record found, redirect to default image.
					out.println("<img src='" + "/Images/noimage.gif" + "' height= 200px");
					return;
				}

				// trump.jpg, putin.png
				String imageFileName = "test.png";
				System.out.println("File Name: " + imageFileName);

				String contentType = this.getServletContext().getMimeType(imageFileName);
				System.out.println("Content Type: " + contentType);

				response.setHeader("Content-Type", contentType);

				response.setHeader("Content-Length", String.valueOf(p.getPicture().length));

				response.setHeader("Content-Disposition", "inline; filename=\"" + imageFileName + "\"");

				// Schreibe das Bild als Response
				response.getOutputStream().write(p.getPicture());
				byte[] imgData = p.getPicture();
				String imgDataBase64=new String(Base64.getEncoder().encode(imgData));
				out.println("<img src='data:image/gif;base64," + imgDataBase64 + "' hight= 200px");

			} catch (Exception e) {
				throw new ServletException(e);
			}
			
			
			
			
			
			out.println("<img src='" + "' height= 200px");
			
			
			out.println("<h2>" + "</h2");
				
			
		}
		
		
		
		//HTML Body ende
		out.println("</body>");
		//HTML Tag ende
		out.println("</html>");
		
		
		
		

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
