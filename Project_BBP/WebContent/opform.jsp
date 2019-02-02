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
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <script src="script/datepicker.min.js"></script>

        <!-- Include German language -->
        <script src="script/i18n/datepicker.de.js"></script>
        
<!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
	
<!-- Custome style -->
	<link rel="stylesheet" type="text/css" href="style/cstyle.css" media="screen" />
	
	


	<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="script/cscript.js"></script>
</head>
<body class="bg ">
<jsp:include page="include/header.jsp"></jsp:include>
<div class="content">

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
<div class="formular-bd w-75 mx-auto mb-5 opindex">
<h2>Abstimmung erstellen</h2>
<br>
<form id="regForm" action = "CreateOpinionPoll" method = "post"  enctype="multipart/form-data" role="form" data-toggle="validator" novalidate="true">
<div class="form-row">
    <div class="form-group col-md-12">
      <label for="inputTitel">Titel*</label>
      <input class="form-control" id="inputTitel" name="title" placeholder="Titel (max. 50 Zeichen)"  value="" required data-error="Bitte geben Sie einen Titel ein." maxlength="50">
    <div class="help-block with-errors"></div>
    </div>
  </div>
 <div class="form-group">
    <label for="exampleFormControlShortdescription">Kurzbeschreibung</label>
    <textarea class="form-control col-md-12" id="exampleFormControlShortdescription" name="short_description" rows="2" placeholder="Kurzbeschreibung (max. 150 Zeichen)" required data-error="Bitte geben Sie eine Kurzbeschreibung ein." maxlength="150"></textarea>
	<div class="help-block with-errors"></div>  
  </div>
 <div class="form-group">
    <label for="exampleFormControlDescription">Beschreibung</label>
    <textarea class="form-control col-md-12" id="exampleFormControlDescription" name="description" rows="6" placeholder="Beschreibung (max. 800 Zeichen)" required data-error="Bitte geben Sie eine Beschreibung ein." maxlength="800"></textarea>
 	<div class="help-block with-errors"></div> 
  </div>


<div class="form-row">
    <div class="form-group col-md-6">
      <label for="date">Dauer der Abstimmung</label>
<input type="text" id="date" data-range="true" data-multiple-dates-separator=" - " data-language="de" class="datepicker-here form-control" placeholder="Dauer der Abstimmung" required data-error="Bitte geben Sie eine Dauer der Abstimmung an."  required/>
<div class="help-block with-errors"></div> 
<script>
var minDate = new Date();
//minDate.setDate(minDate.getDate() + 1);

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
  <input type="file" class="custom-file-input form-control" id="loadFile" name="photo" size="50">
  <label for="loadFile" class="custom-file-label">Datei auswählen</label>
	 <script>
            $('#loadFile').on('change',function(){
                //get the file name
                var fileName = $(this).val();
                //replace the "Choose a file" label
                $(this).next('.custom-file-label').html(fileName);
            });
        </script>
</div></div>
<br>
<br>
		 <div class="form-group">
    <input type="checkbox" name="nostatistic" > Keine Zwischenergebnise zeigen
		 <a class='my-tool-tip' data-toggle="tooltip" data-placement="right" title="Wenn dieses Feld ausgewählt wird, können Bürger nach der Teilnahme an der Abstimmung nicht sehen, wie andere Bürger bisher abgestimmt haben!" >
               <i class="fa fa-question-circle"></i>
            </a>

  </div>

<div class="text-left">
<input class="btn btn-secondary col-md-4" type="button" value="Antwortmöglichkeit hinzufügen" onClick="field('+');" required>

<input class="btn btn-secondary col-md-4 " type="button" value="Antwortmöglichkeit entfernen" onClick="field('-');" required>

</div>
<br>

 <div class="form-row"> 
 <div class="col-md-4 form-group">
<input  class="form-control" type= "text" name = "n_1" placeholder = "Antwortmöglichkeit 1" maxlength="20" required data-error="Es sind mind. zwei Antwortmöglichkeiten notwendig." required>
<div class="help-block with-errors"></div>
</div>
</div>
 <div class="form-row">
 <div class="col-md-4 form-group">
<input  class="form-control" type= "text" name = "n_2" placeholder = "Antwortmöglichkeit 2" maxlength="20" required data-error="Es sind mind. zwei Antwortmöglichkeiten notwendig."required>
<div class="help-block with-errors"></div>
</div>
</div>

 
<div id="dynamic_input"></div> <br>
<div class="text-left">
<button class=" btn btn-success col-md-4 "type = "submit">Absenden</button>

</div>
<input type="hidden" name="user" value= "<%if (u != null)out.print(u.getId()); %>" />
</form>
</div>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>