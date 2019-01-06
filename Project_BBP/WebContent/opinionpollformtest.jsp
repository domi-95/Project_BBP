<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
    <%@page import="java.util.LinkedList"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
List<String> result = new LinkedList<String>();
for (int i = 1; i<11; i++){
//out.print(request.getParameter("n_1"));
result.add(request.getParameter("n_"+i+"")); %></br><%
}

out.print(result);
%>
</body>
</html>