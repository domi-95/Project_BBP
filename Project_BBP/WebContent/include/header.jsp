<%
User u = null;
if((User)session.getAttribute("user") != null){
	u = (User)session.getAttribute("user"); 
}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <!-- Bootstrap style -->
<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css">
<!-- Custom style -->
<link rel="stylesheet" type="text/css" href="style/cstyle.css" media="screen" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


<%@page import="user.*"%>
</head>
<body>
<div class="navbd sticky-top navdesign">
<nav class="navbar navbar-expand-lg navbar-dark m-auto w-75 px-0">
  <a class="navbar-brand" href="index.jsp">Bürgerbeteiligungsportal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <%if(u == null || u.getRole().getId() == 1 ){
	%>
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="projectform.jsp">Projekt vorschlagen <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="projectoverview.jsp">Projekt unterstützen</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="opoverview.jsp">Abstimmungen</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="blog.jsp">Blog</a>
      </li>
    </ul>
    <%}%>  
<%if( u != null && u.getRole().getId() == 2){
	%>
	<ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="projectapprove.jsp">Projekte freigeben <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Auswertung erstellen</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Blogeintrag erstellen</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="blog.jsp">Blog</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="register.jsp">Registrieren</a>
      </li>
    </ul>
    <%}%>  
<%if(u != null && u.getRole().getId() == 3){
	%>
	<ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Projekte einsehen <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="opform.jsp">Abstimmung anlegen</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="opanalysis.jsp">Abstimmungen einsehen</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="blog.jsp">Blog</a>
      </li>
    </ul>
    <%}%>
    <%
	
    if (u == null){
    	
    %>
      <a class="btn btn-outline-light my-2 my-sm-0 col-sm-2" href="login.jsp">Anmeldung</a>
      
      <%

      }
    else{
      %>
      
       <div class="btn-group">
	        <a class="btn btn-outline-light my-2 my-sm-0 dropdown-toggle" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true"
	          aria-expanded="false">
	          <i class="fa fa-user"></i> <%out.print(u.getFirstname()); %> &nbsp;<%out.print(u.getname()); %> </a>
	        <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
	          <a class="dropdown-item" href="myoverview.jsp">Meine Übersicht</a>
	          <a class="dropdown-item" href="logout.jsp">Abmelden</a>
	        </div>
	    </div>
    <%
  	 }
    ///*
    %>
  </div>


</nav>
</div>
</body>
</html>