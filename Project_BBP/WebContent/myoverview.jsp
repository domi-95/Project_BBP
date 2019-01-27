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
<%@page import="java.util.*"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>

<head>
<meta charset="ISO-8859-1">
<title>Meine Übersicht</title>
<style>

.card-text{
	d-flex;
	flex-column;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body class="bg">

<script>
$(document).ready(function() { 
	  $('input[name=z]').change(function(){
	       $('form[name=selectState]').submit();
	  });
	 });
	 
function changeActive(){
	$(document).ready(function changeActive1(){
		changeActive1();
		
		});
}
</script>
<jsp:include page="/include/header.jsp"></jsp:include>
<br>
<%
int state;
if(request.getParameter("z") != null){
	state = Integer.parseInt(request.getParameter("z"));%>
	<input type="hidden" id="state" value="<%out.print(state); %>">
	<script>
	
	changeActive();
	</script>
	<%
	}
	else{
	state = 1;
	}%>
<form name="selectState" method="post" action="myoverview.jsp">
<div class="btn-group btn-group-toggle d-flex justify-content-center" data-toggle="buttons">

  <label class="btn btn-secondary col-md-2 active" id="label1">
    <input type="radio" name="z" id="z" value="1" <%if(state == 1){out.print(" checked");} %>> Meine Projekte
  </label>
  <label class="btn btn-secondary col-md-2" id="label2">
    <input type="radio" name="z" id="z" value="2" <%if(state == 2){out.print(" checked");} %>> Meine Unterstützungen
  </label>
</div>
</form>
<br>

<script>
$(document).ready(function changeActive1(){
	var id = document.getElementsByName('z');

	for (var i = 0, length = id.length; i < length; i++) {
	    if (id[i].checked) {
	        id = id[i].value;
	        break;
	    }
	}

	var element = "label"+id;		
	var element1 = "label1";
	$(function(){
		$('#'+element1).removeClass('active');	
		$('#'+element).addClass('active');
	});
});

</script>

<% 
String invest = "question.png";
String period = "question.png";
List<Project> projectlist = null;
state=1;
if(request.getParameter("z") == null){
	state = 1;
}
else{
state = Integer.parseInt(request.getParameter("z"));
}
	switch(state){
	case 1:{
		if (u != null){
			projectlist = Project.getAllWithCreator(u.getId());	 //use this method to get all projects by creator
			//projectlist = Vote.getUserVotesList(u.getId());		// use this method to get all projects where the user has already voted
			}													 
			
			
			
			Map<Integer, Integer> alreadyVote = null;
			if (u != null){
			alreadyVote = Vote.getUserVotesHash(u.getId());
			}
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

if (alreadyVote != null && alreadyVote.get(p.getId()) == null){
    	%>	 
      <a href="#" class="btn btn-success" style=" margin: 5px" onClick="doPVote(<%out.print(p.getId());%>);">Unterstützen</a>  	
    	<%  
      }else{
    	%>
      <a href="#" class="btn btn-success disabled" style=" margin: 5px">Abgestimmt!</a> 
      <%
      }
    %>
      <a href="#" class="btn btn-success disabled" style=" margin: 5px"><%out.print (p.getVote()); %> Unterstützungen</a>
      </div>
      <br>
      <%
      }%>

	<br>
	 <%
	 break; }
	case 2:{%>
<div id="snackbar_message"></div>
<div class="container text-center" id="voteReload">
<div class="row">
<%
		if(u != null){
			projectlist = Vote.getUserVotesList(u.getId());
		}
		Map<Integer, Integer> alreadyVote = null;
		if (u != null){
		alreadyVote = Vote.getUserVotesHash(u.getId());
		}
		for (Project p : projectlist){
		
			%>

<div class="col-md-4" style="margin:0 0 1% 0;">
<div class="card">
  <a href="projectdetailview.jsp?projectid=<% out.print(p.getId()); %>"><img class="card-img-top" src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" class="img-fluid" alt="Card image"></a>
  <div class="card-body opindext ">
    <h5 class="card-title text-truncate"><%out.print(p.getTitle()); %></h5>

    <h5 class="card-text align-self-end"><small><b>Kategorie: </b><%out.print(p.getCategory()); %></small></h5>

  </div>
  <div class="card-footer opindex">
  
  <div class="row p-1">
  <div class="col-xs-12 col-lg-6">
      <a href="projectdetailview.jsp?projectid=<% out.print(p.getId()); %>" class="btn btn-outline-success btn-block">Projekt einsehen</a>
    
  </div>
  <div class="col-lg-6">
  <input type="hidden" class="user" name="user" value= "<%if (u != null)out.print(u.getId()); %>" />
      <% 
      if (alreadyVote != null && alreadyVote.get(p.getId()) == null){
    	%> 
    	<input class="btn btn-success btn-block" value="Vote" onClick="doPVote(<%out.print(p.getId());%>);">
        	
    	<%  
      }else {
    	%>
      <a href="#" class="btn btn-success btn-block disabled">Abgestimmt!</a>    
      <%
      }
    %>
    
  </div>
</div>
<div class="row p-1">
  <div class="col d-flex justify-content-center" >
      <a href="#" class="btn btn-success btn-block disabled" id="votes<%out.print(p.getId());%>">Stimmen: <%out.print (p.getVote()); %></a>    
    
  </div>
</div>
  
  
  
  </div>
</div>
</div>
<% } %>
</div>
</div>
<%
		
	break;}
	}
	
	%>

<br>
<br>
<jsp:include page="/include/footer.jsp"></jsp:include>	
</body>
</html>