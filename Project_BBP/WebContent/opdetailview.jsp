<%
User u = (User)session.getAttribute("user"); 
if (u == null){
	
	if(null != request.getParameter("opinionpollid")){
		response.sendRedirect("login.jsp?prevUrl=opdetailview.jsp?opinionpollid="+request.getParameter("opinionpollid"));
	}
	else{
	response.sendRedirect("login.jsp?prevUrl=opdetailview.jsp");
	}
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="opinionPoll.*"%>
    <%@page import="user.*"%>
    <%@page import="java.util.*"%>
    <%@page import="opinionPoll.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Abstimmungsergebnis</title>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/js/mdb.min.js"></script>
</head>
<body class="bg">
<jsp:include page="/include/header.jsp"></jsp:include>
<div class="content">
<div class="formular-bd w-75 m-auto opindex">
<form>
<%
//selected opinion poll gets showed
OpinionPoll op = OpinionPoll.getOp(Integer.parseInt(request.getParameter("opinionpollid")));
	int[] choice = op.getChoice().getChoice();
	List<String> header = op.getHeader(); %>
<div class="card opindex">
<div class="row w-100 mx-auto">
  <div class="card-header  text-white color-mosbach pt-2 pb-0 mb-0 col-xs-12 col-xl-6">
    <h5 class="card-title mb-0"><%out.print(op.getTitle()); %></h5>
    </div>
    <div class="card-header text-white color-mosbach pt2 pb0 mb-0 col-xs-12 col-xl-6">
    <p class="text-right mb-0">Dauer: <%out.print(op.getDate_from() + " - " + op.getDate_to()); %></p>
  </div>
  </div>
<div class="card-body opoverview-card-body">

<!-- chart design & script-->
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
        label: 'Anzahl der Stimmen',
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

<br>
<h6><b>Beschreibung:</b></h6>
<br>

<p><% out.print(op.getDescription()); %></p>
</div>
</div>
<br>
</form>
</div>
<br>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>