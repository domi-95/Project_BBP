<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
    
	<!-- Custom styles -->
	<link rel="stylesheet" type="text/css" href="style/signin.css" media="screen">
	

    <title>Registrieren</title>

  </head>

 <body class="text-center">
 
 <%@page import="database.*"%>
	<%@page import="user.*"%>
 
    <form method="post" class="form-signin">
      <h1 class="h3 mb-3 font-weight-normal">Registrieren</h1>
      <label for="inputFirstname" class="sr-only">Vorname</label>
      <input name="firstname" type="text" id="inputFirstname" class="form-control" placeholder="Vorname" required autofocus>
      <label for="inputLastname" class="sr-only">Nachname</label>
      <input name="lastname" type="text" id="inputLastname" class="form-control" placeholder="Nachname" required>
      <label for="inputEmail" class="sr-only">Email Adresse</label>
      <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email Adresse" required>
      <label for="inputPassword1" class="sr-only">Passwort</label>
      <input name="password1" type="password" id="inputPassword1" class="form-control" placeholder="Passwort" required>
      <label for="inputPassword2" class="sr-only">Passwort bestätigen</label>
      <input name="password2" type="password" id="inputPassword2" class="form-control" placeholder="Passwort bestätigen" required>
      
      <button class="btn btn-lg btn-secondary btn-block" type="submit">Registrieren</button>
    </form>

	<%
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (email != null && password != null) {

			// out.print(email + password);

			User u = Dao.login(email, password);

			if (u == null) {
				out.print("Sorry, invalid Email or Password ");
			}

			else {
				session.setAttribute("objekt", u);
				if (u.getRole().getId() == 1) {
					response.sendRedirect("welcome_buerger.jsp");
				}
				if (u.getRole().getId() == 2) {
					response.sendRedirect("welcome_verwaltung.jsp");
				}
				if (u.getRole().getId() == 3) {
					response.sendRedirect("welcome_gemeinderat.jsp");
				}
			}
		}
	%>

</body>
</html>