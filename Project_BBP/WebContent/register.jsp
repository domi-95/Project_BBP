<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="style/util.css">
	<link rel="stylesheet" type="text/css" href="style/login.css">
<!--===============================================================================================-->
</head>
<body class="bg">
<jsp:include page="/include/header.jsp"></jsp:include>
 <%@page import="database.*"%>
	<%@page import="user.*"%>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 shadow rounded" style="padding-top: 2%;">
				<div class="login100-pic js-tilt text-center" data-tilt style="margin-top:10%;">
					<img src="Images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" method="post" >
					<span class="login100-form-title">
						Registrierung
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Vorname erforderlich">
						<input class="input100" type="text" name="firstname" placeholder="Vorname">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>
			
				
					<div class="wrap-input100 validate-input" data-validate = "Nachname erforderlich">
						<input class="input100" type="text" name="name" placeholder="Nachname">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>
		
					
					<div class="wrap-input100 validate-input" data-validate = "Gültige E-Mailadresse erforderlich: ex@abc.xyz">
						<input class="input100" type="text" name="email" placeholder="E-Mailadresse">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Passwort erforderlich">
						<input class="input100" type="password" name="password1" placeholder="Passwort">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Passwort erforderlich">
						<input class="input100" type="password" name="password2" placeholder="Passwort verifizieren">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					
      
						<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Registrieren
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	
<%
		String firstname = request.getParameter("firstname");
		String name = request.getParameter("name");
    		String email = request.getParameter("email");
    		String password1 = request.getParameter("password1");
    		String password2 = request.getParameter("password2");
    		int role_id = 1;
    		//out.print(email + password1);
    		
    		//Check if all fields are filled
		if (firstname != null && name != null && email != null && password1 != null && password2 != null) {

			//out.print(firstname + email + password1);
			
			User u = UserDao.searchUser(email);
			//Check if user exists
			if(u != null){
				if(email == u.getEmail()){
					out.print("Es gibt bereits einen Account mit der gleichen E-Mail Adresse");
				}
			}
			else{
				//Check if passwords match
				if(!password1.equals(password2) ){
					out.print("Passwörter stimmen nicht überein" + password1 + password2);
				}
				//Safe User and forward to Dashboard
				else {
					UserDao.safeUser(email, name, firstname, password1, role_id);
					User n = UserDao.searchUser(email);
					session.setAttribute("objekt", n);
						if (n.getRole().getId() == 1) {
							response.sendRedirect("index.jsp");
						}
						if (n.getRole().getId() == 2) {
							response.sendRedirect("index.jsp");
						}
						if (n.getRole().getId() == 3) {
							response.sendRedirect("index.jsp");
						}
					}
				}
		}
    		
	%>
	
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

</body>
</html>