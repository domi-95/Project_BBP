
<%@page import="java.sql.Blob"%>

<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>


<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose...">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>

</head>

<body>

	<%

byte[] img = null;

try

{

int id=Integer.parseInt(request.getParameter("id"));

Connection con=null;

con=DbConnection.connect();// jdbc Connection class

PreparedStatement pst=con.prepareStatement("select photo from empinfo where empid=?");

pst.setInt(1,id );

ResultSet rs=pst.executeQuery();

while (rs.next())

{

Blob image = rs.getBlob(1);

img = image.getBytes(1,(int)image.length());

}

response.setContentType("image/png");

ServletOutputStream o = response.getOutputStream()

o.flush();

o.write(img);

o.close();

rs.close();

pst.close();

con.close();

}

catch (Exception e)

{

System.out.println(e);

%>