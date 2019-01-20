<%
User u = (User)session.getAttribute("user");

if (u == null || u.getRole().getId() != 1){
	response.sendRedirect("login.jsp?prevUrl=projectform.jsp");

}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="user.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
	
<!-- Custome style -->
	<link rel="stylesheet" type="text/css" href="style/cstyle.css" media="screen" />
<!-- Login style -->
	<link rel="stylesheet" type="text/css" href="style/login.css" media="screen" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script src="script/cscript.js"></script>
<title>Projekt erstellen</title>
</head>
<body class="bg opindex">
<jsp:include page="include/header.jsp"></jsp:include>

<!-- LOAD -->
<div id="cover"></div>  
<div id="loader"></div> 
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

<!-- LOAD END -->
<!-- Validate Script -->
<script>
//Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

</script>


<div class="formular-bd">
<h2>Projektantrag erstellen</h2>
<br>
	<form id="regForm" method="post" action="CreateProjectProcess"	enctype="multipart/form-data" class="needs-validation" novalidate>
  <div class="form-row">
    <div class="form-group col-md-12 " >
      <label for="inputTitel">Titel*</label>
      <input class="form-control" id="inputTitel" name="title" placeholder="Titel (max. 40 Zeichen)" required>
     <div class="invalid-feedback">
        Bitte geben Sie einen Titel an.
      </div>
      </div>
    </div>
 
  
  <div class="form-row">
  <div class="form-group col-md-6" >
      <label for="inputCategory">Kategorie*</label>
      <select id="inputCategory" name="category" class="form-control" required>
        <option selected>Kategorie wählen...</option>
       		<option value="Wirtschaft und Finanzen">Wirtschaft und Finanzen</option>
			<option value="Wirtschaft und Finanzen" >Bildung und Kultur</option>
			<option value="Sicherheit">Sicherheit</option>
			<option value= "Sozial, Jugend und Gesundheit">Sozial, Jugend und Gesundheit</option>
			<option value="Bau und Infrastruktur">Bau und Infrastruktur</option>
			<option value="Events und Öffentlichkeitsarbeit">Events und Öffentlichkeitsarbeit</option>
			<option value="Sonstiges">Sonstiges</option>
      </select>
      <div class="invalid-feedback">
        Bitte geben Sie eine Kategorie an.
      </div>
    </div>
    </div>
  <div class="form-group">
    <label for="exampleFormControlShortdescription">Kurzbeschreibung*</label>
    <textarea class="form-control col-md-12" id="exampleFormControlShortdescription" name="shortDescription" rows="2" placeholder="Kurzbeschreibung (max. 150 Zeichen)" required></textarea>
 <div class="invalid-feedback">
        Bitte geben Sie eine Kurzbeschreibung an.
      </div>
  </div>
  <div class="form-group">
    <label for="exampleFormControlDescription">Beschreibung*</label>
    <textarea class="form-control col-md-12" id="exampleFormControlDescription" name="description" rows="6" placeholder="Beschreibung (max. 350 Zeichen)" required></textarea>
 <div class="invalid-feedback">
        Bitte geben Sie eine Beschreibung an.
      </div>
  </div>
 
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">Ort</label>
      <input type="text" class="form-control" id="inputCity" name="location" placeholder="Bsp. (max. 20 Zeichen)">
    </div>
   </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputPeriod">Dauer*</label>
      <select id="inputPeriod" name="period" class="form-control" required>
      <option value="Choose Period" selected>Zeitraum auswählen</option>
        <option value="Kurz">Kurz</option>
			<option value="Mittel">Mittel</option>
			<option value="Lang">Lang</option>
			<option value="Dauerhafte Maßnahme">Dauerhafte Maßnahme</option>
      </select>
      <div class="invalid-feedback">
        Bitte geben Sie eine Dauer an.
      </div>
    </div>
     <div class="form-group col-md-6">
      <label for="inputGrade">Investitionsgrad*</label>
      <select id="inputGrade" name="investmentGrade" class="form-control" required>
        <option value="Choose Grade" selected>Investitionsgrad auswählen</option>
			<option value="Gering">Gering</option>
			<option value="Mittel">Mittel</option>
			<option value="Hoch">Hoch</option>
			<option value="nicht abschätzbar">nicht abschätzbar</option>
      </select>
      <div class="invalid-feedback">
        Bitte geben Sie einen Investitionsgrad an.
      </div>
    </div>
  </div> 

<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputPhonenumber">Telefonnummer</label>
      <a class='my-tool-tip' data-toggle="tooltip" data-placement="right" title="Die Telefonnummer dient nur für eventuelle Rückfragen der Stadtverwaltung und wird entsprechend diskret behandelt. Eine Veröffentlichung und somit Sichtbarkeit für andere User ist explizit ausgeschlossen." >
               <i class="fa fa-question-circle"></i>
            </a>
      <input type="text" class="form-control" id="inputPhonenumber" name="phoneNumber" placeholder="Bsp. 01234/56789"><br>
    </div>
  </div>

<script>
</script>

	<label for="chooseFile">Foto hochladen</label><br>
  <div class="custom-file col-md-6" id="chooseFile">
  
  <input type="file" class="form-control custom-file-input" name="photo" id="loadFile" accept="image/x-png,image/gif,image/jpeg">
  <label for="loadFile" class="custom-file-label">Datei auswählen</label>
 <script>
            $('#loadFile').on('change',function(){
                //get the file name
                var fileName = $(this).val();
                alert(fileName);
                //replace the "Choose a file" label
                $(this).next('.custom-file-label').html(fileName);
            });
        </script>

</div>
<br>
<br>

<div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="stayAnonym" name="anonymous">
      <label class="form-check-label" for="stayAnonym">
        Anonym bleiben
      </label>
      <a class='my-tool-tip' data-toggle="tooltip" data-placement="right" title="Ihr Name wird bei Veröffentlichung des Projekts nicht angezeigt. Die Stadtverwaltung hat dennoch die Möglichkeit sie für eventuelle Rückfragen unter der Ihrer E-Mailadresse zu kontaktieren.">
               <i class="fa fa-question-circle"></i>
            </a>
    </div>
  </div>

<div class="text-left">
  <button type="submit" class="btn btn-success col-md-4 " >Absenden</button>
  <button class="btn btn-secondary col-md-4" type="reset">Formular zurücksetzen</button>
		<input type="hidden" name="user" value= "<%if (u != null)out.print(u.getId()); %>" /><br />

</div>
</form>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>