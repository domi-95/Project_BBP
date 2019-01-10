<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="project.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Index BBP</title>
</head>
<body class="bg">
<style>

</style>

<jsp:include page="/include/header.jsp"></jsp:include>
<div class="spaceholder d-flex justify-content-center">

<jsp:include page="/include/carousel.jsp"></jsp:include></div><br>

<div class="container text-center">    
  <h3>Projektübersicht</h3><br>
  <div class="row">
   <% 
	int state = 2;
	int rand = 0;
	int randN = 1;
	int min = 0;
	int max = 1;
	List<Project> projectlist = Project.getAll(state);
	max = projectlist.size();
	int z = 1;
	if(projectlist.size() >=3){
	for (int i = 0; i<3; i++){

		Random r = new Random();
		while(rand == randN){
		randN = r.nextInt((max - min)) + min;
		}
		rand = randN;
		Project p = projectlist.get(rand);
    
	%>

	<div class="col-sm-3 p-0 m-auto bordershadow">
		<div  style="height: 260px;">
      	<img src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" class="img-fluid" style="width:auto" alt="Image">
      </div>
      <div>
      <h8><%out.print(p.getTitle()); %></h8>
      
      
      </div>
    </div>

	

	<% 
	}
	}
	%>
   
    </div>
  </div>
</div><br>






<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>