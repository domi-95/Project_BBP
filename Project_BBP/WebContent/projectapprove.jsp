<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 2){
	response.sendRedirect("login.jsp?prevUrl=projectapprove.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@page import="user.*"%>
<%@page import="project.*"%>
<%@page import="database.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>

	
	<!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="style/animate.css" media="screen" />
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>

<style>
#snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  bottom: 30px;
  font-size: 17px;
}
#msgBox {
  visibility: visible;
  border: solid 1px black;
  background-color: #333;
  color: #fff;
  font-size: 17px;
  text-align: center;
  padding: 16px;
    position: fixed;
    left: 50%;
    top: 50%;
    z-index: 200;

    height: 400px;
    margin-top: -200px;

    width: 600px;
    margin-left: -300px;
}

#overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  visibility: visible;
  opacity: 1;
}
#overlay:target {
  visibility: visible;
  opacity: 1;
}

#background{
position:absolute;
    z-index:0;
    background:white;
    display:block;
    min-height:50%; 
    min-width:50%;
    color:yellow;
}
#forground{
position:absolute;
z-index: 1;
}
#bg-text
{
    color:lightgrey;
    font-size:60px;
    transform:rotate(300deg);
    -webkit-transform:rotate(300deg);
}
</style>

<script>
function message(ar) {
	if(ar==1){
	  document.getElementById('successMsg').innerHTML +=
	  "<div id='snackbar' class=''>Projekt wurde genehmigt!</div>";
	}
	else{
		document.getElementById('successMsg').innerHTML +=
			  "<div id='snackbar' class=''>Projekt wurde abgelehnt!</div>";
	}
	  var element = 'snackbar';
	  $(function(){
			$(function(){
				$('#'+element).addClass('animated slideInUp');
	  document.getElementById("snackbar").style.visibility = "visible";
				$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
					$('#'+element).removeClass('animated slideInUp');
					$(function(){
						$('#'+element).addClass('animated slideOutDown delay-3s');
						$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
							$('#'+element).removeClass('animated slideOutDown delay-3s');
							$('#'+element).remove();	
						});
					});	
				});
			});
		});
	}
	
function rejectBox(id, z){
	document.getElementById('rejectBox').innerHTML +=
		"<div id='overlay' class='overlay'>"+
		  "<div id='msgBox'><h3>Project ablehnen</h3><br><br>"+
		"<p>Begründung: </p><br>"+
		"<textarea id='rejectReason' name='rejectReason' cols='35' rows='4' autofocus></textarea> <br><br>"+
		"<input type='button' value='Ablehnen' onClick='doReject("+id+","+ z+")'> <br><br>"+
		"<input type='button' value='Abbrechen' onClick='doClose();'></div>"+
		"</div>";
		
}


function remove_project(z) {
	  
	
	  var element = 'dynamic_divs' + z;
	  
	  $(function(){
			$(function(){
				$('#'+element).addClass('animated zoomOut delay-1s');
				$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
					$('#'+element).removeClass('animated zoomOut delay-1s');
					$('#'+element).slideUp();	
				});
			});
		});
	

	}

function doApprove(id, z) {
	var a = 1;
    //var phoneNo = $("#phoneNumber").val();
    //var x = "40";
    $.ajax({
        url: 'ApproveProject',
        type: 'POST',
        data: {
            pId: id,
            acceptreject: "approve"
        },
        success: function(data) {
        //    alert('Update Success');
        	message(a);
            remove_project(z);
        },
        failure: function(data) {
            alert('Update Failed');
        }
    });
    

}function doReject(id, z){
	var a = 2;
	var element = 'msgBox';
	var element1 = 'overlay';
	var rereason = ($.trim($("#rejectReason").val()));
	if(rereason != ""){
	$.ajax({
        url: 'ApproveProject',
        type: 'POST',
        data: {
            pId: id,
            acceptreject: "reject",
            rejectReason: rereason
        },
        success: function(data) {
        //    alert('Update Success');
        $(function(){
						$('#'+element).addClass('animated fadeOut faster');
						$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
							$('#'+element).removeClass('animated fadeOut faster');
							$('#'+element).remove();
							$('#'+element1).remove();
						});
					});
        	message(a);
            remove_project(z);
        },
        failure: function(data) {
            alert('Update Failed');
        }
    });
	}
	else{
		$(function(){
			$('#'+element).addClass('animated shake');
			$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
				$('#'+element).removeClass('animated shake');	
			});
		});
	}
}

function doClose(){
	var element = 'msgBox';
	var element1 = 'overlay';
	$(function(){
		$('#'+element).addClass('animated fadeOut faster');
		$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
			$('#'+element).removeClass('animated fadeOut faster');
			$('#'+element).remove();	
			$('#'+element1).remove();
		});
	});
}



$(document).ready(function() { 
	  $('input[name=stateSelect]').change(function(){
	       $('form[name=selectState]').submit();
	  });
	 });

function changeActive(){
	$(document).ready(function changeActive1(){
		changeActive1();
		
		});
}
</script>



<%
int state;
if(request.getParameter("stateSelect") != null){
	state = Integer.parseInt(request.getParameter("stateSelect"));%>
	<input type="hidden" id="state" value="<%out.print(state); %>">
	<script>
	
	changeActive();
	</script>
	<%
	}
	else{
	state = 1;
	}%>
</br>

<div id="successMsg"></div>
<div id="rejectBox"></div>

<form name="selectState" method="post" action="projectapprove.jsp">
<div class="btn-group btn-group-toggle d-flex justify-content-center" data-toggle="buttons">

  <label class="btn btn-secondary col-md-1 active" id="label1">
    <input type="radio" name="stateSelect" id="stateSelect" value="1"  <%if(state == 1){out.print(" checked");} %>> Angelegt
  </label>
  <label class="btn btn-secondary col-md-1" id="label2">
    <input type="radio" name="stateSelect" id="stateSelect" value="2" <%if(state == 2){out.print(" checked");} %>> Freigegeben
  </label>
  <label class="btn btn-secondary col-md-1" id="label3">
    <input type="radio" name="stateSelect" id="stateSelect" value="3" <%if(state == 3){out.print(" checked");} %>> Abgeschlossen
  </label>
</div>
</form>
<br>
<script>
$(document).ready(function changeActive1(){
	var id = document.getElementsByName('stateSelect');

	for (var i = 0, length = id.length; i < length; i++) {
	    if (id[i].checked) {
	        id = id[i].value;
	        break;
	    }
	}

	var element = "label"+id;		
	var element1 = "label1";
	$(function(){
		$('#'+element1).removeClass('active');	
		$('#'+element).addClass('active');
	});
});
</script>


<% 
	if(request.getParameter("stateSelect") != null){
	state = Integer.parseInt(request.getParameter("stateSelect"));
	}
	List<Project> projectlist = Project.getAll(state);
	String invest = "question.png";
	String period = "question.png";
	int z = 1;	

	//out.print (projectlist);
	for (Project p : projectlist){
	//Project project = ProjectDao.searchProject(3);
	// byte[] picture= project.getPicture();
	//ut.print (project.getPicture());
	//request.getSession();
	//session.setAttribute("picture", p.getPicture());
	
	//RequestDispatcher rd = request.getRequestDispatcher("/DisplayImageServlet2");
    //request.setAttribute("picture",p.getPicture());
    //rd.forward(request, response);
    
	%>
	<div class="card mx-auto listbordershadow" style="width: 80%;">
	
		
		<div class="container p-3" id="dynamic_divs<%out.print(z);%>">
<div class="row m-2">
  <div class="col-xl-12 border-bottom" >
     <h4><%out.print(p.getTitle()); %></h4>
  </div>
</div>
<div class="row m-2">
  <div class="col-xs-4 col-xl-3 border-bottom">
   <p class="font-weight-bold"> Kategorie: </p>
    
  </div>
  <div class="col-xs-4 col-xl-9 border-bottom">
    <%out.print(p.getCategory()); %>

  </div>
</div>
<div class="row m-2">
  <div class="col-xl-3 border-bottom">
    <p class="font-weight-bold">Kurzbeschreibung:</p>
  </div>
  <div class="col-xl-9 border-bottom">
    <%out.print(p.getShort_description()); %>
  </div>
</div>
<div class="row m-2">
  <div class="col-xl text-center">
    <button type="button" class="btn btn-info text-center" data-toggle="collapse" data-target="#details<%out.print(z);%>" aria-expanded="false" aria-controls="collapseExample">Mehr anzeigen</button>
  </div>
</div>
<div id="details<%out.print(z);%>" class="collapse">
<div class="row m-2">
  <div class="col-xs-12 col-xl-3 border-bottom">
    <p class="font-weight-bold">Beschreibung:</p>
  </div>
  <div class="col-xl-9 border-bottom">
    <%out.print(p.getDescription()); %>
  </div>
</div>
<div class="row m-2">
  <div class="col-xs-12 col-xl-3 border-bottom">
    <p class="font-weight-bold">Ersteller:</p>
  </div>
  <div class="col-xl-3 border-bottom">
   Test Ersteller
  </div>


  <div class="col-xs-12 col-xl-3 border-bottom">
    <p class="font-weight-bold">Telefonnummer:</p>
  </div>
  <div class="col-xl-3 border-bottom">
    <%out.print(p.getPhone_numer()); %>
  </div>
</div>

<div class="row m-2">
<%	
	if(p.getInvestment_grade().equals("Gering")){
		invest = "euro_less.png";	
	}
	if(p.getInvestment_grade().equals("Mittel")){
		invest = "euro_medium.png";	
	}
	if(p.getInvestment_grade().equals("Hoch")){
		invest = "euro_much.png";	
	}	
	if(p.getInvestment_grade().equals("nicht abschätzbar")){
		invest = "question.png";	
	}	
	%>
<div class="col-xs-12 col-xl-3" style="background:transparent url('Images/<%out.print(invest); %>') no-repeat center center /cover">
<div class="row" >
<div class="col-xl-12 d-flex justify-content-center">
<p class="font-weight-bold">Investitionsgrad</p>
</div>
</div>
<div class="row" >
<div class="col-xl-12 d-flex justify-content-center">
<%out.print(p.getInvestment_grade()); %>
</div>
</div>

</div>
<%	
	if(p.getPeriod().equals("Kurz")){
		period = "time_less.png";	
	}
	if(p.getPeriod().equals("Mittel")){
		period = "time_medium.png";	
	}
	if(p.getPeriod().equals("Lang")){
		period = "time_much.png";	
	}	
	if(p.getPeriod().equals("Dauerhafte Maßnahme")){
		period = "time_infinity.png";	
	}	
	%>
<div class="col-xl-3 " style="background:transparent url('Images/<%out.print(period); %>') no-repeat center center /cover">
<div class="row">
<div class="col-xl-12 d-flex justify-content-center">
<p class="font-weight-bold">Zeitspanne</p>
</div>
</div>
<div class="row">
<div class="col-xl-12 d-flex justify-content-center">
<%out.print(p.getPeriod());%>
</div>
</div>
</div>
<div class="col-xl-3" style="background:transparent url('Images/map.png') no-repeat center center /cover">
<div class="row">
<div class="col-xl-12 d-flex justify-content-center">
<p class="font-weight-bold">Ort</p>
</div>
</div>
<div class="row">
<div class="col-xl-12 d-flex justify-content-center">
 <%out.print(p.getLocation()); %>

 </div>
</div>
</div>
<div class="col-xl-3 imgCon d-inline-block">
	<img src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" class="img-fluid" alt="Image"/>
</div>
</div>

<% if(state==1){ %>
<div class="row collapse m-2" id="details<%out.print(z);%>" >
  <div class="col-xs-12 col-xl-6">
    <input class="btn btn-lg btn-primary btn-block" type="button" value="Genehmigen" onClick="doApprove(<%out.print(p.getId());%>, <%out.print(z);%>);">
  </div>
  <div class="col-xl-6">
    <input class="btn btn-lg btn-secondary btn-block" type="button" value="Ablehnen" onClick="rejectBox(<%out.print(p.getId());%>, <%out.print(z);%>);">
  </div>
</div>
<%} %> 
</div>
</div>
		
		 
			
			<!-- <h3> Nachricht: ${message}</h3> -->

			
	</div></div><br>
	<%
	//session.invalidate();
	z= z+1;
	}
	/* response.setContentType("image/gif");
    response.setContentLength(picture.length);
    ServletOutputStream sos = response.getOutputStream();
    //ServletOutputStream sos;
    sos.write(picture);
    response.getOutputStream().flush();
    response.getOutputStream().close(); */
	%>
	
</body>
</html>