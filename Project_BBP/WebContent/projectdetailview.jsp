<%
User u = (User)session.getAttribute("user"); 
if (u == null){
	
	if(null != request.getParameter("projectid")){
		response.sendRedirect("login.jsp?prevUrl=projectdetailview.jsp?projectid="+request.getParameter("projectid"));
	}
	else{
	response.sendRedirect("login.jsp?prevUrl=projectdetailview.jsp");
	}
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@page import="user.*"%>
<%@page import="project.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>

	
	<!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="style/animate.css" media="screen" />
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="script/cscript.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>Detailansicht Projekt</title>
</head>
<body class="bg">
<jsp:include page="/include/header.jsp"></jsp:include>

<% 
	String invest = "question.png";
	String period = "question.png";
	int z = 1;	

	Project p = Project.getProject(Integer.parseInt(request.getParameter("projectid")));
	Map<Integer, Integer> alreadyVote = null;
	if (u != null){
	alreadyVote = Vote.getUserVotesHash(u.getId());
	}
    
	%>
	<div class="container px-0 pt-3 w-75"  id="voteReload">
	<div class="card mx-auto listbordershadow border-0">
	
	<div class="row m-0 text-white bg-dark" style="height: 10%;">
  <div class="col-xs-4 col-xl-6 ml-2">
   <span class="d-inline-block"> Aktiv seit: <%out.print(p.getStamp_updated()); %></span>

  </div>
  <div class="col-xs-4 col-xl-6 mr-2">
  <%if(p.getStamp_expiryDate().compareTo("") != 0){ %>
    <span class="float-right">Ablaufdatum: <%if(p.getStamp_expiryDate() != null){ out.print(p.getStamp_expiryDate());} %></span>
<%} %>
  </div>
</div>
		
<div class="row m-2">
  <div class="col-xl-12 border-bottom" >
     <h4><%out.print(p.getTitle()); %></h4>
  </div>
</div>
<div class="row m-2">
  <div class="col-xs-4 col-xl-3 border-bottom">
   <p class="font-weight-bold"> Kategorie: </p>
    
  </div>
  <div class="col-xs-4 col-xl-9 border-bottom">
    <%out.print(p.getCategory()); %>

  </div>
</div>
<div class="row m-2">
  <div class="col-xl-3 border-bottom">
    <p class="font-weight-bold">Kurzbeschreibung:</p>
  </div>
  <div class="col-xl-9 border-bottom">
    <%out.print(p.getShort_description()); %>
  </div>
</div>


<div class="row m-2">
  <div class="col-xs-12 col-xl-3 border-bottom">
    <p class="font-weight-bold">Beschreibung:</p>
  </div>
  <div class="col-xl-9 border-bottom">
    <%out.print(p.getDescription()); %>
  </div>
</div>
<div class="row m-2">
  <div class="col-xs-12 col-xl-3 border-bottom">
    <p class="font-weight-bold">Ersteller:</p>
  </div>
  <div class="col-xl-9 border-bottom">
  <%if(p.isAnonymous()){ %>
  	Anonym
  	<%}else{ %>
    <%out.print(p.getUser().getFirstname()); %> <%out.print(p.getUser().getname()); %>
    <%} %>
  </div>
</div>
<div class="row m-2">
  <div class="col-xs-12 col-xl-3 border-bottom">
    <p class="font-weight-bold">Kommentar:</p>
  </div>
  <div class="col-xl-9 border-bottom">
    <%out.print(p.getComment()); %>
  </div>
</div>

<div class="row m-2">
<%	
	if(p.getInvestment_grade().equals("Gering")){
		invest = "euro_less.png";	
	}
	if(p.getInvestment_grade().equals("Mittel")){
		invest = "euro_medium.png";	
	}
	if(p.getInvestment_grade().equals("Hoch")){
		invest = "euro_much.png";	
	}	
	if(p.getInvestment_grade().equals("nicht abschätzbar")){
		invest = "question.png";	
	}	
	%>
<div class="col-xs-12 col-xl-3 border border-top-0" style="background:transparent url('Images/<%out.print(invest); %>') no-repeat center center /cover; min-height: 310px;">
<div class="row" >
<div class="col-xl-12 d-flex justify-content-center">
<p class="font-weight-bold">Investitionsgrad</p>
</div>
</div>
<div class="row" >
<div class="col-xl-12 d-flex justify-content-center">
<%out.print(p.getInvestment_grade()); %>
</div>
</div>

</div>
<%	
	if(p.getPeriod().equals("Kurz")){
		period = "time_less.png";	
	}
	if(p.getPeriod().equals("Mittel")){
		period = "time_medium.png";	
	}
	if(p.getPeriod().equals("Lang")){
		period = "time_much.png";	
	}	
	if(p.getPeriod().equals("Dauerhafte Maßnahme")){
		period = "time_infinity.png";	
	}	
	%>
<div class="col-xl-3 border border-top-0" style="background:transparent url('Images/<%out.print(period); %>') no-repeat center center /cover; min-height: 310px;">
<div class="row">
<div class="col-xl-12 d-flex justify-content-center">
<p class="font-weight-bold">Zeitspanne</p>
</div>
</div>
<div class="row">
<div class="col-xl-12 d-flex justify-content-center">
<%out.print(p.getPeriod());%>
</div>
</div>
</div>
<div class="col-xl-3 border border-top-0" style="background:transparent url('Images/map.png') no-repeat center center /cover; min-height: 310px;">
<div class="row">
<div class="col-xl-12 d-flex justify-content-center">
<p class="font-weight-bold">Ort</p>
</div>
</div>
<div class="row">
<div class="col-xl-12 d-flex justify-content-center">
 <%out.print(p.getLocation()); %>

 </div>
</div>
</div>
<div class="col-xl-3 border border-top-0 text-center imgCon d-inline-block">
	<img src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" class="img-fluid mx-auto d-block" alt="Image"/>
</div>
</div>
<input type="hidden" class="user" name="user" value= "<%if (u != null)out.print(u.getId()); %>" />

<% 
if(u != null && u.getRole().getId() == 1){
	if (alreadyVote != null && alreadyVote.get(p.getId()) == null){
	    	%>	 
	      <a href="#" class="btn btn-success" style=" margin: 5px" onClick="doPVote(<%out.print(p.getId());%>);">Unterstützen</a>  	
	    	<%  
	      }else{
	    	%>
	      <a href="#" class="btn btn-success disabled" style=" margin: 5px">Bereits Unterstützt!</a> 
	      <%
	      }
}
    %>
      <a href="#" class="btn btn-secondary disabled" style=" margin: 5px">Unterstützungen: <%out.print (p.getVote()); %></a>
</div>

	</div><br>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>