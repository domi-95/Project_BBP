<%
User u = (User)session.getAttribute("user"); 
if (u == null){
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
	<form id="regForm" method="post" action="CreateRequestProcess"
		enctype="multipart/form-data">
		
		<label for="inputTitle" class="sr-only">Titel</label>
      	<input name="title" type="text" id="inputTitle" class="form-control" placeholder="Titel" required autofocus>
		<label for="selectCategory" class="sr-only">Kategorie</label>
		<select id="selectCategory" name="category" class="form-control" required>
			<option value="Choose Category" selected>Kategorie ausw�hlen</option>
			<option value="First Category">Erste Kategorie</option>
			<option value="Second Category">Zweite Kategorie</option>
			<option value="Third Category">Dritte Kategorie</option>
		</select>
		<label for="inputShortDescription" class="sr-only">Kurzbeschreibung</label>
      	<input name="shortDescription" type="text" id="inputShortDescription" class="form-control" placeholder="Kurzbeschreibung" required>
		<label for="inputDescription" class="sr-only">Beschreibung</label>
      	<input name="description" type="text" id="inputDescription" class="form-control" placeholder="Beschreibung">
		<label for="inputLocation" class="sr-only">Ort</label>
      	<input name="location" type="text" id="inputLocation" class="form-control" placeholder="Ort">
		<label for="inputPeriod" class="sr-only">Zeitraum</label>
      	<input name="period" type="number" min="1" max="99" id="inputPeriod" class="form-control" placeholder="Zeitraum">
		<label for="inputInvestmentGrade" class="sr-only">Investitionsgrad</label>     	
      	<select id="selectInvestmentGrade" name="investmentGrade" class="form-control" required>
			<option value="Choose Grade" selected>Investitionsgrad ausw�hlen</option>
			<option value="Grad1">Erster Grad</option>
			<option value="Grad2">Zweiter Grad</option>
			<option value="Grad3">Dritter Grad</option>
		</select>
		<label for="inputPhoneNumber" class="sr-only">Telefonnummer</label>
      	<input name="phoneNumber" type="text" id="inputPhoneNumber" class="form-control" placeholder="Telefonnummer">
		<label for="inputAnonymous" class="sr-only">Anonoym</label>
      	<input name="anonymous" type="checkbox" id="inputAnonymous"  placeholder="Anonym"> anonym
		<input type="file" name="photo" size="50" class="form-control" /><br />
		
		<button class="btn btn-lg btn-primary btn-block" type="submit">Absenden</button>
		<button class="btn btn-lg btn-secondary btn-block" type="reset">Formular zur�cksetzen</button>
		<input type="hidden" name="user" value= "<%if (u != null)out.print(u.getId()); %>" /><br />
	</form>
	<% out.print(u);%>
</body>
</html>