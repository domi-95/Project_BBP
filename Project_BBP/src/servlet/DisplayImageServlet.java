package servlet;

import java.io.IOException;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.*;
import file.File;
import project.*;

/**
 * Servlet implementation class DisplayImageServelet
 */
@WebServlet("/DisplayImageServlet")
public class DisplayImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DisplayImageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
/*
	private Spende getSpende(int id) throws SQLException {
		return Datenbank.holeSpende(id);

	}
*/
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int id = 0;
			int select = 0;
			File file = null;
			try {
				id = Integer.parseInt(request.getParameter("id"));
				select = Integer.parseInt(request.getParameter("select"));
			//	System.out.println(id);
			//	System.out.println(select);
			} catch (Exception e) {
				System.out.println("keine ID mitgegeben");
			}
			 //Project project = ProjectDao.searchProject(id);
			if (select == 1) {
			file = File.getFileProject(id);
			}
			
			if( select == 2) {
				file = File.getFileOp(id);
			}
			if(select == 3) {
				file = File.getFileBlog(id);
			}

			if (file.getFile().length == 0) {
				// No record found, redirect to default image.
				response.sendRedirect(request.getContextPath() + "/Images/noimage.png");
				return;
			}

			
			String imageFileName = "test.png";
			//System.out.println("File Name: " + imageFileName);

			String contentType = this.getServletContext().getMimeType(imageFileName);
			//System.out.println("Content Type: " + contentType);

			response.setHeader("Content-Type", contentType);

			response.setHeader("Content-Length", String.valueOf(file.getFile().length));

			response.setHeader("Content-Disposition", "inline; filename=\"" + imageFileName + "\"");

			// Schreibe das Bild als Response
			response.getOutputStream().write(file.getFile());

		} catch (Exception e) {
			throw new ServletException(e);
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
