<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 1){
	response.sendRedirect("login.jsp?prevUrl=projectapprove.jsp");
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
<head>
<meta charset="ISO-8859-1">
<title>Meine �bersicht</title>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<br>
<form name="selectState" method="post" action="projectapprove.jsp">
<div class="btn-group btn-group-toggle d-flex justify-content-center" data-toggle="buttons">

  <label class="btn btn-secondary col-md-1 active" id="label1">
    <input type="radio" name="stateSelect" id="stateSelect" value="1" > Meine Projekte
  </label>
  <label class="btn btn-secondary col-md-1" id="label2">
    <input type="radio" name="stateSelect" id="stateSelect" value="2"> Meine Votes
  </label>
</div>
</form>
<br>
<% 
String invest = "question.png";
String period = "question.png";
	
	List<Project> projectlist = Project.getApprovedAdministrationProjects();
	
	int z = 1;
	Map<Integer, Integer> alreadyVote = null;
	if (u != null){
	alreadyVote = Vote.getUserVotes(u.getId());
	}
%>

<% 
	for (Project p : projectlist){
	
		%>
<div class="card mx-auto listbordershadow" style="width: 80%;">
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
	if(p.getInvestment_grade().equals("nicht absch�tzbar")){
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
	if(p.getPeriod().equals("Dauerhafte Ma�nahme")){
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

if (alreadyVote != null && alreadyVote.get(p.getId()) == null){
    	%>	 
      <a href="#" class="btn btn-success" style=" margin: 5px" onClick="doPVote(<%out.print(p.getId());%>);">Unterst�tzen</a>  	
    	<%  
      }else{
    	%>
      <a href="#" class="btn btn-success disabled" style=" margin: 5px">Bereits Abgestimmt!</a> 
      <%
      }
    %>
      <a href="#" class="btn btn-success disabled" style=" margin: 5px"><%out.print (p.getVote()); %> Unterst�tzungen</a>
      </div>
      <br>
      <%
      }%>

	<br>
</body>
</html>