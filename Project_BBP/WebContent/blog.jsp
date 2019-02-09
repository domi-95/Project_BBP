<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@page import="blog.*"%>
<%@page import="user.*"%>
<%@page import="java.util.*"%>
 <!-- Custom styles -->
<link rel="stylesheet" type="text/css" href="style/cstyle.css" media="screen">
<!-- BLOG-Custom styles -->
<link rel="stylesheet" type="text/css" href="style/blog.css" media="screen">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
<title>Blog</title>
</head>
<body class="gradbg">
<jsp:include page="/include/header.jsp"></jsp:include>
<div class="content">
<div class="newsblog w-75">
	<!-- Section: Blog v.1 -->
	<section class="my-5"> <!-- Section heading -->
	<h2 class="h1-responsive font-weight-bold text-center my-5">Aktuelles in Mosbach
		</h2>
	<!-- Section description -->
	<p class="text-center w-responsive mx-auto mb-5">In diesem Blog haben Sie die Möglichkeit erfolgreiche Projekte einzusehen, um einen Einblick in die thematische Arbeit des Gemeinderats sowie die Funktionsweise des BBP zu erhalten. Diese Projekte wurden durch den Gemeinderat bereits genehmigt und in ersten Instanzen durchgeführt. </p>
	<%
	//set blogposts in a list
	List<Blog> result = Blog.getAll();
	int counter = 1;
	//Loop over blogpostlist
	for (Blog b : result){
			if (counter == 1){
			
			%>
		<!-- -------------------first blogpost------------------------- -->
	
	
	<div class="row">

		<!-- Grid column -->
		<div class="col-lg-5">

			<!-- Featured image -->
			<div class="view overlay rounded z-depth-2 mb-lg-0 mb-4">
				<img class="img-fluid"
					src="DisplayImageServlet?id=<%out.print(b.getId()); %>&select=3"
					alt="Sample image"> <a>
					<div class="mask rgba-white-slight"></div>
				</a>
			</div>

		</div>
		<!-- Grid column -->

		<!-- Grid column -->
		<div class="col-lg-7">

			<!-- Category -->
			<a href="#!" class="txt-green">
				<h6 class="font-weight-bold mb-3">
					<i class="fas fa-utensils pr-2"></i><%out.print(b.getCategory());%>
				</h6>
			</a>
			<!-- Post title -->
			<h3 class="font-weight-bold mb-3">
				<strong><%out.print(b.getTitle()); %></strong>
			</h3>
			<!-- Excerpt -->
			<p><%out.print(b.getContent());%></p>
			<!-- Post data -->
			<p>
			by <%if (b.getUser() != null){ %>	<a><strong><%out.print(b.getUser().getFirstname()+" "+ b.getUser().getname());%></strong></a>
	, <%out.print(b.getCreate());}%>
			</p>
			<!-- Read more button (commented out as long as not in use)-->
		<!-- 	<button class="btn btn-success ">weitere Informationen</button> -->

		</div>
		<!-- Grid column -->

	</div>


	<%
	//counts up number of blogposts
		counter++;
		continue;
	} %>
	
		<!-- -------------------uneven number of blogpost------------------------- -->
		<%
		if ((counter % 2 )== 0){
		
		%>
		
			
	<!-- Grid row second row-->

	<hr class="my-5">

	<!-- Grid row -->
	<div class="row">

		<!-- Grid column -->
		<div class="col-lg-7">

			<!-- Category -->
			<a href="#!" class="txt-green">
				<h6 class="font-weight-bold mb-3">
					<i class="fas fa-image pr-2"></i><%out.print(b.getCategory());%>
				</h6>
			</a>
			<!-- Post title -->
			<h3 class="font-weight-bold mb-3">
				<strong><%out.print(b.getTitle());%></strong>
			</h3>
			<!-- Excerpt -->
			<p><%out.print(b.getContent());%></p>
			<!-- Post data -->
			<p>
			by <%if (b.getUser() != null){ %>	<a><strong><%out.print(b.getUser().getFirstname()+" "+ b.getUser().getname());%></strong></a>
	, <%out.print(b.getCreate());}%>
			</p>
			<!-- Read more button (commented out as long as not in use)-->
		<!-- 	<button class="btn btn-success ">weitere Informationen</button> -->

		</div>
		<!-- Grid column -->

		<!-- Grid column -->
		<div class="col-lg-5">

			<!-- Featured image -->
			<div class="view overlay rounded z-depth-2">
				<img class="img-fluid"
					src="DisplayImageServlet?id=<%out.print(b.getId()); %>&select=3"> <a>
					<div class="mask rgba-white-slight"></div>
				</a>
			</div>

		</div>
		<!-- Grid column -->

	</div>
	
	<%
	
//counts up number of blogposts
	counter++;
	continue;
		} else{
		%>
		
	<!-- even blogpost---------------------------------------------------------------------------------------------->

	<hr class="my-5">

	<!-- Grid row -->
	<div class="row">

		<!-- Grid column -->
		<div class="col-lg-5">

			<!-- Featured image -->
			<div class="view overlay rounded z-depth-2 mb-lg-0 mb-4">
				<img class="img-fluid"
					src="DisplayImageServlet?id=<%out.print(b.getId()); %>&select=3"
					alt="Sample image"> <a>
					<div class="mask rgba-white-slight"></div>
				</a>
			</div>

		</div>
		<!-- Grid column -->

		<!-- Grid column -->
		<div class="col-lg-7">

			<!-- Category -->
			<a href="#!" class="txt-green">
				<h6 class="font-weight-bold mb-3">
					<i class="fas fa-suitcase pr-2"></i><%out.print(b.getCategory());%>
				</h6>
			</a>
			<!-- Post title -->
			<h3 class="font-weight-bold mb-3">
				<strong><%out.print(b.getTitle());%></strong>
			</h3>
			<!-- Excerpt -->
			<p><%out.print(b.getTitle());%></p>
			<!-- Post data -->
			<p>
			by <%if (b.getUser() != null){ %>	<a><strong><%out.print(b.getUser().getFirstname()+" "+ b.getUser().getname());%></strong></a>
	, <%out.print(b.getCreate());}%>
			</p>
			<!-- Read more button (commented out as long as not in use)-->
		<!-- 	<button class="btn btn-success ">weitere Informationen</button> -->

		</div>
		<!-- Grid column -->

	</div>
	
	<%
	//counts up number of blogposts
	counter++;
		} 
}
	%>
	
</section>
</div>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>

</html>