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

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstr	apcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- Custom style -->
<link rel="stylesheet" type="text/css" href="style/cstyle.css" media="screen" />
<%@page import="user.*"%>
<title>Navigationbar</title>

</head>
<body>
<div>
<nav class="navbar navbar-dark bg-dark">
  <!-- Navbar content -->
<a class="navbar-brand active col-sm-1" href="https://www.mosbach.de"><img alt="Website Stadt Mosbach" src="Images/LogoMosbach_ohne_Text.png" height="30">
<span class="navbar-dark-span" height="30">&nbsp;Mosbach Große Kreisstadt Neckar-Odenwald </span></a>
</nav>
</div>
<div class="navbd sticky-top">
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #fff;">
  <a class="navbar-brand active col-sm-4" href="index.jsp"><img alt="Startseite" src="Images/logoMos.png" height="50">
  <span class="navbar-light-span">&nbsp;Bürgerbeteiligungsportal</span></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
<%if(u == null || u.getRole().getId() == 1 ){
	%>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="projectform.jsp">Projekte vorschlagen</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Projekte unterstützen</a>
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

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
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
      
    </ul>
  <%}%>  
<%if(u != null && u.getRole().getId() == 3){
	%>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
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
      <a class="btn btn-info my-2 my-sm-0 col-sm-2" href="login.jsp">Anmeldung</a>
      
      <%

      }
    else{
      %>
      <a class="btn btn-info my-2 my-sm-0 col-sm-2" href="logout.jsp">Logout</a>
    <%
  	 }
    ///*
    %>
  </div>
  
</nav>
</div>
</body>
</html>