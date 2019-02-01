<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() == 1 ){
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

	
	<!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="style/animate.css" media="screen" />
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="script/cscript.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>Projekte freigeben</title>
</head>
<body class="lingradbg bg">
<jsp:include page="/include/header.jsp"></jsp:include>
<div class="content">

<script>

$(document).ready(function() { 
	  $('input[name=stateSelect]').change(function(){
	       $('form[name=selectState]').submit();
	  });
	 });


</script>



<%
int state;
String category = null;
if(request.getParameter("category")!=null){
	category = request.getParameter("category");
}
if(request.getParameter("stateSelect") != null){
	state = Integer.parseInt(request.getParameter("stateSelect"));%>
	<input type="hidden" id="state" value="<%out.print(state); %>">

	<%
	}
	else{
		if(u != null && u.getRole().getId()  == 2){
			state = 1;
		}
		else{
			state = 2;
		}
	}%>
</br>

<div id="successMsg"></div>
<div id="commentBox"></div>
<%if(u != null && u.getRole().getId() == 2){ %>
<form name="selectState" method="post" action="#" onsubmit="reloadDiv();">
<div class="btn-group-toggle text-center" data-toggle="buttons">
  <label class="btn btn-secondary col-md-2 active" id="label1">
    <input type="radio" name="stateSelect" id="stateSelect" value="1"  <%if(state == 1){out.print(" checked");} %>> Angelegt B�rger
  </label>
 
  <label class="btn btn-secondary col-md-2" id="label2">
    <input type="radio" name="stateSelect" id="stateSelect" value="2" <%if(state == 2){out.print(" checked");} %>> Freigegeben Verwaltung
  </label>
  <label class="btn btn-secondary col-md-2" id="label6">
    <input type="radio" name="stateSelect" id="stateSelect" value="6" <%if(state == 6){out.print(" checked");} %>> Freigegeben Gemeinderat
  </label>

</div>
</form>
<%} %>
<%if(u != null && u.getRole().getId() == 3){ %>
<form name="selectState" method="post" action="#" onsubmit="reloadDiv();">
<div class="btn-group-toggle text-center" data-toggle="buttons">
 
  <label class="btn btn-secondary col-md-2" id="label2">
    <input type="radio" name="stateSelect" id="stateSelect" value="2" <%if(state == 2){out.print(" checked");} %>> Freigegeben Verwaltung
  </label>
  <label class="btn btn-secondary col-md-2" id="label6">
    <input type="radio" name="stateSelect" id="stateSelect" value="6" <%if(state == 6){out.print(" checked");} %>> Freigegeben Gemeinderat
  </label>

</div>
</form>
<%} %>
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
	
	%>
	<!-- --------------------------Kevin Filterversuch.-------------------------------------------------------------- -->
	<div class="formular-bd w-75 mx-auto mt-0 mb-3">
	<form id="regForm" action = "#" method = "post" onsubmit="reloadDiv();">
  <div class="form-row align-items-center mx-auto content-center text-center">
     <div class="col-auto" >
      <select id="inputstatus" name="state1" class="form-control" onchange="this.form.submit()">
        <option value="">Status w�hlen</option>
       		<option value="1">Angelegt B�rger</option>
			<option value="2" >Freigegeben Verwaltung</option>
			<option value="3">Abgelehent Verwaltung</option>
			<option value="4">Abgelehnt Gemeinderat</option>
			<option value="5">Freigegeben Gemeinderat</option>
      </select>
      </div>
     <div class="col-auto" >
      <select id="inputCategory" name="category" class="form-control" onchange="this.form.submit()">
        <option value="*" <%if(category != null && category.equals("*")){out.print(" selected");} %>>Kategorie w�hlen...</option>
       		<option value="Wirtschaft und Finanzen" <%if(category != null && category.equals("Wirtschaft und Finanzen")){out.print(" selected");} %>>Wirtschaft und Finanzen</option>
			<option value="Bildung und Kultur" <%if(category != null && category.equals("Bildung und Kultur")){out.print(" selected");} %>>Bildung und Kultur</option>
			<option value="Sicherheit" <%if(category != null && category.equals("Sicherheit")){out.print(" selected");} %>>Sicherheit</option>
			<option value= "Sozial, Jugend und Gesundheit" <%if(category != null && category.equals("Sozial, Jugend und Gesundheit")){out.print(" selected");} %>>Sozial, Jugend und Gesundheit</option>
			<option value="Bau und Infrastruktur" <%if(category != null && category.equals("Bau und Infrastruktur")){out.print(" selected");} %>>Bau und Infrastruktur</option>
			<option value="Events und �ffentlichkeitsarbeit" <%if(category != null && category.equals("Events und �ffentlichkeitsarbeit")){out.print(" selected");} %>>Events und �ffentlichkeitsarbeit</option>
			<option value="Sonstiges" <%if(category != null && category.equals("Sonstiges")){out.print(" selected");} %>>Sonstiges</option>
      </select>
      </div>
      
      
       <div class="col-auto">
      <input type="text" class="form-control" name = "search" id="search" placeholder="Freitext..." maxlength="50" list="laender">
       <datalist id="laender">
       <%
       for (Project p : projectlist){
    	   %><option value=<%out.print(p.getTitle());%>><%
       }
       
       %>
  		</datalist>
  		</input>
    </div>
 
    <div class="col-auto">
      <button type="submit" class="btn btn-secondary mb-2">Filtern</button>
    </div>
  </div>
</form>
</div>
	<!-- --------------------------Kevin Suchversuch.-------------------------------------------------------------- -->

<div id="reloadDiv">
<% 
	category = request.getParameter("category");
	String search = request.getParameter("search");
	projectlist = Project.getAllFiltered(state, category, search);	

	for (Project p : projectlist){
	%>
	<div class="mx-auto w-75" id="dynamic_divs<%out.print(p.getId());%>">
	<div class="card mx-auto listbordershadow border-0" >
	
		
<div class="row m-0 text-white bg-dark" style="height: 10%;">
  <div class="col-xs-4 col-xl-6 ml-2 ">
   <span class="d-inline-block">Angelegt: <% out.print(p.getStamp_created()); %></span>
   <%if(state == 2 || state == 6) {%>
   <span class="d-inline-block"> | Freigegeben: <%out.print(p.getStamp_updated()); %></span>
   <%} %>
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
  <%if(!(p.getPhone_numer().equals(""))){ %>
    <p class="font-weight-bold">Telefonnummer:</p>
    <%} %>
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
<div class="col-xl-3 border border-top-0 text-center imgCon d-inline-block" style="object-fit:cover;">
	<img src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" class="img-fluid mx-auto d-block" alt="Image" />
</div>
</div>

<% if(state==1){ %>
<div class="row collapse m-2" id="details<%out.print(p.getId());%>" >
  <div class="col-xs-12 col-xl-6">
    <input class="btn btn-lg btn-success btn-block" type="button" value="Freigeben" onClick="doApprove(<%out.print(p.getId());%>, <%out.print(u.getRole().getId());%>);">
  </div>
  <div class="col-xl-6">
    <input class="btn btn-lg btn-danger btn-block" type="button" value="Ablehnen" onClick="rejectBox(<%out.print(p.getId());%>, <%out.print(u.getRole().getId());%>);">
  </div>
</div>
<%} %> 
<% if(state==2 && u != null && u.getRole().getId() == 3){ %>
<div class="row collapse m-2" id="details<%out.print(p.getId());%>" >
  <div class="col-xs-12 col-xl-6">
    <input class="btn btn-lg btn-success btn-block" type="button" value="Freigeben" onClick="approveBox(<%out.print(p.getId());%>, <%out.print(u.getRole().getId());%>);">
  </div>
  <div class="col-xl-6">
    <input class="btn btn-lg btn-danger btn-block" type="button" value="Zur�ckweisen" onClick="rejectBox(<%out.print(p.getId());%>, <%out.print(u.getRole().getId());%>);">
  </div>
</div>
<%} %> 
</div>

<div class="row m-2">
  <div class="col-xl-12 text-center">
    <input type="button" class="btn btn-lg  btn-block" data-toggle="collapse" data-target="#details<%out.print(p.getId());%>" aria-expanded="false" aria-controls="collapseExample" value="Mehr anzeigen" id="collapseButton<%out.print(p.getId());%>" onClick="changeValue(<%out.print(p.getId());%>);">
  </div>
</div>
</div>
		
		 
			
			<!-- <h3> Nachricht: ${message}</h3> -->

			
	</div><br>
	<%
	}

	%>
	</div>
	</div>

	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>