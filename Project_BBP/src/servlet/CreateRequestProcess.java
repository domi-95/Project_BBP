package servlet;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.*;
import project.Project;

import javax.servlet.http.HttpSession;

@WebServlet("/CreateRequestProcess")
@MultipartConfig(maxFileSize = 1617721599) // upload file's size up to 16MB
public class CreateRequestProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//HttpSession session = request.getSession();
		//Anlaufstelle a = (Anlaufstelle) session.getAttribute("anlauf");

		// gets values of text fields
		String titel = request.getParameter("title");
		String category = request.getParameter("category");
		String shortDescription = request.getParameter("shortDescription");
		String description = "";
		String location = "";
		String investmentGrade = "";
		String phoneNumber = request.getParameter("phoneNumber");
		int period = 0;
		int anonymous = 0;
		//int anl_id = a.getId();
		String message = null;


		InputStream inputStream = null; // input stream of the upload file
		InputStream is = null;

		if("".equals(request.getParameter("description"))) {
			description = "";
		}
		else {
			description = request.getParameter("description");
		}
		if("".equals(request.getParameter("location"))) {
			location = "";
		}
		else {
			location = request.getParameter("location");
		}
		if("".equals(request.getParameter("investmentGrade"))) {
			investmentGrade = "";
		}
		else {
			investmentGrade = request.getParameter("investmentGrade");
		}
		if("".equals(request.getParameter("phoneNumber"))) {
			phoneNumber = "";
		}
		else {
			phoneNumber = request.getParameter("phoneNumber");
		}
		
		
		if ("on".equals(request.getParameter("anonymous"))) {
			anonymous = 1;
		} else {
			anonymous = 0;
		}

		if ("".equals(request.getParameter("period"))) {
			period = 0;
		} else {
			period = Integer.parseInt(request.getParameter("period"));
		}
/*
		if ("2".equals(request.getParameter("lieferungabholung"))) {
			abholung = 1;
		}
		if ("1".equals(request.getParameter("lieferungabholung"))) {
			lieferung = 1;
		}
*/
		// bezieht das Bild aus dem multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			// prints out some information for debugging
			//System.out.println(filePart.getName());
			//System.out.println(filePart.getSize());
			//System.out.println(filePart.getContentType());

			// bezieht den input stream vom bild

			inputStream = filePart.getInputStream();

		}
		if(filePart.getSize() > 6300) {
		try {

	        Image image = ImageIO.read(inputStream);

	        BufferedImage bi = this.createResizedCopy(image, 200, 200, true);
	       // ImageIO.write(bi, "jpg", new File("C:\\ImagenesAlmacen\\QR\\olaKeAse.jpg"));
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        ImageIO.write(bi, "jpg", baos);
	        is = new ByteArrayInputStream(baos.toByteArray());

	    } catch (IOException e) {
	    	message = "Es ist ein Fehler aufgetreten!";
	        System.out.println("Error by resizing picture");
	    }
	/*	finally {
			// close input stream
			if (inputStream != null) {
				inputStream.close();
			}*/
		}
		else {
			is = inputStream;
		}
		
		boolean successful = Project.createProject(titel, category, shortDescription, description, location, investmentGrade, phoneNumber, period, anonymous, is);
		if (successful == true) {
		message = "Das Projekt wurde erfolgreich erstellt";
		}
		else {
		message = "Das Projekt wurde nicht erfolgreich erstellt";
		}
		// sets the message in request scope
					request.setAttribute("Message", message);

					// zur message page
					getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
				//}


	}

		BufferedImage createResizedCopy(Image originalImage, int scaledWidth, int scaledHeight, boolean preserveAlpha){
	    int imageType = preserveAlpha ? BufferedImage.TYPE_INT_RGB : BufferedImage.TYPE_INT_ARGB;
	    BufferedImage scaledBI = new BufferedImage(scaledWidth, scaledHeight, imageType);
	    Graphics2D g = scaledBI.createGraphics();
	    if (preserveAlpha) {
	        g.setComposite(AlphaComposite.Src);
	    }
	    g.drawImage(originalImage, 0, 0, scaledWidth, scaledHeight, null);
	    g.dispose();
	    return scaledBI;
	}
		

}
