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
	<link rel="stylesheet" type="text/css" href="../style/cstyle.css" media="screen" />
<title>Insert title here</title>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div class="formular-bd">
<h2>Projektantrag erstellen:</h2>

	<form id="regForm" method="post" action="CreateProjectProcess"
		enctype="multipart/form-data">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputTitel">Titel</label>
      <input class="form-control" id="inputTitel" placeholder="Titel (max. 40 Zeichen)">
    </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6" >
      <label for="inputCategory">Kategorie</label>
      <select id="inputCategory" class="form-control">
        <option selected>Kategorie wählen...</option>
       		<option value="Wirtschaft und Finanzen">Wirtschaft und Finanzen</option>
			<option value="Wirtschaft und Finanzen" >Bildung und Kultur</option>
			<option value="Sicherheit">Sicherheit</option>
			<option value= "Sozial, Jugend und Gesundheit">Sozial, Jugend und Gesundheit</option>
			<option value="Bau und Infrastruktur">Bau und Infrastruktur</option>
			<option value="Events und Öffentlichkeitsarbeit">Events und Öffentlichkeitsarbeit</option>
			<option value="Sonstiges">Sonstiges</option>
      </select>
    </div>
    </div>
  <div class="form-group">
    <label for="exampleFormControlShortdescription">Kurzbeschreibung</label>
    <textarea class="form-control col-md-6" id="exampleFormControlShortdescription" rows="4" placeholder="Kurzbeschreibung (max. 150 Zeichen)"></textarea>
  </div>
  <div class="form-group">
    <label for="exampleFormControlDescription">Beschreibung</label>
    <textarea class="form-control col-md-6" id="exampleFormControlDescription" rows="6" placeholder="Beschreibung (max. 350 Zeichen)"></textarea>
  </div>
 
    <div class="form-row">
    <div class="form-group col-md-3">
      <label for="inputCity">Ort</label>
      <input type="text" class="form-control" id="inputCity" placeholder="Bsp. (max. 20 Zeichen)">
    </div>
   </div>
    <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputPeriod">Dauer</label>
      <select id="inputPeriod" class="form-control">
      <option value="Choose Period" selected>Zeitraum auswählen</option>
        <option value="Kurz">Kurz</option>
			<option value="Mittel">Mittel</option>
			<option value="Lang">Lang</option>
			<option value="Dauerhafte Maßnahme">Dauerhafte Maßnahme</option>
      </select>
    </div>
     <div class="form-group col-md-4">
      <label for="inputGrade">Investitionsgrad</label>
      <select id="inputGrade" class="form-control">
        <option value="Choose Grade" selected>Investitionsgrad auswählen</option>
			<option value="Gering">Gering</option>
			<option value="Mittel">Mittel</option>
			<option value="Hoch">Hoch</option>
			<option value="nicht abschätzbar">nicht abschätzbar</option>
      </select>
    </div>
  </div> 

<div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputPhonenumber">Telefonnummer</label>
      <input type="text" class="form-control" id="inputPhonenumber" placeholder="Bsp. 01234/56789">
    </div>
  </div>

	<label for="chooseFile">Foto hochladen</label><br>
  <div class="custom-file col-md-4" id="chooseFile">
  
  <label for="loadFile" class="custom-file-label">Datei auswählen</label>
  <input type="file" class="form-control custom-file-input" name="photo" id="loadFile">
 

</div>
<br>
<br>

<div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="stayAnonym">
      <label class="form-check-label" for="stayAnonym">
        Anonym bleiben
      </label>
    </div>
  </div>

<div class="text-left">
  <button type="submit" class="btn btn-info col-md-3 " >Absenden</button>
  <button class="btn btn-secondary col-md-3" type="reset">Formular zurücksetzen</button>
		<input type="hidden" name="user" value= "<%if (u != null)out.print(u.getId()); %>" /><br />

</div>
</form>
</div>	
</body>
</html>