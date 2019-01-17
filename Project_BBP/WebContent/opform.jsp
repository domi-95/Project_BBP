<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 3){
	response.sendRedirect("login.jsp?prevUrl=opform.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="user.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Abstimmung erstellen</title>

<link href="style/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="script/datepicker.min.js"></script>

        <!-- Include German language -->
        <script src="script/i18n/datepicker.de.js"></script>
        
<!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
	
<!-- Custome style -->
	<link rel="stylesheet" type="text/css" href="style/cstyle.css" media="screen" />
	
<script src="script/cscript.js"></script>
</head>
<body class="bg opindex">
<jsp:include page="include/header.jsp"></jsp:include>

<!-- ======== Loader Container ======== -->
<div id="cover"></div>  
<div id="loader"></div> 
<!-- ======== Script for Loader ======== -->
<script>
$(window).bind("pageshow", function() {
	$('#cover').removeClass('activate');
	  $('#loader').removeClass('activate');
});
$(document).ready(function(){
		  $('#cover').removeClass('activate');
		  $('#loader').removeClass('activate');
	$('#regForm').submit(function(){
		  $('#cover').addClass('activate');
		  $('#loader').addClass('activate');
		});

	
	});
</script>

<script>
//Variables for adding answerfields
var feld = 3;
var feldm = 3;
var date_from;
var date_to;

//Creates an Date in the format of the HTML5 Date inputfield and sets it as the value of the hidden fields for "date_from" and "date_to"
function cutDate() {
	   var date_from_to = document.getElementById('date').value;
	   var day_from = date_from_to.substring(0, 2);
	   var month_from = date_from_to.substring(3, 5);
	   var year_from = date_from_to.substring(6, 10);
	   var day_to = date_from_to.substring(13, 15);
	   var month_to = date_from_to.substring(16, 18);
	   var year_to = date_from_to.substring(19, 23);
	   date_from = year_from + '-' + month_from + '-' + day_from;
	   date_to = year_to + '-' + month_to + '-' + day_to;
	   
	   document.getElementById("date_from").value = date_from;
	   document.getElementById("date_to").value = date_to;
	  
	 }
	 
	 
</script>
<div class="formular-bd">
<h2>Abstimmung erstellen</h2>
<br>
<form id="regForm" action = "CreateOpinionPoll" method = "post"  enctype="multipart/form-data">
<div class="form-row">
    <div class="form-group col-md-12">
      <label for="inputTitel">Titel</label>
      <input class="form-control" id="inputTitel" name="title" placeholder="Titel (max. 40 Zeichen)">
    </div>
  </div>
 <div class="form-group">
    <label for="exampleFormControlShortdescription">Kurzbeschreibung</label>
    <textarea class="form-control col-md-12" id="exampleFormControlShortdescription" name="short_description" rows="2" placeholder="Kurzbeschreibung (max. 150 Zeichen)"></textarea>
  </div>
 <div class="form-group">
    <label for="exampleFormControlDescription">Beschreibung</label>
    <textarea class="form-control col-md-12" id="exampleFormControlDescription" name="description" rows="6" placeholder="Beschreibung (max. 350 Zeichen)"></textarea>
  </div>


<div class="form-row">
    <div class="form-group col-md-6">
      <label for="date">Dauer der Abstimmung</label>
      <input class="form-control" type="text" id="date" data-range="true" data-multiple-dates-separator=" - " data-language="de" class="datepicker-here" placeholder="Dauer der Abstimmung"  required/>
<script>
//Functionality for Datepicker that it is not possible to choose dates in the past
var minDate = new Date();
$('#date').datepicker({
  minDate: minDate,
  autoClose: true,
  onHide: function(){
	  cutDate();
  }
});

</script>
<input type="hidden" id="date_from" name="date_from">
<input type="hidden" id="date_to" name="date_to">

    </div>
  </div>

<label for="chooseFile">Foto hochladen</label><br>
  <div class="custom-file col-md-4" id="chooseFile">
 <div class="form-row"> 
  <label for="loadFile" class="custom-file-label">Datei auswählen</label>
  <input type="file" class="custom-file-input form-control" id="loadFile" name="photo" size="50">

</div></div>
<br>
<br>
<div class="text-left">
<input class="btn btn-secondary col-md-4" type="button" value="Abstimmfeld hinzufügen" onClick="field('+');" required>

<input class="btn btn-secondary col-md-4 " type="button" value="Abstimmfeld entfernen" onClick="field('-');" required>

</div>
<br>

 <div class="form-row"> 
 <div class="col-md-4 form-group">
<input  class="form-control" type= "text" name = "n_1" placeholder = "Antwortmöglichkeit 1" required>
</div>
</div>
 <div class="form-row">
 <div class="col-md-4 form-group">
<input  class="form-control" type= "text" name = "n_2" placeholder = "Antwortmöglichkeit 2" required>
</div>
</div>

 
<div id="dynamic_input"></div> <br>
<div class="text-left">
<button class=" btn btn-success col-md-4 "type = "submit">Weitergabe</button>

</div>
<input type="hidden" name="user" value= "<%if (u != null)out.print(u.getId()); %>" />
</form>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>