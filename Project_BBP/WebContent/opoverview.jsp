<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 1){
	response.sendRedirect("login.jsp?prevUrl=opoverview.jsp");
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
<title>Abstimmungen</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="script/cscript.js"></script>

	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="style/animate.css" media="screen" />
</head>
<body class="bg">
    <jsp:include page="include/header.jsp"></jsp:include> 
<script>
$(window).on('load', function(){
	  $('#cover').removeClass('activate');
	  $('#loader').removeClass('activate');
	});



</script>
<br>
<div class="formular-bd w-75 m-auto opindex">
<h1>Abstimmungen</h1> 
<br>
  <div id="cover" class="activate"></div>
<div id="loader" class="activate"></div> 
<div id="snackbar_message"></div>
<form >

<%
Map<Integer, Integer> alreadyVote = null;
if (u != null){
	alreadyVote = OpChoice.getUserChoices(u.getId());
}
List<OpinionPoll> oplist= OpinionPoll.getAll(2);
for ( OpinionPoll op: oplist){
%>
	<div id="dynamic_divs<%out.print(op.getId());%> ">
	<div class="card border-secondary" >
	<div class="card opindex" >
  <div class="card-header  text-white bg-secondary pt-2 pb-0">
    <h5 class="card-title"><%out.print(op.getTitle()); %></h5>
  </div>
  <div class="card-body opoverview-card-body">

    <p class="card-text">Beschreibung: <%out.print(op.getShort_description()); %></p>
    <p  class="card-text">Ersteller: <% out.print(op.getCreator().getFirstname()+" "+op.getCreator().getname()); %></p>
   </div><div class="card-footer bg-transparent border-secondary" id="reloadButton<%out.print(op.getId());%>">
	<%
	if(alreadyVote != null){
	if (alreadyVote.get(op.getId()) == null){
	%>
	<input class="btn  btn-success btn-block" value="Abstimmen" id="voteopbtn" onClick="voteopBox(<%out.print(op.getId());%>, 'open');">
	<%} else {%>
	<div class="row ">
	<div class="col-xs-12 col-xl-6">
	<input class="btn  btn-outline-success btn-block disabled " value="bereits Abgestimmt"></div>
	<div class="col-xs-12 col-xl-6">
	<a class="btn  btn-secondary btn-block  "  href="opanalysis.jsp" target="_blank">Statisik einsehen</a></div>
	</div>
	<%}
	}%>
	</div>
  
</div></div>

	<br>
	
	<!-- only show when button "Abstimmen" was clicked -->
	<div class="voteopBox bg-light text-dark " id="voteopBox<%out.print(op.getId());%>">
	<form>
	<img src="DisplayImageServlet?id=<%out.print(op.getId()); %>&select=2" height="200px"/><br>
	Titel: <%out.print(op.getTitle()); %><br/>
	Beschreibung: <%out.print(op.getShort_description()); %><br/><%
	%>Ersteller: <% out.print(op.getCreator().getFirstname()+" "+op.getCreator().getname()); %><br/>
	<%
	//List<String> header = new LinkedList<String>();
	List<String> header = op.getHeader();
	for(int i = 0; i<header.size() && header.get(i)!= null; i++){
		%><input type="radio" class="selection<%out.print(op.getId()); %>" name="selection<%out.print(op.getId()); %>" value="<%out.print(i); %>"><%out.print(header.get(i)); %> <br>
		<input type = "hidden" name = "id" value ="<%out.print(op.getId());%>">
		<input type="hidden" class="user" name="user" value= "<%if (u != null)out.print(u.getId()); %>" />
		<%
				
	}
	
	%>
	<input type="button" id="voteopsend" class="btn btn-lg btn-success btn-block" value="Abstimmung senden" onClick="doOpVote(<%out.print(op.getId());%>);">
	<input type="button" class="btn btn-lg btn-secondary btn-block" value="Abbrechen" onClick="voteopBox(<%out.print(op.getId());%>, 'close');">
	
	</div>
	</div></form>
<%
}
%>
</form>
</div>
<br>
<br>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>