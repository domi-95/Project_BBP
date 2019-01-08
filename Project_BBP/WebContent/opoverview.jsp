<%
User u = (User)session.getAttribute("user"); 
if (u == null){
	response.sendRedirect("index.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="user.*"%>
    <%@page import="opinionPoll.*"%>
    <%@page import="java.util.*"%>
     <jsp:include page="include/header.jsp"></jsp:include> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Abstimmungen!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</h1> 
  
<form action = "voteop" method = "post">
<%
List<OpinionPoll> oplist= OpinionPoll.getAll(1);
for ( OpinionPoll op: oplist){
	%><form><fieldset><br/>
	Titel: <%out.print(op.getTitle()); %><br/><%
	%>Beschreibung: <%out.print(op.getShort_description()); %><br/><%
	%>Ersteller: <% out.print(op.getCreator().getFirstname()+" "+op.getCreator().getname()); %><br/>
	
	<%
	//List<String> header = new LinkedList<String>();
	List<String> header = op.getHeader();
	for(int i = 0; i<header.size() && header.get(i)!= null; i++){
		%><input type="radio" name=<%out.print(op.getId()); %> value=<%out.print(i); %>><%out.print(header.get(i)); %> <br>
		<input type = "hidden" name = "id" value = <%out.print(op.getId());%>>
		<input type = "hidden" name = "user" value = <%out.print(u.getId());%>>
		
		<%
				
	}
	
	%><button class="btn btn-lg btn-primary btn-block" type="submit">Abstimmen</button></form><%
}
%>
</body>
</html>