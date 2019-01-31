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
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<div class="content">
<%
List<OpinionPoll> openend = OpinionPoll.getAll(2);
List<OpinionPoll> closed = OpinionPoll.getAll(3);
List<OpinionPoll> all = new LinkedList<OpinionPoll>();
all.addAll(openend);
all.addAll(closed);

for (OpinionPoll op : all){
	//out.print(op.getId());
	//System.out.println(op.getId()+"");
	
	%><a href="downloadXML?id=<%out.print(op.getId()); %>" accesskey="1" title="">Download XML ID: <%out.print(op.getId()); %></a><br><%
}
%>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>