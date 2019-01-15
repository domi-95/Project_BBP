<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 1){
	response.sendRedirect("login.jsp?prevUrl=projectoverview.jsp");
}
%>

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

<jsp:include page="/include/header.jsp"></jsp:include><br>
<head>
<title>Projektübersicht</title>
<style>

.card-text{
    font-size:19px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
.card {
    min-height: 450px;
}
.card-img-top {
    width: 100%;
    height: 15vw;
    object-fit: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Projektübersicht</title>
</head>
<body>
<div class="container text-center">
<div class="row">
<% 
	
	List<Project> projectlist = Project.getAll(2);
	
	int z = 1;
	Map<Integer, Integer> alreadyVote = Vote.getUserVotes(u.getId());
	
	for (Project p : projectlist){
	
		%>



<div class="col-sm-4">
<div class="card" style=" width:367px; margin:1% 0 1% 1.6%">
  <img class="card-img-top" src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" class="img-fluid" alt="Card image">
  <div class="card-body">
    <h6 class="card-title"><%out.print(p.getTitle()); %></h6>
    <p class="card-text">Kategorie: <%out.print(p.getCategory()); %></p>
    <p class="card-text"></p>
  </div>
  <div class="card-footer">
  
      <a href="http://localhost:8080/Project_BBP/projectdetailview.jsp?projectid=<% out.print(p.getId()); %>" class="btn btn-primary">Projekt einsehen</a>
      <% 
      if (alreadyVote.get(p.getId()) == null){
    	%> 
      <a href="#" class="btn btn-success">Voten</a>    	
    	<%  
      } else {
    	%>
      <a href="#" class="btn btn-success disabled">Bereits Abgestimmt!</a>    
      <%
      }
    %>
      <a href="#" class="btn btn-success disabled" >Stimmen: <%out.print (p.getVote()); %></a>    
  </div>
</div>
</div>


<% }%>
	</div>
	</div>
</body>
</html>