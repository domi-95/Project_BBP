<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Benachrichtigung</title>
</head>
<body class="bg">
<jsp:include page="include/header.jsp"></jsp:include>
	
		<div class="pt-3 formular-bd opindex text-center w-50 m-auto">
			
				<h3 class="h3message"><%=request.getAttribute("Message")%></h3> <br/><br/>
				<h5 class="h3message">Sie werden in 3 Sekunden zur Startseite weitergeleitet</h5> <br/><br/>
				<p>Sollten Sie nicht weitergeleitet werden, bitte <a href="index.jsp">hier</a> klicken</p>
			
			
	
	
	
	<script>
  setTimeout(function() {
      document.location = "index.jsp";
  }, 3000); // <-- this is the delay in milliseconds
</script>
		</div>
	
	<br>
<br>
<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>