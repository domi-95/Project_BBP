<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() == 2 ){
	response.sendRedirect("login.jsp?prevUrl=myoverview.jsp");
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
<%@page import="opinionPoll.*"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>

<head>
<meta charset="ISO-8859-1">
<title>Meine Übersicht</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body class="bg">

<!-- Script adds the active function (dark highlighting) of the selectet state -->
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

<div class="content">
<br>
<%
//checks if a user is loged in and if he is an citizen
if(u != null && u.getRole().getId() == 1){
int state;
// gets varlue of the state selection
if(request.getParameter("z") != null){
	state = Integer.parseInt(request.getParameter("z"));%>
	<!-- creates an hidden field with the state variable -->
	<input type="hidden" id="state" value="<%out.print(state); %>">
	<!-- calls the function to set the state selection bar highlighting on the selected state -->
	<script>
	
	changeActive();
	</script>
	<%
	}
	else{
	state = 1;
	}%>
	
	<!-- state selection -->
<form name="selectState" method="post" action="myoverview.jsp">
<div class="btn-group btn-group-toggle d-flex justify-content-center" data-toggle="buttons">

  <label class="btn btn-secondary col-md-2 active" id="label1">
    <input type="radio" name="z" id="z" value="1" <%if(state == 1){out.print(" checked");} %>> Meine Projekte
  </label>
  <label class="btn btn-secondary col-md-2" id="label2">
    <input type="radio" name="z" id="z" value="2" <%if(state == 2){out.print(" checked");} %>> Meine Unterstützungen
  </label>
  <label class="btn btn-secondary col-md-2" id="label3">
  <input type="radio" name="z" id="z" value="3" <%if(state == 3){out.print(" checked");} %>> Meine Abstimmungen
  </label>
</div>
</form>
<!-- end state selection -->
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
// sets an default image for invest and period
String invest = "question.png";
String period = "question.png";
// creates new List of type Project
List<Project> projectlist = null;
state=1;
// sets state to 1 when no state is selected
if(request.getParameter("z") == null){
	state = 1;
}
else{
	// sets state on selected state
state = Integer.parseInt(request.getParameter("z"));
}
	switch(state){
	case 1:{
		if (u != null){
			// puts all projects which are created by a user in a list
			projectlist = Project.getAllWithCreator(u.getId());	 //use this method to get all projects by creator
			
			}													 
			
			
			
			Map<Integer, Integer> alreadyVote = null;
			if (u != null){
				//gets all ids of projects which are already votesd by the user
			alreadyVote = Vote.getUserVotesHash(u.getId());
			}
			// loops ofer all projects and displays them
			for (Project p : projectlist){
				%>
<div class="card card-myoverview mx-auto listbordershadow" style="width: 80%;">
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
// checks if the user has already voted for the project
if (alreadyVote != null && alreadyVote.get(p.getId()) == null){
    	%>	 
      <a href="#" class="btn btn-success" style=" margin: 5px" onClick="doPVote(<%out.print(p.getId());%>);">Unterstützen</a>  	
    	<%  
      }else{
    	%>
      <a href="#" class="btn btn-success disabled" style=" margin: 5px">Unterstützt</a> 
      <%
      }
    %>
      <a href="#" class="btn btn-success disabled" style=" margin: 5px">Unterstützungen: <%out.print (p.getVote()); %></a>
      </div>
      <br>
      <%
      }%>

	<br>
	 <%
	 break; }
	case 2:{%>
	<div class="formular-bd w-75 m-auto opindex">
<div id="snackbar_message"></div>
<div class="container text-center" id="voteReload">
<div class="row">
<%
		if(u != null){
			// gets a list of all projects the user already voted for
			projectlist = Vote.getUserVotesList(u.getId());
		}
		Map<Integer, Integer> alreadyVote = null;
		if (u != null){
		alreadyVote = Vote.getUserVotesHash(u.getId());
		}
		//loops over all projects the user already voted for
		for (Project p : projectlist){
		
			%>

<div class="col-md-4" style="margin:0 0 1% 0;">
<div class="card card-myoverview boder border-success">
  <a href="projectdetailview.jsp?projectid=<% out.print(p.getId()); %>"><img class="card-img-top card-img-top-myoverview" src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" class="img-fluid" alt="Card image"></a>
  <div class="card-body opindex boder border-success">
    <h5 class="card-title text-truncate"><%out.print(p.getTitle()); %></h5>

    <h5 class="card-text card-text-myoverview align-self-end"><small><b>in: </b><%out.print(p.getCategory()); %></small></h5>

  </div>
  <div class="card-footer border-success opindex">
  
  <div class="row p-1">
  <div class="col-xs-12 col-lg-6">
      <a href="projectdetailview.jsp?projectid=<% out.print(p.getId()); %>" class="btn btn-outline-success btn-work">Projekt einsehen</a>
    
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
      <a href="#" class="btn btn-success btn-block disabled">Unterstützt!</a>    
      <%
      }
    %>
    
  </div>
</div>
<div class="row p-1">
  <div class="col d-flex justify-content-center" >
      <a href="#" class="btn btn-success btn-block disabled" id="votes<%out.print(p.getId());%>">Unterstützungen: <%out.print (p.getVote()); %></a>    
    
  </div>
</div>
  
  
  
  </div>
</div>
</div>
<% } %>
</div>
</div>
</div>
<%
		
	break;}
	
	
	case 3:{%>
	<div class="formular-bd w-75 m-auto opindex">
	<div id="snackbar_message"></div>
	<div class="container text-center" id="voteReload">
	<div class="row">
	<%
	// creates a list of all opinionpolls the user voted for
List<OpinionPoll>oplist = OpinionPoll.getCitizenOp(u.getId());
	for (OpinionPoll op : oplist){
		int[] choice = op.getChoice().getChoice();
		List<String> header = op.getHeader();
%>

<div class="col-md-4" style="margin:0 0 1% 0%;">
<div class="card card-myoverview card-op border-success">
<a href="opdetailview.jsp?opinionpollid=<% out.print(op.getId()); %>"><img class="card-img-top card-img-top-myoverview " src="DisplayImageServlet?id=<%out.print(op.getId()); %>&select=2" class="img-fluid" alt="Card image"></a>
  <div class="card-body opindex opoverview-card-body">
    <h5 class="card-title text-truncate"><%out.print(op.getTitle()); %></h5>
  </div>
  <%if(op.getNostatistic() == 0){ %>
  <div class="card-footer border-success opindex">
  <div class="row p-1">
  <div class="col d-flex justify-content-center">
      <a href="opdetailview.jsp?opinionpollid=<% out.print(op.getId()); %>" class="btn btn-outline-success btn-block">Abstimmung einsehen</a>
  </div>
</div>
</div>
<%} %>
  <%if(op.getNostatistic() == 1){ %>
  <div class="card-footer border-success opindex">
  <div class="row p-1">
  <div class="col d-flex justify-content-center">
      <a href="#" class="btn btn-outline-success btn-block disabled" disabled>Abstimmung einsehen</a>
  </div>
</div>
</div>
<%} %>
</div>
</div>
	<% } %>
	</div>
	</div>
	</div>
	<%
			
		break;}
	}
	}
//checks if the user is an council member
if(u != null && u.getRole().getId() == 3){%>
	<div id="snackbar_message"></div>
	<div class="container text-center" id="voteReload">
	<div class="row">
	<%
	//gets all opinionpolls a council member created
List<OpinionPoll>oplist = OpinionPoll.getCouncilOp(u.getId());
	for (OpinionPoll op : oplist){
		int[] choice = op.getChoice().getChoice();
		List<String> header = op.getHeader();
%>

<div class="col-md-4" style="margin:0 0 1% 0%;">
<div class="card card-myoverview card-op border-success">
<a href="opdetailview.jsp?opinionpollid=<% out.print(op.getId()); %>"><img class="card-img-top card-img-myoverview" src="DisplayImageServlet?id=<%out.print(op.getId()); %>&select=2" class="img-fluid" alt="Card image"></a>
  <div class="card-body opindex opoverview-card-body">
    <h5 class="card-title text-truncate"><%out.print(op.getTitle()); %></h5>
  </div>
  <div class="card-footer border-success opindex">
  <div class="row p-1">
  <div class="col d-flex justify-content-center">
      <a href="opdetailview.jsp?opinionpollid=<% out.print(op.getId()); %>" class="btn btn-outline-success btn-block">Abstimmung einsehen</a>
  </div>
</div>
</div>
</div>
</div>
	<% } %>
	</div>
	</div>

<%} %>
<br>
<br>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>	

</body>
</html>