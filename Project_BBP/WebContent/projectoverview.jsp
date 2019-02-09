<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 1){
	response.sendRedirect("login.jsp?prevUrl=projectoverview.jsp");
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
<title>Projektübersicht</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="script/cscript.js"></script>
<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="style/animate.css" media="screen" />
	
	<script src="script/progressbar.min.js"></script>


<meta charset="ISO-8859-1">
<title>Projektübersicht</title>

</head>
<body class="bg">
<jsp:include page="/include/header.jsp"></jsp:include><br>
<div class="content">
<%

int x = 0;
int z = 1;
String category = null;
Map<Integer, Integer> alreadyVote = null;
if (u != null){
alreadyVote = Vote.getUserVotesHash(u.getId());
}

category = request.getParameter("category");
String search = request.getParameter("search");
List<Project> projectlist = Project.getAllFiltered(2, category, search);	


%>
<!-- --------------------------Search and filter bar-------------------------------------------------------------- -->
<div id="reloadDiv">

<div class="formular-bd1 w-75 mx-auto mt-0 mb-3">
	<form id="regForm" action = "#" method = "post" onsubmit="reloadDiv();">
  <div class="form-row align-items-center mx-auto content-center text-center">
     <div class="col-auto" >
      <select id="inputCategory" name="category" class="form-control" onchange="this.form.submit()">
        <option value="*" <%if(category != null && category.equals("*")){out.print(" selected");} %>>Alle Kategorien</option>
       		<option value="Wirtschaft und Finanzen" <%if(category != null && category.equals("Wirtschaft und Finanzen")){out.print(" selected");} %>>Wirtschaft und Finanzen</option>
			<option value="Bildung und Kultur" <%if(category != null && category.equals("Bildung und Kultur")){out.print(" selected");} %>>Bildung und Kultur</option>
			<option value="Sicherheit" <%if(category != null && category.equals("Sicherheit")){out.print(" selected");} %>>Sicherheit</option>
			<option value= "Sozial, Jugend und Gesundheit" <%if(category != null && category.equals("Sozial, Jugend und Gesundheit")){out.print(" selected");} %>>Sozial, Jugend und Gesundheit</option>
			<option value="Bau und Infrastruktur" <%if(category != null && category.equals("Bau und Infrastruktur")){out.print(" selected");} %>>Bau und Infrastruktur</option>
			<option value="Events und Öffentlichkeitsarbeit" <%if(category != null && category.equals("Events und Öffentlichkeitsarbeit")){out.print(" selected");} %>>Events und Öffentlichkeitsarbeit</option>
			<option value="Sonstiges" <%if(category != null && category.equals("Sonstiges")){out.print(" selected");} %>>Sonstiges</option>
      </select>
      </div>
      
      
       <div class="col-auto">
      <input type="text" class="form-control" name = "search" id="search" placeholder="Freitext..." value="<%if(request.getParameter("search") != null){out.print(request.getParameter("search"));}%>" maxlength="50" list="laender">
       <datalist id="laender">
       <%
       for (Project p : projectlist){
    	   %><option value=<%out.print(p.getTitle());%>><%
       }
       
       %>
  		</datalist>
    </div>
 
    <div class="col-auto">
      <button type="submit" class="btn btn-secondary">Filtern</button>
    </div>
  </div>
</form>
</div>


	<!-- --------------------------end Search and filter bar-------------------------------------------------------------- -->
<div id="snackbar_message"></div>
<div class="formular-bd w-75 m-auto opindex">
<div class="container text-center" id="voteReload">
<div class="row">
<% 
	
	for (Project p : projectlist){
	
		%>



<div class="col-md-4" style="margin:0 0 1% 0%;">
<div class="card card-projectoverview border-success">
  <a href="projectdetailview.jsp?projectid=<% out.print(p.getId()); %>"><img class="card-img-top card-img-top-projectoverview " src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" class="img-fluid" alt="Card image"></a>
  <div class="card-body opindex opoverview-card-body">
    <h5 class="card-title text-truncate"><%out.print(p.getTitle()); %></h5>
    <h6 class="card-text card-text-projectoverview"><small><b>in </b> <%out.print(p.getCategory()); %></small></h6>
  </div>
  <div class="card-footer border-success opindex">
  
  <div class="row p-1">
  <div id="container<%out.print(p.getId());%>" class="progressbar"></div>
  <div class="col-xs-12 col-lg-6">
      <a href="projectdetailview.jsp?projectid=<% out.print(p.getId()); %>" class="btn btn-outline-success btn-work mb-2">Projekt einsehen</a>
    
  </div>
  <div class="col-lg-6">
  <input type="hidden" class="user" name="user" value= "<%if (u != null)out.print(u.getId()); %>" />
  <input type="hidden" id="pid<%out.print(x); %>" class="pid" name="pid" value= "<%out.print(p.getId()); %>" />
  <input type="hidden" id="vote<%out.print(x); %>" class="pid" name="pid" value= "<%out.print(p.getVote()); %>" />
      <% 
      if (alreadyVote != null && alreadyVote.get(p.getId()) == null){
    	%> 
    	<input class="btn btn-success btn-block" value="Unterstützen" onClick="doPVote(<%out.print(p.getId());%>);">
        	
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
      <a href="#" class="btn btn-secondary btn-block disabled" id="votes<%out.print(p.getId());%>">Unterstützungen: <%out.print (p.getVote()); %></a>    
    
  </div>
</div>
  
  
  
  </div>
</div>
</div>



<%x++; }%>
<input type="hidden" id="x" class="pid" name="pid" value= "<%out.print(x); %>" />
	</div>
	</div>
	</div>
	</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<!-- script for progressbar -->
	<script>
	// progressbar.js@1.0.0 version is used
	// Docs: http://progressbarjs.readthedocs.org/en/1.0.0/
	var x = document.getElementById("x").value;
	
	var z = 0;
	while(z<x){
		var id = "pid" + z;
		var vote = "vote" + z;
	var pid = document.getElementById(id).value;
	var pvote = document.getElementById(vote).value;
	var barvotes = ((100/360)*pvote)/100;
	if(barvotes >= 1){
		pvote = 1;
	}else{
	pvote = barvotes;
	}
	var container = "#container"+pid;
	var bar = new ProgressBar.Line(container, {
	  strokeWidth: 4,
	  easing: 'easeInOut',
	  duration: 1400,
	  color: '#28a745',
	  trailColor: '#eee',
	  trailWidth: 1,
	  svgStyle: {width: '100%', height: '100%'},
	  text: {
	    style: {
	      // Text color.
	      // Default: same as stroke color (options.color)
	      color: '#999',
	      position: 'absolute',
	      right: '125px',
	      top: '-15px',
	      
	      padding: 0,
	      margin: 0,
	      transform: null
	    },
	    autoStyleContainer: false
	  },
	  from: {color: '#FFEA82'},
	  to: {color: '#ED6A5A'},
	  step: (state, bar) => {
	    bar.setText(Math.round(bar.value() * 100) + ' %');
	  }
	});
	z++;
	bar.animate(pvote);  // Number from 0.0 to 1.0
	}
	</script>
</body>
</html>