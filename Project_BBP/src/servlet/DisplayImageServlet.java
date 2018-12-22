package servlet;

import java.io.IOException;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.Dao;
import project.project;

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
			try {
				id = Integer.parseInt(request.getParameter("id"));
			} catch (Exception e) {
				System.out.println("keine ID mitgegeben");
			}
			project project = Dao.searchRequest(3);

			if (project.getPicture().length == 0) {
				// No record found, redirect to default image.
				response.sendRedirect(request.getContextPath() + "/Images/noimage.gif");
				return;
			}

			// trump.jpg, putin.png
			String imageFileName = "test.png";
			System.out.println("File Name: " + imageFileName);

			String contentType = this.getServletContext().getMimeType(imageFileName);
			System.out.println("Content Type: " + contentType);

			response.setHeader("Content-Type", contentType);

			response.setHeader("Content-Length", String.valueOf(project.getPicture().length));

			response.setHeader("Content-Disposition", "inline; filename=\"" + imageFileName + "\"");

			// Schreibe das Bild als Response
			response.getOutputStream().write(project.getPicture());

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
