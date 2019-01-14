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
<style>
.card-text{
    font-size:19px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}</style>
<meta charset="ISO-8859-1">
<title>Projektübersicht</title>
</head>
<body>
<div class="container text-center">
<div class="row">
<% 
	
	List<Project> projectlist = Project.getAll(2);
	
	int z = 1;
	
	for (Project p : projectlist){
	
		%>



<div class="col-sm-3">
<div class="card" style=" width:250px; margin:30px">
  <img class="card-img-top" src="DisplayImageServlet?id=<%out.print(p.getId()); %>" alt="Card image">
  <div class="card-body">
    <h6 class="card-title"><%out.print(p.getTitle()); %></h6>
    <p class="card-text">Kategorie: <%out.print(p.getCategory()); %></p>
    <p class="card-text"></p>
    <a href="#" class="btn btn-primary">Projekt einsehen</a>
  </div>
</div>
</div>


<% 
z= z+1;
	}
	%>
	</div>
	</div>
</body>
</html>