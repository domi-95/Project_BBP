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
    z-index: 100;

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
	<div class="table-responsive-md px-2" id="dynamic_divs<%out.print(z);%>">
	
			
				 
				<table class=" table table-hover table-borderless float-left" >
				<thead>
    			<tr>
				<th scope="col" colspan="2" style="width: 100%;"><h4><%out.print(p.getTitle()); %></h4></tr>
				
				</thead>
				<tbody >
   				<tr><th scope="row" colspan="1" style="width: 50%;">Kategorie:</th> <td style="width: 50%;"><%out.print(p.getCategory()); %></td></tr>
				<tr><th scope="row" colspan="1">Kurzbeschreibung:</th><td> <%out.print(p.getShort_description()); %></td></tr>
			 	</tbody>	 	
			 	<tr><th scope="row" colspan="1"><button type="button" class="btn btn-info" data-toggle="collapse" data-target="#details<%out.print(z);%>" aria-expanded="false" aria-controls="collapseExample">Mehr anzeigen</button></th></tr>
			 	
			 	<tbody id="details<%out.print(z);%>" class="collapse">
				
				<tr><th scope="row" colspan="1">Investitionsgrad:</th><td colspan="4"><%out.print(p.getInvestment_grade()); %></td><td colspan="1" rowspan="3"><img src="DisplayImageServlet?id=<%out.print(p.getId()); %>&select=1" height="200px"/></td></tr>
				<tr><th scope="row" colspan="1">Zeitspanne:</th><td colspan="4"><%out.print(p.getPeriod());%></td></tr>
				<tr><th scope="row" colspan="1">Telefonnummer:</th><td colspan="4"><%out.print(p.getPhone_numer()); %></td></tr>
				<tr><th scope="row" colspan="1">Ort:</th><td colspan="4"> <%out.print(p.getLocation()); %></td></tr>
				<tr><th scope="row" colspan="1">Beschreibung:</th><td colspan="5"> <%out.print(p.getDescription()); %></td></tr>
				
				</tbody>
				
				
	<% if(state==1){ %><tbody id="details<%out.print(z);%>" class="collapse" style="width: 100%;">
				<tr><th scope="row" colspan="3"><input type="hidden" name="id" value="<%out.print(p.getId());%>">
				<input class="btn btn-lg btn-primary btn-block" type="button" value="Genehmigen" onClick="doApprove(<%out.print(p.getId());%>, <%out.print(z);%>);"></th> 
				<td colspan="3"><input class="btn btn-lg btn-secondary btn-block" type="button" value="Ablehnen" onClick="rejectBox(<%out.print(p.getId());%>, <%out.print(z);%>);"></td></tr>
		<%} %> 	
		
		</tbody></table>
		
		 
			
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