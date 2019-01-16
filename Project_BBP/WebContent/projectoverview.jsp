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
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="script/cscript.js"></script>
<jsp:include page="/include/header.jsp"></jsp:include><br>
<head>
<title>Projektübersicht</title>


<style>

.card-text{
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
<meta charset="ISO-8859-1">
<title>Projektübersicht</title>
</head>
<body class="bg">
<div id="snackbar_message"></div>
<div class="container text-center" id="voteReload">
<div class="row">
<% 
	
	List<Project> projectlist = Project.getAll(2);
	
	int z = 1;
	Map<Integer, Integer> alreadyVote = null;
	if (u != null){
	alreadyVote = Vote.getUserVotes(u.getId());
	}
	for (Project p : projectlist){
	
		%>



<div class="col-sm-4">
<div class="card" style=" width:367px; margin:1% 0 1% 1.6%">
  <a href="projectdetailview.jsp?projectid=<% out.print(p.getId()); %>"><img class="card-img-top" src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" class="img-fluid" alt="Card image"></a>
  <div class="card-body opindex">
    <h6 class="card-title"><%out.print(p.getTitle()); %></h6>
    <p class="card-text">Kategorie: <%out.print(p.getCategory()); %></p>
    <p class="card-text"></p>
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
      <a href="#" class="btn btn-success btn-block disabled">Bereits Abgestimmt!</a>    
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


<% }%>
	</div>
	</div>
</body>
</html>