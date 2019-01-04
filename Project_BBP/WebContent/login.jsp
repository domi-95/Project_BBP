<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%@page import="database.*"%>
	<%@page import="user.*"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
    
	<!-- Custom styles -->
	<link rel="stylesheet" type="text/css" href="style/signin.css" media="screen">
	

    <title>Login</title>

  </head>

 <body>
 <jsp:include page="header.jsp"></jsp:include> 
<div class="text-center">
 <div class="flexlog">
    <form method="post" class="form-signin" action="login">
      <h1 class="h3 mb-3 font-weight-normal">Anmelden</h1>
      <label for="inputEmail" class="sr-only">Email Adresse</label>
      <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email Adresse" required autofocus>
      <label for="inputPassword" class="sr-only">Passwort</label>
      <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Passwort" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Angemeldet bleiben
        </label>
      </div>
      <div class="invalidbox">
	<p class="invalid">${message}</p>
		</div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Anmelden</button>
      <a class="btn btn-lg btn-secondary btn-block" href="register.jsp">Registrieren</a>	
    </form>
	
	<%/*
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (email != null && password != null) {

			// out.print(email + password);

			User u = User.getUserLogin(email, password);

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
					response.sendRedirect("DisplayProjectAll");
				}
			}
		}*/
	%>
	</div>
</div>
</body>
</html>