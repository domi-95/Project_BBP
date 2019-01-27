<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Abmeldung</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body class="bg">
<jsp:include page="include/header.jsp"></jsp:include>
<%
session.invalidate();
%>
	
		<div class="pt-3 formular-bd opindex text-center w-50 m-auto">
			
			<br>
				<h3 class="h3message">Sie wurden erfolgreich abgemeldet</h3> <br/><br/>
				<h5 class="h3message">Sie werden in 3 Sekunden zur Startseite weitergeleitet</h5> <br/><br/>
				<p>Sollten Sie nicht weitergeleitet werden, bitte <a href="index.jsp">hier</a> klicken</p>
			
	<script>
  setTimeout(function() {
      document.location = "index.jsp";
  }, 3000); // <-- this is the delay in milliseconds
</script>
		</div>
	
	
	
<br>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>