<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
    <%@page import="opinionPoll.*"%>
    <jsp:include page="include/header.jsp"></jsp:include> 
<!DOCTYPE html>

<%
//select all opend and closed opinionpolls
List<OpinionPoll>oplist2 = OpinionPoll.getAll(2);
List<OpinionPoll>oplist = OpinionPoll.getAll(3);
oplist.addAll(oplist2);
%>
<html>
<head>

<title>Abstimmungsergebnisse</title>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/js/mdb.min.js"></script>
</head>
<body class="bg">
<br>
<div class="content">
<div class="formular-bd w-75 m-auto opindex">

<h1>Abstimmungsergebnisse</h1>
<br>
<form>
<div id="snackbar_message"></div>
<div class="container text-center" id="voteReload">
<div class="row">
<%
// loop select list and show them on page
for (OpinionPoll op : oplist){
	int[] choice = op.getChoice().getChoice();
	List<String> header = op.getHeader();
%>


<div class="col-md-4" style="margin:0 0 1% 0%;">
<div class="card card-opanalysis border-success">
<a href="opdetailview.jsp?opinionpollid=<% out.print(op.getId()); %>"><img class="card-img-top card-img-top-opanalysis" src="DisplayImageServlet?id=<%out.print(op.getId()); %>&select=2" class="img-fluid" alt="Card image"></a>
  <div class="card-body opindex opoverview-card-body">
    <h5 class="card-title text-truncate"><%out.print(op.getTitle()); %></h5>
  </div>
  <div class="card-footer border-success opindex">
  <div class="row p-1">
  <div class="col d-flex justify-content-center">
      <a href="opdetailview.jsp?opinionpollid=<% out.print(op.getId()); %>" class="btn btn-outline-success btn-block btn-work text-truncate">Abstimmung einsehen</a>
  </div>
</div>
</div>
</div>
</div>

<br>
<%} %>
</div>
</div>
</form>
</div>
<br>
<br>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>