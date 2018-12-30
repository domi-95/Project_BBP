package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//HTML Header
		System.out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n" + 
				"<html>\n" + 
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
		System.out.println("<body>");
		System.out.println("<h1>Dies ist ein Test</h1>");
		
		
		
		
		//HTML Body ende
		System.out.println("</body>");
		//HTML Tag ende
		System.out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
