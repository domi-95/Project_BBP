<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="user.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="style/cstyle.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="style/login.css" media="screen" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="script/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
	<script src="script/cscript.js"></script>
<title>Kontakt</title>
</head>
<body class="bg ">
<jsp:include page="include/header.jsp"></jsp:include>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div class="w-75 m-auto ">
	

                    <form action="mail.php" method="post" class="mx-auto w-50">
                        <div class="card border-secondary rounded mb-auto">
                            <div class="card-header p-0">
                                <div class="text-center py-2 bg-light text-secondary">
								    <h2>Kontaktformular</h2>
                                    <h3 ><i class="fa fa-envelope "></i> Stadt Mosbach</h3>
                                    <h6 >Wir bemühen uns um Ihre Anfrage!</h6>
                                </div>
                            </div>
                            <div class="card-body p-3 bg-light">
                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-user fa-lg text-success"></i></div>
                                        </div>
                                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Name" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-envelope text-success"></i></div>
                                        </div>
                                        <input type="email" class="form-control" id="nombre" name="email" placeholder="Email" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-comment text-success"></i></div>
                                        </div>
                                        <textarea class="form-control"  rows="4"placeholder="Ihre Nachricht" required></textarea>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <input type="submit" value="Absenden" class="btn btn-success btn-block rounded py-2">
                                </div>
                            </div>
                        </div>
                    </form>

</div>

<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>