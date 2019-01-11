<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 1){
	response.sendRedirect("index.jsp");
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
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="include/header.jsp"></jsp:include> 
<script>
$(window).on('load', function(){
	  $('#cover').removeClass('activate');
	  $('#loader').removeClass('activate');
	});

function voteopBox(id, action){
	var ac = action;
	var cover = 'cover';
	var voteopBox = 'voteopBox' + id
	if((ac.localeCompare('open')) == 0){
	  $('#'+cover).addClass('activate');
	  $('#'+ voteopBox).addClass('activate');
	}
	if((ac.localeCompare('close')) == 0){
	  $('#'+cover).removeClass('activate');
	  $('#'+ voteopBox).removeClass('activate');		
	}	
}

</script>
<h1>Abstimmungen</h1> 
  <div id="cover" class="activate"></div>
<div id="loader" class="activate"></div> 
<form action = "voteop" method = "post">
<%
List<OpinionPoll> oplist= OpinionPoll.getAll(1);
for ( OpinionPoll op: oplist){
%>
	Titel: <%out.print(op.getTitle()); %><br/>
	Beschreibung: <%out.print(op.getShort_description()); %><br/><%
	%>Ersteller: <% out.print(op.getCreator().getFirstname()+" "+op.getCreator().getname()); %><br/>
	<input class="btn btn-lg btn-primary btn-block" value="Abstimmen" id="voteopbtn" onClick="voteopBox(<%out.print(op.getId());%>, 'open');">
	<!-- only show when button "Abstimmen" was clicked -->
	<div class="voteopBox" id="voteopBox<%out.print(op.getId());%>">
	<form action = "voteop" method = "post">
	<img src="DisplayImageServlet?id=<%out.print(op.getId()); %>&select=2" height="200px"/><br>
	Titel: <%out.print(op.getTitle()); %><br/>
	Beschreibung: <%out.print(op.getShort_description()); %><br/><%
	%>Ersteller: <% out.print(op.getCreator().getFirstname()+" "+op.getCreator().getname()); %><br/>
	<%
	//List<String> header = new LinkedList<String>();
	List<String> header = op.getHeader();
	for(int i = 0; i<header.size() && header.get(i)!= null; i++){
		%><input type="radio" name=<%out.print(op.getId()); %> value=<%out.print(i); %>><%out.print(header.get(i)); %> <br>
		<input type = "hidden" name = "id" value = <%out.print(op.getId());%>>
		<input type="hidden" name="user" value= "<%if (u != null)out.print(u.getId()); %>" />
		<%
				
	}
	
	%>
	<input id="voteopsend" class="btn btn-lg btn-primary btn-block" value="Abstimmung senden" type="submit" onClick="voteopBox(<%out.print(op.getId());%>, 'close');">
	<input class="btn btn-lg btn-secondary btn-block" value="Abbrechen" onClick="voteopBox(<%out.print(op.getId());%>, 'close');">
	</form>
	</div>
<%
}
%>
</body>
</html>