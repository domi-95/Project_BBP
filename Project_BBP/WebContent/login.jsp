<%
User u = (User)session.getAttribute("user"); 
if (u != null ){
	response.sendRedirect("index.jsp");
}
%>
 <%@page import="user.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Anmelden</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="style/util.css">
	<link rel="stylesheet" type="text/css" href="style/login.css">
	<link rel="stylesheet" type="text/css" href="style/cstyle.css">
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css">
<!--===============================================================================================-->
</head>
<body class="bg">
<jsp:include page="/include/header.jsp"></jsp:include>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 shadow rounded">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="Images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" method="post" action="login">
					<span class="login100-form-title">
						Anmeldung
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Gültige E-Mailadresse erforderlich: ex@abc.xyz">
						<input class="input100" type="text" name="email" placeholder="Benutzername / E-Mail" autofocus>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Passwort erforderlich">
						<input class="input100" type="password" name="password" placeholder="Passwort">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="text-center p-t-12">
					<div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Angemeldet bleiben
        </label>
      </div>
      <div class="invalidbox">
	<p class="invalid">${message}</p>
		</div>
	<input type="hidden" id="prevUrl2" name="prevUrl2" value="<%out.print(request.getParameter("prevUrl"));%>">
		<input type="hidden" id="prevUrl1" name="prevUrl1" value="">	
		</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Anmelden
						</button>
					</div>

					<div class="text-center p-t-12">
						
						<a class="txt2" href="#">
							Benutzername oder Passwort vergessen? 
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="register.jsp">
							Registrieren Sie sich jetzt
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
		<br>
	<br>
	<br>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
<!--===============================================================================================-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--===============================================================================================-->
	<script src="script/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="script/cscript.js"></script>

<!--===============================================================================================-->
<script>
var prevUrl = window.location.protocol + "//" + window.location.host + "/" + "Project_BBP" + "/" + document.getElementById("prevUrl").value
 alert(prevUrl);
 alert(document.getElementById("prevUrl").value);
 document.getElementById("prevUrl").value = prevUrl;
 alert(document.getElementById("prevUrl").value);
 </script>
</body>
</html>