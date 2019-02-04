<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
    <%@page import="opinionPoll.*"%>
    <jsp:include page="include/header.jsp"></jsp:include> 
<!DOCTYPE html>

<%
List<OpinionPoll>oplist2 = OpinionPoll.getAll(2);
List<OpinionPoll>oplist = OpinionPoll.getAll(3);
oplist.addAll(oplist2);
%>
<html>
<head>
<style>
.card-text{
    font-size:19px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
.card {
    min-height: 300px;
}
.card-img-top {
    width: 100%;
    height: 15vw;
    object-fit: cover;
}

</style>
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
for (OpinionPoll op : oplist){
	int[] choice = op.getChoice().getChoice();
	List<String> header = op.getHeader();
%>

<!-- AZE -->
<div class="col-md-4" style="margin:0 0 1% 0%;">
<div class="card border-success">
<a href="opdetailview.jsp?opinionpollid=<% out.print(op.getId()); %>"><img class="card-img-top" src="DisplayImageServlet?id=<%out.print(op.getId()); %>&select=2" class="img-fluid" alt="Card image"></a>
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