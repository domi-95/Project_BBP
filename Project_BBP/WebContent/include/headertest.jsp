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
 <!-- Bootstrap style -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- Animations style -->
<link rel="stylesheet" type="text/css" href="style/animate.css" media="screen" />
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstr	apcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
<!-- Custom style -->
<link rel="stylesheet" type="text/css" href="style/cstyle.css" media="screen" />



<%@page import="user.*"%>

</head>
<body>
<div class="navbd sticky-top">
<nav class="navbar navbar-expand-lg navbar-dark navdesign opindex" >
  <a class="navbar-brand active col-sm-4" href="index.jsp">
  <span class="navbar-light-span">&nbsp;Bürgerbeteiligungsportal</span></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
<%if(u == null || u.getRole().getId() == 1 ){
	%>

  
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="projectform.jsp">Projekte vorschlagen</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="projectoverview.jsp">Projekte unterstützen</a>
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
      <li class="nav-item">
        <a class="nav-link" href="projectapprove.jsp">Projekte freigeben</a>
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
      <li class="nav-item">
        <a class="nav-link" href="#">Projekte einsehen</a>
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
	          <a class="dropdown-item" href="#">My account</a>
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