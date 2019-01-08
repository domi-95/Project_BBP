<%
User u = (User)session.getAttribute("user"); 
if (u == null || u.getRole().getId() != 3){
	response.sendRedirect("index.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="user.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>

<!--  
 <select id="selectElement" size="5"></select>
  <script type="text/javascript">
function neu()
{
  NewRow = document.getElementById('tab').lastChild.cloneNode(true);
  document.getElementById('tab').appendChild (NewRow);

  var i = document.getElementById('tab').childNodes.length - 1;

  for(j=0;j<document.getElementById('tab').lastChild.getElementsByTagName('input').length;j++)
  {
   var newname ='inhalt[' +i+ '][' +j+ ']';

   document.getElementById('tab').lastChild.getElementsByTagName('input')[j].setAttribute('name', newname) ;
  }

}

function check()
{
// ****** HIER ****** //
// Ich möchte erst mal, dass ich den Inhalt eines erzeugten Feldes angezeigt bekomme, das geht schon mal nicht
// Mit firstChild und lastChild geht es manchmal, wie erreiche ich die dazwischen?
alert(document.getElementById('tab').lastChild.getElementsByTagName('inhalt[3][1]'));
}

</script>
	
<form action="test.php" method="post">

<input name = "inhalt[0][1]" type = "text" ">


</form>
<input type="button" value=" Neue Position " onClick="neu()">

<script>
document.addEventListener('DOMContentLoaded', function () {
	var text1 = 'Auswahl';
	var text2 = 'Dies ist ein neuer Button!';	
	document.getElementById('button1')
		.addEventListener('click', function () {
			createElement('#textblock', 'input', text1);
		});
	document.getElementById('button2')
		.addEventListener('click', function () {
			createElement('#textblock', 'button', text2);
		});

	function createElement(parent, elem, content) {
		var container = document.querySelector(parent);
		var newElm = document.createElement(elem);
		newElm.innerText = content;
		container.appendChild(newElm);
	}
});


 
</script>
 -->
 <!--
 <script>
 function neu(){
		
	 	var container = document.querySelector('#textblock');
		var newElm = document.createElement('input');
		newElm.innerText = 'neue Abstimmungsoption';
		container.appendChild(newElm);
 }
 
 </script>

	
	<div id="textblock">
 <form action = "process()" method = "post">
 <input type = "text" value= "Erste Option">
 <input type = "text" value= "Zweite Option">
 


</form>
</div>
	<button id="button1" onClick="neu()" >Auswahl hinzufügen! </button>
<!--
<form action="test.php" method="post" name="form" id="form" onsubmit="return check();">

        <table width="447" border="0" cellspacing="0" cellpadding="0" id='tab'>
          <tr>
            <td width="61"><input name="inhalt[0][1]" type="text" size="7"></td>
            <td width="126"><input name="inhalt[0][2]" type="text"  size="20"></td>
            <td width="62"><input name="inhalt[0][3]" type="text" size="7"></td>
            <td width="64"><input name="inhalt[0][4]" type="text"size="7"></td>
            <td width="75"><input name="inhalt[0][5]" type="text"  size="7"></td>
            <td width="59"><div align="left">(l&ouml;schen)</div></td>
          </tr>
        </table>
</form>
<input type="button" value=" Neue Position " onClick="neu()">
-->

<script>
// Formularfelder dynamisch hinzufügen

var feld = 3;
var feldm = 3;

function feld_plus() {
 if (feld <= 10) {
  var inhalt = "Feld " + feld;
  document.getElementById('dynamic_input').innerHTML +=
  "<input type='text' name='n_" + feld + "' value='" + inhalt + "'required><br>";
  feld++;
 }
}

function feld_minus() {
 if (feld > feldm) {
 feld--;
  document.getElementById('dynamic_input').innerHTML = "";
  for (var zaehler = feldm; zaehler < feld; zaehler++) {
    var inhalt = "Feld " + zaehler;
    document.getElementById('dynamic_input').innerHTML +=
     "<input type='text' name='n_" + zaehler + "' value='" +
      inhalt + "'required><br>";
  }
 }
}
</script>
Felder hinzufügen <input type="button" value="-" onClick="feld_minus();">
<input type="button" value="+" onClick="feld_plus();"> <br><br>
<form action = "CreateOpinionPoll" method = "post"  enctype="multipart/form-data">
<input type= "text" name = "title" placeholder="Titel">
<input type= "text" name = "short_description"placeholder="Kurzbeschreibung">
<textarea  name="description" cols="35" rows="4" placeholder="Beschreibung"></textarea>
<input type= "date" name = "date_from"placeholder="Datum ab">
<input type= "date" name = "date_to"placeholder="Datum bis">
<!-- <input type= "hidden" name = "max_choice"placeholder="Maximal Antwortmöglichkeiten"> -->
<input type="file" name="photo" size="50" class="form-control" /><br />
<input type= "text" name = "n_1" value = "Feld 1"><br>
<input type= "text" name = "n_2" value = "Feld 2">
<div id="dynamic_input"></div>
<button type = "submit">Weitergabe</button>
<input type="hidden" name="user" value= "<%if (u != null)out.print(u.getId()); %>" />
</form>
</body>
</html>