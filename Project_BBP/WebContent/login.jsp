<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />

    <!-- Custom styles for this template -->
    <link href="style/signin.css" rel="stylesheet">
    <title>Login</title>

  </head>






 <body class="text-center">
    <form method="post" class="form-signin">
      <h1 class="h3 mb-3 font-weight-normal">Anmelden</h1>
      <label for="inputEmail" class="sr-only">Email Adresse</label>
      <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email Adresse" required autofocus>
      <label for="inputPassword" class="sr-only">Passwort</label>
      <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Passwort" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Angemeldet bleiben
        </label>
      </div>"
      <button class="btn btn-lg btn-primary btn-block" type="submit" name="OnInputProcessing">Anmelden</button>
    </form>
  </body>
</html>