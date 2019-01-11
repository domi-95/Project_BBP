<%
User u = (User)session.getAttribute("user");

if (u == null || u.getRole().getId() != 1){
	response.sendRedirect("login.jsp");
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
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
<h2>Formular</h2>
	<form id="regForm" method="post" action="CreateProjectProcess"
		enctype="multipart/form-data">
		
		<label for="inputTitle" class="sr-only" >Titel</label>
      	<input name="title" type="text" id="inputTitle" class="form-control" maxlength="100" placeholder="Titel" required autofocus>
		<label for="selectCategory" class="sr-only">Kategorie</label>
		<select id="selectCategory" name="category" class="form-control" required>
			<option value="Wirtschaft und Finanzen" selected>Wirtschaft und Finanzen</option>
			<option value="Wirtschaft und Finanzen" >Bildung und Kultur</option>
			<option value="Sicherheit">Sicherheit</option>
			<option value= "Sozial, Jugend und Gesundheit">Sozial, Jugend und Gesundheit</option>
			<option value="Bau und Infrastruktur">Bau und Infrastruktur</option>
			<option value="Events und �ffentlichkeitsarbeit">Events und �ffentlichkeitsarbeit</option>
			<option value="Sonstiges">Sonstiges</option>
		</select>
		<label for="inputShortDescription" class="sr-only">Kurzbeschreibung</label>
      	<input name="shortDescription" type="text" id="inputShortDescription" maxlength="200" class="form-control" placeholder="Kurzbeschreibung" required>
		<label for="inputDescription" class="sr-only">Beschreibung</label>
		<textarea  name="description" id="inputDescription" maxlength="1000" class="form-control" cols="35" rows="4" placeholder="Beschreibung" required></textarea>
		<label for="inputLocation" class="sr-only">Ort</label>
      	<input name="location" type="text" id="inputLocation" class="form-control" placeholder="Ort">
		<label for="inputPeriod" class="sr-only">Zeitraum</label>
		<select id="inputPeriod" name="period" class="form-control" required>
			<option value="Choose Period" selected>Zeitraum ausw�hlen</option>
			<option value="Kurz">Kurz</option>
			<option value="Mittel">Mittel</option>
			<option value="Lang">Lang</option>
			<option value="Dauerhafte Ma�nahme">Dauerhafte Ma�nahme</option>
		</select>
		<label for="inputInvestmentGrade" class="sr-only">Investitionsgrad</label>     	
      	<select id="selectInvestmentGrade" name="investmentGrade" class="form-control" required>
			<option value="Choose Grade" selected>Investitionsgrad ausw�hlen</option>
			<option value="Gering">Gering</option>
			<option value="Mittel">Mittel</option>
			<option value="Hoch">Hoch</option>
			<option value="nicht absch�tzbar">nicht absch�tzbar</option>
		</select>
		<label for="inputPhoneNumber" class="sr-only">Telefonnummer</label>
      	<input name="phoneNumber" type="text" id="inputPhoneNumber" maxlength="20" class="form-control" placeholder="Telefonnummer">
		<label for="inputAnonymous" class="sr-only">Anonoym</label>
      	<input name="anonymous" type="checkbox" id="inputAnonymous"  placeholder="Anonym"> anonym
		<input type="file" name="photo" size="50" class="form-control" /><br />
		
		<button class="btn btn-lg btn-primary btn-block" type="submit">Absenden</button>
		<button class="btn btn-lg btn-secondary btn-block" type="reset">Formular zur�cksetzen</button>
		<input type="hidden" name="user" value= "<%if (u != null)out.print(u.getId()); %>" /><br />
	</form>
	
</body>
</html>