<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <meta charset="utf-8">
    <meta firstname="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
    
	<!-- Custom styles -->
	<link rel="stylesheet" type="text/css" href="style/signin.css" media="screen">
	

    <title>Registrieren</title>

  </head>

 <body class="text-center">
 <jsp:include page="/include/header.jsp"></jsp:include>
 <%@page import="database.*"%>
	<%@page import="user.*"%>
 
    <form method="post" class="form-signin">
      <h1 class="h3 mb-3 font-weight-normal">Registrieren</h1>
      <label for="inputfirstname" class="sr-only">Vorname</label>
      <input name="firstname" type="text" id="inputfirstname" class="form-control" placeholder="Vorname" required autofocus>
      <label for="inputname" class="sr-only">Nachname</label>
      <input name="name" type="text" id="inputname" class="form-control" placeholder="Nachname" required>
      <label for="inputEmail" class="sr-only">Email Adresse</label>
      <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email Adresse" required>
      <label for="inputPassword1" class="sr-only">Passwort</label>
      <input name="password1" type="password" id="inputPassword1" class="form-control" placeholder="Passwort" required>
      <label for="inputPassword2" class="sr-only">Passwort bestätigen</label>
      <input name="password2" type="password" id="inputPassword2" class="form-control" placeholder="Passwort wiederholen" required>
      
      <button class="btn btn-lg btn-secondary btn-block" type="submit">Registrieren</button>
    </form>

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

</body>
</html>