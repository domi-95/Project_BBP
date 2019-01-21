<%
User u = (User)session.getAttribute("user"); 
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="project.*"%>
<%@page import="user.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Index BBP</title>
<style>
.img-fluid {
object-fit: cover !important;
width: 100% !important;
  height: 100% !important;
}

.imgCon{
width: 100% !important;
height: 85% !important;
}
.card-body{
padding: 0.8rem;

}
</style>
</head>
<body class="lingradbg bg">


<jsp:include page="/include/header.jsp"></jsp:include>

<div class="spaceholder d-flex justify-content-center">

<jsp:include page="/include/carousel.jsp"></jsp:include>

</div><br>
<div class="spaceholder d-flex justify-content-center">
<jsp:include page="/include/collapse.jsp"></jsp:include>
<br>
</div>

<div class="container text-center formular-bd opindex "> 
 

  <h3>Projektübersicht</h3><br>
  <div class="row">
   <% 
	int rand = 0;
	int randN = 1;
	int min = 0;
	int max = 1;
	List<Project> projectlist = Project.getApprovedAdministrationProjects();
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

	<div class="col-sm-3 p-0 m-auto bordershadow" style="height: 350px;">
		<div class="imgCon d-inline-block" >
      	<a href="projectdetailview.jsp?projectid=<% out.print(p.getId()); %>"><img src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" class="img-fluid" alt="Image"></a>
      </div>
      <div class="card-body p-2" >
      <p style="color: white;"><%out.print(p.getTitle()); %></p>

      
      </div>
    </div>

	<br>

	<% 
	}
	}
	%>
   
    </div>
   
  </div> 
<br>

<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>