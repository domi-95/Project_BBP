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
<title>Abstimmungsergebnisse</title>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/js/mdb.min.js"></script>
</head>
<body class="bg">
<br>
<div class="formular-bd w-75 m-auto opindex">
<h1>Abstimmungsergebnisse</h1>
<br>
<form>
<%
for (OpinionPoll op : oplist){
	int[] choice = op.getChoice().getChoice();
	List<String> header = op.getHeader();
%>
<div class="card opindex">
<div class="card-header  text-white bg-secondary pt-2 pb-0">
<h5 class="card-title"><%out.print(op.getTitle()); %></h5>
</div>
<div class="card-body opoverview-card-body">
<canvas id="barChart<%out.print(op.getId()); %>"></canvas>
<script>
  var ctxB = document.getElementById("barChart<%out.print(op.getId()); %>").getContext('2d');
  var myBarChart = new Chart(ctxB, {
    type: 'bar',
    data: {
      labels:<% out.print("[");
      	for (int i = 0; i<header.size();i++) {
    		out.print("\""+header.get(i)+"\"");
    		if(i<header.size()-1) {
    		out.print(", ");
    		}
    	}
    	out.print("]"); %>,
      datasets: [{
        label: 'Number of Votes',
       // data: [12, 19, 3, 5, 2, 3],
       data: <%out.print("[");
		for (int i = 0; i < header.size(); i++) {
			out.print(choice[i]);
			if(i<header.size()-1) {
				out.print(",");
				}
		}
		out.print("]"); %>,
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)'
        ],
        borderColor: [
          'rgba(255,99,132,1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true,
            callback: function(value) {if (value % 1 === 0) {return value;}}
          }
        }]
      }
    }
  });
</script>
</div>
</div>
<br>
<%} %>
</form>
</div>
<br>
<br>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>