<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 <!-- Bootstrap style -->
	<link rel="stylesheet" type="text/css" href="style/bootstrap.min.css" media="screen" />
<title>Index BBP</title>
</head>
<body class="bg">
<style>
#footer {
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 2.5rem;            /* Footer height */
}
</style>

<jsp:include page="/include/header.jsp"></jsp:include>
<div class="spaceholder d-flex justify-content-center">

<jsp:include page="/include/carousel.jsp"></jsp:include></div><br>
<div class="container text-center">    
  <h3>Projektübersicht</h3><br>
  <div class="row">
    <div class="col-sm-3 bordershadow" style="margin: auto">
      <img src="https://getuikit.com/v2/docs/images/placeholder_600x400.svg" class="img-responsive" style="width:100%" alt="Image">
      <p>Projekt 1</p>
    </div>
    <div class="col-sm-3 bordershadow" style="margin: auto"> 
      <img src="https://getuikit.com/v2/docs/images/placeholder_600x400.svg" class="img-responsive" style="width:100%" alt="Image">
      <p>Projekt 2</p>    
    </div>
    <div class="col-sm-3 bordershadow" style="margin: auto"> 
      <img src="https://getuikit.com/v2/docs/images/placeholder_600x400.svg" class="img-responsive" style="width:100%" alt="Image">
      <p>Projekt 3</p>    
    </div>
  </div>
</div><br>
<div>
 <jsp:include page="/include/footer.jsp"></jsp:include>
 </div>
</body>
</html>