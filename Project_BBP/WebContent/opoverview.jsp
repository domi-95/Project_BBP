<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="user.*"%>
    <%@page import="opinionPoll.*"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


  
  <input type="radio" name="gender" value="female"> Female<br>
  <input type="radio" name="gender" value="other"> Other<br>  
  <input type="submit" value="Submit">
</form>
<%
List<OpinionPoll> oplist= OpinionPoll.getAll(1);
for ( OpinionPoll op: oplist){
	%><form><fieldset><br/>
	Titel: <%out.print(op.getTitle()); %><br/><%
	%>Beschreibung: <%out.print(op.getShort_description()); %><br/><%
	%>Ersteller: <% out.print(op.getCreator().getFirstname()+" "+op.getCreator().getname()); %><br/>
	
	<%
	//List<String> header = new LinkedList<String>();
	List<String> header = op.getHeader();
	for(int i = 0; i<header.size() && header.get(i)!=null; i++){
		%><input type="radio" name="gender" value="male"><%out.print(header.get(i)); %> <br><%
		i++;
		
	}
	%></fieldset></form><%
}
%>
</body>
</html>