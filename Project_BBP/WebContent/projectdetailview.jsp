<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 1){
	String id = request.getParameter("projectid");
	response.sendRedirect("login.jsp?prevUrl=projectdetailview.jsp?projectid="+id);
}
%>
<%@page import="user.*"%>
<%@page import="project.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<jsp:include page="/include/header.jsp"></jsp:include><br>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="http://localhost:8080/Project_BBP/projectoverview.jsp" class="btn btn-success listbordershadow" style=" margin-left: 154px; margin-bottom: 5px">Zurück</a>
<% 
Project p = Project.getProject(Integer.parseInt(request.getParameter("projectid")));
Map<Integer, Integer> alreadyVote = Vote.getUserVotes(p.getId());%>
<div class="card mx-auto listbordershadow" style="width: 80%;">
<div class="row m-2">
  <div class="col-xl-12 border-bottom" >
     <h4><%out.print(p.getTitle()); %></h4> <!-- Get Title -->
  </div>
</div>
<div class="row m-2">
  <div class="col-xs-4 col-xl-3 border-bottom">
   <p class="font-weight-bold"> Kategorie: </p>
    
  </div>
  <div class="col-xs-4 col-xl-9 border-bottom">
    <%out.print(p.getCategory()); %>
    Test
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
<div class="row">
<div class="col-xl-9">
<div class="row m-2">
  <div class="col-xl-4 border-bottom">
    <p class="font-weight-bold">Ersteller:</p>
    
  </div>
  <div class="col-xl-8 border-bottom">
    ***Ersteller***

  </div>
    </div>
<div class="row m-2">
  <div class="col-xl-4 border-bottom">
    <p class="font-weight-bold">Investitionsgrad:</p>
    
  </div>
  <div class="col-xl-8 border-bottom">
    <%out.print(p.getInvestment_grade()); %>

  </div>
    </div>
  <div class="row m-2">
  <div class="col-xl-4 border-bottom">
    <p class="font-weight-bold">Zeitspanne:</p>
    
  </div>
  <div class="col-xl-8 border-bottom">
    <%out.print(p.getPeriod());%>
  </div>
  </div>
  <div class="row m-2">
  <div class="col-xl-4 border-bottom">
    <p class="font-weight-bold">Ort:</p>
    
  </div>
  <div class="col-xl-8 border-bottom">
    <%out.print(p.getLocation()); %>
  </div>
</div>
</div>
  <div class="col-xs-12 col-xl-3">
    <img src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" height="200px" style=" margin-bottom: 10px"/>
  </div>
</div>

<% 
	

      if (alreadyVote.get(p.getId()) == null){
    	%>	 
      <a href="#" class="btn btn-success" style=" margin: 5px">Voten</a>  	
    	<%  
      } else {
    	%>
      <a href="#" class="btn btn-success disabled" style=" margin: 5px">Bereits Abgestimmt!</a> 
      <%
      }
    %>
      <a href="#" class="btn btn-success disabled" style=" margin: 5px">Stimmen: <%out.print (p.getVote()); %></a>
	</div>

</body>
</html>