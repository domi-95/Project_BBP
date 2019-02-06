package servlet;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import opinionPoll.EvaluationXML;

/**
 * Servlet implementation class Download
 */
@WebServlet("/downloadXML")
public class Download extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Download() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			System.out.println("keine ID mitgegeben");

		      // Set response content type
		      response.setContentType("text/html");

		      // Actual logic goes here.
		      PrintWriter out = response.getWriter();
		      out.println("<h1>" + "keine ID mitgegeben" + "</h1>");
		      e.printStackTrace();
		      return;
		      
		}  
		
		response.setContentType("application/octet-stream");
	    response.setHeader("Content-Disposition","attachment;filename=auswertung_id_"+id+"_.xml");
					
		try 
		{
			ServletOutputStream out = response.getOutputStream();
			
				String s;
				byte[] byteArray = EvaluationXML.generateXML(id).toString().getBytes("UTF-8");
		
			InputStream in = new ByteArrayInputStream(byteArray);
			
			byte[] outputByte = new byte[4096];
			//copy binary contect to output stream
			while(in.read(outputByte, 0, byteArray.length) != -1)
			{
				out.write(outputByte, 0, byteArray.length);
			}
			in.close();
			out.flush();
			out.close();
			
		  }catch(Exception e) {
			  e.printStackTrace();
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
