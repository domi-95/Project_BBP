<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@page import="user.*"%>
<%@page import="project.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>

	<!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<%int state = 1;
if(request.getParameter("stateSelect") != null){
	state = Integer.parseInt(request.getParameter("stateSelect"));
	out.print(state);
	}%>
</br>
<form method="post" action="dashboard.jsp">
<select id="stateSelect" name="stateSelect" onchange="submit()">
	<!-- <option value="1" <%if(state == 0){out.print(" selected");} %>>Bitte wähle einen Status</option>-->
	<option value="1" <%if(state == 1){out.print(" selected");} %>>Angelegt</option>
	<option value="2" <%if(state == 2){out.print(" selected");} %>>Freigegeben</option>
	<option value="3" <%if(state == 3){out.print(" selected");} %>>Abgeschlossen</option>
</select>
</form>

<% 
	if(request.getParameter("stateSelect") != null){
	state = Integer.parseInt(request.getParameter("stateSelect"));
	out.print(state);
	}
	List<Project> projectlist = Project.getAll(state);
	
		

	//out.print (projectlist);
	for (Project p : projectlist){
	//Project project = ProjectDao.searchProject(3);
	// byte[] picture= project.getPicture();
	//ut.print (project.getPicture());
	//request.getSession();
	//session.setAttribute("picture", p.getPicture());
	
	//RequestDispatcher rd = request.getRequestDispatcher("/DisplayImageServlet2");
    //request.setAttribute("picture",p.getPicture());
    //rd.forward(request, response);
    
	%>

	<div class="table-responsive-md">
	<table class="table">
		<thead>
			<tr>
			<form method="post" action="ApproveProject">
				  <img src="DisplayImageServlet?id=<%out.print(p.getId()); %>" height="200px"/>
				
				<h2><%out.print(p.getTitle()); %></h2>
				<p>Kategorie: <%out.print(p.getCategory()); %></p>
				<p>Investitionsgrad: <%out.print(p.getInvestment_grade()); %></p>
				<p>Zeitspanne: <%out.print(p.getPeriod()); %></p>
				<p>Telefonnummer: <%out.print(p.getPhone_numer()); %></p>
				<p>Ort: <%out.print(p.getLocation()); %></p>
				<p>Kurzbeschreibung: <%out.print(p.getShort_description()); %></p>
				<p>Beschreibung: <%out.print(p.getDescription()); %></p>
	<% if(state==1){ %>
				<input type="hidden" name="id" value="<%out.print(p.getId());%>">
				<button class="btn btn-lg btn-primary btn-block" type="submit" value="approve" name="acceptreject">Genehmigen</button>
				<button class="btn btn-lg btn-secondary btn-block" type="submit" value="reject" name="acceptreject">Ablehnen</button>
		<%} %>	
			</form>	
			<!-- <h3> Nachricht: ${message}</h3> -->

			</tr>
		</thead>
	</table>
	</div>
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
	
</body>
</html>