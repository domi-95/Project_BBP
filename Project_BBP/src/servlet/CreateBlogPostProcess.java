package servlet;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import project.Project;

/**
 * Servlet implementation class CreateBlogPostProcess
 */
@WebServlet("/CreateBlogProcess")
@MultipartConfig(maxFileSize = 1617721599) // upload file's size up to 16MB
public class CreateBlogPostProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateBlogPostProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = null;
		String category = null;
		String content = null;
		int user_id = 0;
		String message = null;

		InputStream inputStream = null; // input stream of the upload file
		InputStream is = null;
		
		
		if("".equals(request.getParameter("title"))) {
			title = "";
		}
		else {
			title = request.getParameter("title");
		}
		
		if("".equals(request.getParameter("category"))) {
			category = "";
		}
		else {
			category = request.getParameter("category");
		}
		
		if("".equals(request.getParameter("content"))) {
			content = "";
		}
		else {
			content = request.getParameter("content");
		}
		
		user_id = Integer.parseInt(request.getParameter("user"));
		
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
		//Resizing images which are bigger than 4MB
		if(filePart.getSize() > 4000000) {
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			Image image = ImageIO.read(inputStream);
			BufferedImage bimage = (BufferedImage)image;
			double szf = 0.9; //Sizing factor for resizing the image
			//Resizing image till it is smaller than 4MB
			do {
			baos = new ByteArrayOutputStream();
	        int height = bimage.getHeight();
	        int width = bimage.getWidth();
	        height = (int)(height * szf);
	        width = (int)(width * szf);
	        System.out.println("Height : " + height);
	        System.out.println("Width : " + width);
	        BufferedImage bi = this.createResizedCopy(image, width, height, true);
	       // ImageIO.write(bi, "jpg", new File("C:\\ImagenesAlmacen\\QR\\olaKeAse.jpg"));
	        ImageIO.write(bi, "jpg", baos);
	        System.out.println(baos.size());
	        szf = szf - 0.1;
			}while(baos.size() > 4000000);
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
		
		boolean successful = Project.createProject(titel, category, shortDescription, description, location, investmentGrade, phoneNumber, period, anonymous, is, user_id);
		if (successful == true) {
		message = "Der Blogeintrag wurde erfolgreich erstellt";
		}
		else {
		message = "Der Blogeintrag wurde nicht erfolgreich erstellt";
		}
		// sets the message in request scope
					request.setAttribute("Message", message);

					// zur message page
					getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
				//}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
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
