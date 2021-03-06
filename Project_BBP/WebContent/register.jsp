<%
User u = null;
if((User)session.getAttribute("user") != null){
	u = (User)session.getAttribute("user"); 
}

	String message = (String)request.getAttribute("message");


%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrierung</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="style/util.css">
	<link rel="stylesheet" type="text/css" href="style/login.css">
<!--===============================================================================================-->
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="style/animate.css" media="screen" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@page import="user.*"%>
</head>
<body class="bg">
<jsp:include page="/include/header.jsp"></jsp:include>
<div class="content">
<div id="snackbar_message"></div>
 <%@page import="database.*"%>
	<%@page import="user.*"%>
	<div class="limiter">
		<div class="container-login100" >
			<div class="wrap-login100 shadow rounded" style="padding-top: 2%;">
				<div class="login100-pic js-tilt text-center" data-tilt style="margin-top:10%;">
					<img src="Images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" method="post" action = "register" >
					<span class="login100-form-title">
						Registrierung
					</span>
					<%if(u != null && u.getRole().getId() == 2){ %>
					<div class="wrap-input100 validate-input " data-validate = "Benutzerkategorie erforderlich">
				      <select name="usercategory" class="input100 rounded" required>
				        <option value="" disabled selected hidden >Benutzer w�hlen...</option>
				       		<option value="1">B�rger</option>
							<option value="2" >Verwaltungsmitarbeiter</option>
							<option value="3">Gemeinderatsmitglied</option>
				      </select>
				      <span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-bookmark" aria-hidden="true"></i>
						</span>
				      </div>
					<%} %>
					<div class="wrap-input100 validate-input " data-validate = "Vorname erforderlich">
						<input class="input100 rounded" type="text" name="firstname" placeholder="Vorname" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>
			
				
					<div class="wrap-input100 validate-input " data-validate = "Nachname erforderlich" required>
						<input class="input100 rounded" type="text" name="name" placeholder="Nachname">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>
		
					
					<div class="wrap-input100 validate-input " data-validate = "G�ltige E-Mailadresse erforderlich: ex@abc.xyz">
						<input class="input100 rounded" type="text" name="email" placeholder="E-Mailadresse" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input " data-validate = "Passwort erforderlich">
						<input class="input100 rounded" type="password" name="password1" placeholder="Passwort" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input " data-validate = "Passwort erforderlich">
						<input class="input100 rounded" type="password" name="password2" placeholder="Passwort verifizieren" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="text-center p-t-12">
					<div class="checkbox mb-3">
						<label>
				          <input type="checkbox" value="accept-termsofuse" required><a href="termsofuse.jsp" target="_blank">&nbsp;Nutzungsbedingungen</a> akzeptieren
				        </label>
					</div>
					<div class="invalidbox">
					<p class="invalid"><%if(message!=null){out.print(message);} %></p>
						</div>
						<!-- shows message if anything went wrong with registration -->
						<%if(request.getAttribute("Message") != null){ %>
      				<input type="hidden" class="Message" name="Message" value= "<% out.print(request.getAttribute("Message")); %>" />
      					<script type="text/javascript">
      					$('document').ready(function(){
      						var message = $(".Message").val();
      						
      						smessage(message);
      					});
      					
      					</script>
      				<%} %>
      				</div>
						<div class="container-login100-form-btn">
						<button class="login100-form-btn rounded">
							Registrieren
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<br>
	</div>
	
	<jsp:include page="/include/footer.jsp"></jsp:include>
	

	
<!--===============================================================================================-->

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
</body>
</html>