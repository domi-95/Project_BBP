<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 2){
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

	
	<!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="style/animate.css" media="screen" />
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="script/cscript.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>

<style>
#snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  bottom: 30px;
  font-size: 17px;
}
#msgBox {
  visibility: visible;
  border: solid 1px black;
  background-color: #333;
  color: #fff;
  font-size: 17px;
  text-align: center;
  padding: 16px;
    position: fixed;
    left: 50%;
    top: 50%;
    z-index: 300;

    height: 400px;
    margin-top: -200px;

    width: 600px;
    margin-left: -300px;
}

#overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  visibility: visible;
  opacity: 1;
  z-index: 200;
}
#overlay:target {
  visibility: visible;
  opacity: 1;
}

#background{
position:absolute;
    z-index:0;
    background:white;
    display:block;
    min-height:50%; 
    min-width:50%;
    color:yellow;
}
#forground{
position:absolute;
z-index: 1;
}
#bg-text
{
    color:lightgrey;
    font-size:60px;
    transform:rotate(300deg);
    -webkit-transform:rotate(300deg);
}
</style>

<script>

$(document).ready(function() { 
	  $('input[name=stateSelect]').change(function(){
	       $('form[name=selectState]').submit();
	  });
	 });

function changeActive(){
	$(document).ready(function changeActive1(){
		changeActive1();
		
		});
}
</script>



<%
int state;
if(request.getParameter("stateSelect") != null){
	state = Integer.parseInt(request.getParameter("stateSelect"));%>
	<input type="hidden" id="state" value="<%out.print(state); %>">
	<script>
	
	changeActive();
	</script>
	<%
	}
	else{
	state = 1;
	}%>
</br>

<div id="successMsg"></div>
<div id="rejectBox"></div>

<form name="selectState" method="post" action="projectapprove.jsp">
<div class="btn-group-toggle text-center" data-toggle="buttons">
  <label class="btn btn-secondary col-md-2 active" id="label1">
    <input type="radio" name="stateSelect" id="stateSelect" value="1"  <%if(state == 1){out.print(" checked");} %>> Angelegt
  </label>
  <label class="btn btn-secondary col-md-2" id="label2">
    <input type="radio" name="stateSelect" id="stateSelect" value="2" <%if(state == 2){out.print(" checked");} %>> Freigegeben Verwaltung
  </label>
  <label class="btn btn-secondary col-md-2" id="label6">
    <input type="radio" name="stateSelect" id="stateSelect" value="6" <%if(state == 6){out.print(" checked");} %>> Freigegeben Gemeinderat
  </label>

</div>
</form>
<br>
<script>
$(document).ready(function changeActive1(){
	var id = document.getElementsByName('stateSelect');

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

function changeValue(id){
	var element = document.getElementById('collapseButton'+id);
    element.value = (element.value == 'Mehr anzeigen' ? 'Weniger anzeigen' : 'Mehr anzeigen');
}
</script>


<% 
	if(request.getParameter("stateSelect") != null){
	state = Integer.parseInt(request.getParameter("stateSelect"));
	}
	List<Project> projectlist = null;
	switch(state){
	case 1:{
		projectlist = Project.getCreatedProjects();
		break;
	}
	case 2: {
		projectlist = Project.getApprovedAdministrationProjects();
		break;
	}
	case 6: {
		projectlist = Project.getApprovedCouncilProjects();
		break;
	}
	}
	String invest = "question.png";
	String period = "question.png";
	for (Project p : projectlist){
	%>
	<div class="container p-3" id="dynamic_divs<%out.print(p.getId());%>">
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

<div id="details<%out.print(p.getId());%>" class="collapse">
<div class="row m-2">
  <div class="col-xs-12 col-xl-3 border-bottom">
    <p class="font-weight-bold">Beschreibung:</p>
  </div>
  <div class="col-xl-9 border-bottom">
    <%out.print(p.getDescription()); %>
    <br>
  </div>
</div>
<div class="row m-2">
  <div class="col-xs-12 col-xl-3 border-bottom">
    <p class="font-weight-bold">Ersteller:</p>
  </div>
  <div class="col-xl-3 border-bottom">
   <%out.print(p.getUser().getFirstname()); %> <%out.print(p.getUser().getname()); %>
  </div>

  <div class="col-xs-12 col-xl-3 border-bottom">
    <p class="font-weight-bold">Telefonnummer:</p>
  </div>
  <div class="col-xl-3 border-bottom">
  <a href="callto:<%out.print(p.getPhone_numer()); %>"><%out.print(p.getPhone_numer()); %></a>  
  </div>
</div>

<div class="row m-2">
  <div class="col-xs-12 col-xl-3 border-bottom">
    <p class="font-weight-bold">E-Mailadresse:</p>
  </div>
  <div class="col-xl-9 border-bottom">
   <a href="mailto:<%out.print(p.getUser().getEmail()); %>"><%out.print(p.getUser().getEmail()); %></a>
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

<% if(state==1){ %>
<div class="row collapse m-2" id="details<%out.print(p.getId());%>" >
  <div class="col-xs-12 col-xl-6">
    <input class="btn btn-lg btn-primary btn-block" type="button" value="Genehmigen" onClick="doApprove(<%out.print(p.getId());%>);">
  </div>
  <div class="col-xl-6">
    <input class="btn btn-lg btn-secondary btn-block" type="button" value="Ablehnen" onClick="rejectBox(<%out.print(p.getId());%>);">
  </div>
</div>
<%} %> 
</div>

<div class="row m-2">
  <div class="col-xl-12 text-center">
    <input type="button" class="btn btn-lg btn-info btn-block" data-toggle="collapse" data-target="#details<%out.print(p.getId());%>" aria-expanded="false" aria-controls="collapseExample" value="Mehr anzeigen" id="collapseButton<%out.print(p.getId());%>" onClick="changeValue(<%out.print(p.getId());%>);">
  </div>
</div>
</div>
		
		 
			
			<!-- <h3> Nachricht: ${message}</h3> -->

			
	</div><br>
	<%
	}

	%>
</body>
</html>