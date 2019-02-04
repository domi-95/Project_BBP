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

<div class="row">
  <div class="col-xs-12 col-md-3">
   <p class="font-weight-bold">Indentifikationsnummer</p>
    
  </div>
  <div class="col-xs-12 col-md-3">
    <p class="font-weight-bold">Titel</p>
    
  </div>
  <div class="col-xs-12 col-md-3">
    <p class="font-weight-bold">Datum</p>
    
  </div>
</div>




<%
List<OpinionPoll> openend = OpinionPoll.getAll(2);
List<OpinionPoll> closed = OpinionPoll.getAll(3);
List<OpinionPoll> all = new LinkedList<OpinionPoll>();
all.addAll(openend);
all.addAll(closed);

for (OpinionPoll op : all){
	//out.print(op.getId());
	//System.out.println(op.getId()+"");
	
	%>
	
	
	<div class="row border-bottom">
	<div class="col-xs-12 col-md-3">
	<%out.print(op.getId()); %>
	</div>
	<div class="col-xs-12 col-md-3">
	<%out.print(op.getTitle());%> 
	</div>
	
	<div class="col-xs-12 col-md-3">
	<%out.print(op.getDate_from()); %>
	</div>
	<div class="col-xs-12 col-md-3">
	<a class="text-success"href="downloadXML?id=<%out.print(op.getId()); %>" accesskey="1" title="">
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