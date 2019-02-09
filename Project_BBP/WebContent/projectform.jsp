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
		<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	
<!-- Custome style -->
	<link rel="stylesheet" type="text/css" href="style/cstyle.css" media="screen" />
<!-- Login style -->
	<link rel="stylesheet" type="text/css" href="style/login.css" media="screen" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="script/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="script/cscript.js"></script>
<title>Projekt erstellen</title>



</head>
<body class="bg ">
<jsp:include page="include/header.jsp"></jsp:include>
<div class="content">
<!-- LOAD -->
<div id="cover"></div>  
<div id="loader"></div> 
<!-- script for loader which is shown by sending the form -->
<script>
$(window).bind("pageshow", function() {
	$('#cover').removeClass('activate');
	  $('#loader').removeClass('activate');
});
$(document).ready(function(){
		  $('#cover').removeClass('activate');
		  $('#loader').removeClass('activate');
	
	});
</script>

<!-- LOAD END -->


<div class="formular-bd w-75 mx-auto opindex">
<h2>Projektantrag erstellen</h2>
<br>
	<form id="regForm" method="post" action="CreateProjectProcess"	enctype="multipart/form-data" role="form" data-toggle="validator" novalidate="true">
  <div class="form-row">
    <div class="form-group col-md-12 " >
      <label for="inputTitel">Titel*</label>
      <input class="form-control" id="inputTitel" name="title" placeholder="Titel (max. 50 Zeichen)" value="" required data-error="Bitte geben Sie einen Titel ein." maxlength="50">
      <div class="help-block with-errors"></div>
      </div>
    </div>
 
  
  <div class="form-row">
  <div class="form-group col-md-6" >
      <label for="inputCategory">Kategorie*</label>
      <select id="inputCategory" name="category" class="form-control" required data-error="Bitte w�hlen Sie eine Kategorie aus.">
        <option value="">Kategorie w�hlen...</option>
       		<option value="Wirtschaft und Finanzen">Wirtschaft und Finanzen</option>
			<option value="Bildung und Kultur" >Bildung und Kultur</option>
			<option value="Sicherheit">Sicherheit</option>
			<option value= "Sozial, Jugend und Gesundheit">Sozial, Jugend und Gesundheit</option>
			<option value="Bau und Infrastruktur">Bau und Infrastruktur</option>
			<option value="Events und �ffentlichkeitsarbeit">Events und �ffentlichkeitsarbeit</option>
			<option value="Sonstiges">Sonstiges</option>
      </select>
      <div class="help-block with-errors"></div>
    </div>
    </div>
  <div class="form-group">
    <label for="exampleFormControlShortdescription">Kurzbeschreibung*</label>
    <textarea class="form-control col-md-12" id="exampleFormControlShortdescription" name="shortDescription" rows="2" placeholder="Kurzbeschreibung (max. 150 Zeichen)" required data-error="Bitte geben Sie eine Kurzbeschreibung ein." maxlength="150"></textarea>
    <div class="help-block with-errors"></div>
  </div>
  <div class="form-group">
    <label for="exampleFormControlDescription">Beschreibung*</label>
    <textarea class="form-control col-md-12" id="exampleFormControlDescription" name="description" rows="6" placeholder="Beschreibung (max. 800 Zeichen)" required data-error="Bitte geben Sie eine Beschreibung ein." maxlength="800"></textarea>
    <div class="help-block with-errors"></div>
  </div>
 
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">Ort</label>
      <input type="text" class="form-control" id="inputCity" name="location" placeholder="Bsp. (max. 100 Zeichen)" maxlength="100">
    </div>
   </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputPeriod">Dauer*</label>
      <select id="inputPeriod" name="period" class="form-control" required data-error="Bitte geben Sie eine Dauer ein.">
      <option value="">Zeitraum ausw�hlen</option>
        <option value="Kurz">Kurz</option>
			<option value="Mittel">Mittel</option>
			<option value="Lang">Lang</option>
			<option value="Dauerhafte Ma�nahme">Dauerhafte Ma�nahme</option>
      </select>
      <div class="help-block with-errors"></div>
    </div>
     <div class="form-group col-md-6">
      <label for="inputGrade">Investitionsgrad*</label>
      <select id="inputGrade" name="investmentGrade" class="form-control" required data-error="Bitte geben Sie einen Investitionsgrad ein.">
        <option value="">Investitionsgrad ausw�hlen</option>
			<option value="Gering">Gering</option>
			<option value="Mittel">Mittel</option>
			<option value="Hoch">Hoch</option>
			<option value="nicht absch�tzbar">nicht absch�tzbar</option>
      </select>
      <div class="help-block with-errors"></div>
    </div>
  </div> 

<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputPhonenumber">Telefonnummer</label>
      <a class='my-tool-tip' data-toggle="tooltip" data-placement="right" title="Die Telefonnummer dient nur f�r eventuelle R�ckfragen der Stadtverwaltung und wird entsprechend diskret behandelt. Eine Ver�ffentlichung und somit Sichtbarkeit f�r andere User ist explizit ausgeschlossen." >
               <i class="fa fa-question-circle"></i>
            </a>
      <input type="text" class="form-control" id="inputPhonenumber" name="phoneNumber" placeholder="Bsp. 01234/56789" maxlength="20"><br>
    </div>
  </div>

<script>
</script>

	<label for="chooseFile">Foto hochladen</label><br>
  <div class="custom-file col-md-6" id="chooseFile">
  
  <input type="file" class="form-control custom-file-input" name="photo" id="loadFile" accept="image/x-png,image/gif,image/jpeg">
  <label for="loadFile" class="custom-file-label text-truncate">Datei ausw�hlen</label>
  <!--  fills the select file field with the name and path of the selected file -->
 <script>
            $('#loadFile').on('change',function(){
                //get the file name
                var fileName = $(this).val();
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
      <a class='my-tool-tip' data-toggle="tooltip" data-placement="right" title="Ihr Name wird bei Ver�ffentlichung des Projekts nicht angezeigt. Die Stadtverwaltung hat dennoch die M�glichkeit sie f�r eventuelle R�ckfragen unter der Ihrer E-Mailadresse zu kontaktieren.">
               <i class="fa fa-question-circle"></i>
            </a>
    </div>
  </div>

<div class="text-left">
  <input id="send" type="submit" class="submit btn btn-success col-md-4 " value="Absenden">
  <button class="btn btn-secondary col-md-4" type="reset">Formular zur�cksetzen</button>
		<input type="hidden" name="user" value= "<%if (u != null)out.print(u.getId()); %>" /><br />

</div>
</form>
</div>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>