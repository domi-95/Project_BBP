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
    z-index: 100;

    height: 400px;
    margin-top: -200px;

    width: 600px;
    margin-left: -300px;
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
		  "<div id='msgBox'><h3>Project ablehnen</h3><br><br>"+
		"<p>Begründung: </p><br>"+
		"<textarea id='rejectReason' name='rejectReason' cols='35' rows='4' autofocus></textarea> <br><br>"+
		"<input type='button' value='Ablehnen' onClick='doReject("+id+","+ z+")'> <br><br>"+
		"<input type='button' value='Abbrechen' onClick='doClose();'></div>";
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
	$(function(){
		$('#'+element).addClass('animated fadeOut faster');
		$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
			$('#'+element).removeClass('animated fadeOut faster');
			$('#'+element).remove();	
		});
	});
}

</script>



<%int state = 1;
if(request.getParameter("stateSelect") != null){
	state = Integer.parseInt(request.getParameter("stateSelect"));
	out.print(state);
	}%>
</br>

<div id="successMsg"></div>
<div id="rejectBox"></div>

<form method="post" action="dashboard.jsp">
<select id="stateSelect" name="stateSelect" onchange="submit()">
	<!-- <option value="1" <%if(state == 0){out.print(" selected");} %>>Bitte wähle einen Status</option>-->
	<option value="1" <%if(state == 1){out.print(" selected");} %>>Angelegt</option>
	<option value="2" <%if(state == 2){out.print(" selected");} %>>Freigegeben</option>
	<option value="3" <%if(state == 3){out.print(" selected");} %>>Abgeschlossen</option>
</select>
</form>

<% 
	if(request.getParameter("stateSelect") != null){
	state = Integer.parseInt(request.getParameter("stateSelect"));
	out.print(state);
	}
	List<Project> projectlist = Project.getAll(state);
	
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

	<div class="table-responsive-md" id="dynamic_divs<%out.print(z);%>">
	<table class="table">
		<thead>
			<tr>
			<form>
				  <img src="DisplayImageServlet?id=<%out.print(p.getId()); %>" height="200px"/>
				
				<h2><%out.print(p.getTitle()); %></h2>
				<p>Kategorie: <%out.print(p.getCategory()); %></p>
				<p>Investitionsgrad: <%out.print(p.getInvestment_grade()); %></p>
				<p>Zeitspanne: <%out.print(p.getPeriod()); %></p>
				<p>Telefonnummer: <%out.print(p.getPhone_numer()); %></p>
				<p>Ort: <%out.print(p.getLocation()); %></p>
				<p>Kurzbeschreibung: <%out.print(p.getShort_description()); %></p>
				<p>Beschreibung: <%out.print(p.getDescription()); %></p>
	<% if(state==1){ %>
				<input type="hidden" name="id" value="<%out.print(p.getId());%>">
				<input class="btn btn-lg btn-primary btn-block" type="button" value="Genehmigen" onClick="doApprove(<%out.print(p.getId());%>, <%out.print(z);%>);"> 
				<input class="btn btn-lg btn-secondary btn-block" type="button" value="Ablehnen" onClick="rejectBox(<%out.print(p.getId());%>, <%out.print(z);%>);">
		<%} %>	
			</form>	
			<!-- <h3> Nachricht: ${message}</h3> -->

			</tr>
		</thead>
	</table>
	</div>
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