<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 1){
	response.sendRedirect("index.jsp");
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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<h2>Formular</h2>
	<form id="regForm" method="post" action="CreateProjectProcess"
		enctype="multipart/form-data">
		
		<label for="inputTitle" class="sr-only">Titel</label>
      	<input name="title" type="text" id="inputTitle" class="form-control" placeholder="Titel" required autofocus>
		<label for="selectCategory" class="sr-only">Kategorie</label>
		<select id="selectCategory" name="category" class="form-control" required>
			<option value="Wirtschaft und Finanzen" selected>Wirtschaft und Finanzen</option>
			<option value="Wirtschaft und Finanzen" >Bildung und Kultur</option>
			<option value="Sicherheit">Sicherheit</option>
			<option value= "Sozial, Jugend und Gesundheit">Sozial, Jugend und Gesundheit</option>
			<option value="Bau und Infrastruktur">Bau und Infrastruktur</option>
			<option value="Events und Öffentlichkeitsarbeit">Events und Öffentlichkeitsarbeit</option>
			<option value="Sonstiges">Sonstiges</option>
		</select>
		<label for="inputShortDescription" class="sr-only">Kurzbeschreibung</label>
      	<input name="shortDescription" type="text" id="inputShortDescription" class="form-control" placeholder="Kurzbeschreibung" required>
		<label for="inputDescription" class="sr-only">Beschreibung</label>
      	<input name="description" type="text" id="inputDescription" class="form-control" placeholder="Beschreibung">
		<label for="inputLocation" class="sr-only">Ort</label>
      	<input name="location" type="text" id="inputLocation" class="form-control" placeholder="Ort">
		<label for="inputPeriod" class="sr-only">Zeitraum</label>
		<select id="inputPeriod" name="period" class="form-control" required>
			<option value="Choose Period" selected>Zeitraum auswählen</option>
			<option value="Kurz">Kurz</option>
			<option value="Mittel">Mittel</option>
			<option value="Lang">Lang</option>
			<option value="Dauerhafte Maßnahme">Dauerhafte Maßnahme</option>
		</select>
		<label for="inputInvestmentGrade" class="sr-only">Investitionsgrad</label>     	
      	<select id="selectInvestmentGrade" name="investmentGrade" class="form-control" required>
			<option value="Choose Grade" selected>Investitionsgrad auswählen</option>
			<option value="Gering">Gering</option>
			<option value="Mittel">Mittel</option>
			<option value="Hoch">Hoch</option>
			<option value="nicht abschätzbar">nicht abschätzbar</option>
		</select>
		<label for="inputPhoneNumber" class="sr-only">Telefonnummer</label>
      	<input name="phoneNumber" type="text" id="inputPhoneNumber" class="form-control" placeholder="Telefonnummer">
		<label for="inputAnonymous" class="sr-only">Anonoym</label>
      	<input name="anonymous" type="checkbox" id="inputAnonymous"  placeholder="Anonym"> anonym
		<input type="file" name="photo" size="50" class="form-control" /><br />
		
		<button class="btn btn-lg btn-primary btn-block" type="submit">Absenden</button>
		<button class="btn btn-lg btn-secondary btn-block" type="reset">Formular zurücksetzen</button>
		<input type="hidden" name="user" value= "<%if (u != null)out.print(u.getId()); %>" /><br />
	</form>
	
</body>
</html>