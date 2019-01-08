<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message</title>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	<center>
		<div class="login">
			<center>
			<br/><br/>
				<h3 class="h3message"><%=request.getAttribute("Message")%></h3> <br/><br/>
			</center>
			<form action="index.jsp">
	<center>
	</center>
	</form>
		</div>
	</center>
	
</body>
</html>