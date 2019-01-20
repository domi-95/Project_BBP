package servlet;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import project.*;
import opinionPoll.*;

/**
 * Servlet implementation class CreateOpinionPollProcess
 */
@WebServlet("/CreateOpinionPoll")
@MultipartConfig(maxFileSize = 1617721599) // upload file's size up to 16MB
public class CreateOpinionPollProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateOpinionPollProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String help = null;
		String title = null;
		String short_description = null;
		String description = null;
		int max_choice = 0;
		List<String> result = new LinkedList<String>();
		String message = null;
		String date_from = null;
		String date_to = null;
		int user_id = 0;
		
		InputStream inputStream = null; // input stream of the upload file
		InputStream is = null;
		user_id = Integer.parseInt(request.getParameter("user"));

		if ("".equals(request.getParameter("title"))) {
			title = "";

		} else {
			title = request.getParameter("title");
		}
		
		if ("".equals(request.getParameter("short_description"))) {
			short_description = "";

		} else {
			short_description = request.getParameter("short_description");
		}
		
		if ("".equals(request.getParameter("description"))) {
			description = "";

		} else {
			description = request.getParameter("description");
		}
		
		/*if ("".equals(request.getParameter("max_choice"))) {
			max_choice = 0;
		} else {
			max_choice = Integer.parseInt(request.getParameter("period"));
		}*/
		
		if ("".equals(request.getParameter("date_from"))) {
			date_from = "";

		} else {
			date_from = request.getParameter("date_from");
		}
		
		if ("".equals(request.getParameter("date_to"))) {
			date_to = "";

		} else {
			date_to = request.getParameter("date_to");
		}
		
		for (int i = 1; i<11; i++){
			
			
			if ("".equals(request.getParameter("n_"+i+""))) {
				help= "";

			} else {
				help = request.getParameter("n_"+i+"");
			}
			
			result.add(help);
			}
		
		
		Part filePart = request.getPart("photo");
		if (filePart != null) {
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
		boolean successful = OpinionPoll.createProject(title, short_description, description, is, result, date_from, date_to, user_id);
		if (successful == true) {
		message = "Das Abstimmung wurde erfolgreich erstellt";
		}
		else {
		message = "Das Abstimmung wurde nicht erfolgreich erstellt";
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
