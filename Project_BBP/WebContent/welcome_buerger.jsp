<%
User u = (User)session.getAttribute("user"); 
if (u == null){
	response.sendRedirect("index.jsp");
}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Willkommen</title>
</head>
<body>
<%@page import="user.*"%>
<jsp:include page="/include/header.jsp"></jsp:include> -->

 <%@page import="database.*"%>
	<%@page import="user.*"%>
<%
	
  	// User u = (User)session.getAttribute("objekt"); 
	out.print(u);
	

 
  %>

</body>
</html>