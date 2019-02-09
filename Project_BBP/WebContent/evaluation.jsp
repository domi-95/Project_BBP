<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 2){
	response.sendRedirect("login.jsp?prevUrl=projectapprove.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="user.*"%>
    <%@page import="opinionPoll.*"%>
    <%@page import="java.util.*"%>
    	
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auswertungen</title>

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body class="bg">
<jsp:include page="/include/header.jsp"></jsp:include>
<div class="formular-bd w-75 m-auto ">
<h2>Auswertung für Abstimmungen erstellen</h2>
<br>
<!-- Table header -->
<div class="row">
  <div class="col-xs-12 col-md-2">
   <p class="font-weight-bold">Indentifikationsnummer</p>
    
  </div>
  <div class="col-xs-12 col-md-2">
    <p class="font-weight-bold">Titel</p>
    
  </div>
  <div class="col-xs-12 col-md-2">
    <p class="font-weight-bold">Erstellungsdatum</p>
    
  </div>
  <div class="col-xs-12 col-md-2">
    <p class="font-weight-bold">Startdatum</p>
    
  </div>
  <div class="col-xs-12 col-md-2">
    <p class="font-weight-bold">Enddatum</p>
    
  </div>
</div>




<%
// gets list of opened opinionpolls from the database
List<OpinionPoll> openend = OpinionPoll.getAll(2);
// gets list of closed opinionpolls from database
List<OpinionPoll> closed = OpinionPoll.getAll(3);
// creates empty list of type OpinionPoll
List<OpinionPoll> all = new LinkedList<OpinionPoll>();
// adds open list to list all
all.addAll(openend);
// adds closed list to list all
all.addAll(closed);

// loops over list of all opinion polls
// loop gets all opinionpolls out of the list
for (OpinionPoll op : all){	
	%>
	
	<!-- displays artefacts of opinionpolls -->
	<div class="row border-bottom">
	<div class="col-xs-12 col-md-2">
	<%out.print(op.getId()); %>
	</div>
	<div class="col-xs-12 col-md-2">
	<%out.print(op.getTitle());%> 
	</div>
	
	<div class="col-xs-12 col-md-2">
	<%out.print(op.getCreated()); %>
	</div>
	<div class="col-xs-12 col-md-2">
	<%out.print(op.getDate_from()); %>
	</div>
	<div class="col-xs-12 col-md-2">
	<%out.print(op.getDate_to()); %>
	</div>
	<!-- download button for xml-file (calls download servelet) -->
	<div class="col-xs-12 col-md-2">
	<a class="text-success float-right"href="downloadXML?id=<%out.print(op.getId()); %>" accesskey="1" title="">
	<i class="fa fa-download"></i> Herunterladen</a>
	</div>
	</div>
	<%
}
%>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>