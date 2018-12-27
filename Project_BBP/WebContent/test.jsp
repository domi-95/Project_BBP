<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@page import="user.*"%>
<%@page import="project.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	List<Project> projectlist = ProjectDao.getAllProject(1);
	//out.print (projectlist);
	for (Project p : projectlist){
	//Project project = ProjectDao.searchProject(3);
	// byte[] picture= project.getPicture();
	//ut.print (project.getPicture());
	//request.getSession();
	//session.setAttribute("picture", p.getPicture());
	
	//RequestDispatcher rd = request.getRequestDispatcher("/DisplayImageServlet2");
    request.setAttribute("picture",p.getPicture());
    //rd.forward(request, response);
    
	%>
	
	 <img src="DisplayImageServlet2" height="200px"/>  
	
	<h2><%out.print(p.getTitle()); %></h2>
	<% 
	//session.invalidate();
	}
	/* response.setContentType("image/gif");
    response.setContentLength(picture.length);
    ServletOutputStream sos = response.getOutputStream();
    //ServletOutputStream sos;
    sos.write(picture);
    response.getOutputStream().flush();
    response.getOutputStream().close(); */
	%>
	

<!--  <img class='imagem_artigo' src="data:image/png;base64,<% //out.print(project.getPicture());%> %>" alt="IMG DESC">-->
</body>
</html>