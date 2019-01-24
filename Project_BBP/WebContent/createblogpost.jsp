<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 2){
	response.sendRedirect("login.jsp?prevUrl=projectapprove.jsp");
}
%>

	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="user.*"%>
<%@page import="project.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "javax.servlet.RequestDispatcher" %>

<!-- Custome style -->
	<link rel="stylesheet" type="text/css" href="style/cstyle.css" media="screen" />
<!-- Login style -->
	<link rel="stylesheet" type="text/css" href="style/login.css" media="screen" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="script/bootstrap.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Blogeintrag</title>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<div class="formular-bd w-75 mx-auto">
<h2>Blogeintrag erstellen</h2>
<form id="regForm" action = "CreateBlogProcess" method = "post"  enctype="multipart/form-data" role="form" data-toggle="validator" novalidate="true">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="title">Titel*</label>
      <input type="text" class="form-control" id="inputtitle" placeholder="Titel" required>
    </div>
    	
    
  <div class="form-group col-md-6" >
      <label for="inputCategory">Kategorie*</label>
      <select id="inputCategory" name="category" class="form-control" required data-error="Bitte wählen Sie eine Kategorie aus.">
        <option value="">Kategorie wählen...</option>
       		<option value="Wirtschaft und Finanzen">Wirtschaft und Finanzen</option>
			<option value="Bildung und Kultur" >Bildung und Kultur</option>
			<option value="Sicherheit">Sicherheit</option>
			<option value= "Sozial, Jugend und Gesundheit">Sozial, Jugend und Gesundheit</option>
			<option value="Bau und Infrastruktur">Bau und Infrastruktur</option>
			<option value="Events und Öffentlichkeitsarbeit">Events und Öffentlichkeitsarbeit</option>
			<option value="Sonstiges">Sonstiges</option>
      </select>
        <div class="help-block with-errors"></div>
 
    </div>
  </div>
  
  	

  <div class="form-group">
    <label for="exampleFormControlDescription">Inhalt*</label>
    <textarea class="form-control col-md-12" id="exampleFormControlDescription" name="description" rows="6" placeholder="Beschreibung (max. --- Zeichen)" required data-error="Bitte geben Sie eine Beschreibung ein." maxlength="800"></textarea>
    <div class="help-block with-errors"></div>
  </div>
  
  
  
  <label for="chooseFile">Foto hochladen</label><br>
  <div class="custom-file col-md-6" id="chooseFile">
  
  <input type="file" class="form-control custom-file-input" name="photo" id="loadFile" accept="image/x-png,image/gif,image/jpeg">
  <label for="loadFile" class="custom-file-label">Datei auswählen</label>
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
 
  <button type="submit" class="btn btn-primary">Erstellen</button>
</form>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>