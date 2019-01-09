<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
function validate(form) {
    if (valid) {
    	const markup = <h3> Nachricht: ${message}</h3>;
    	document.body.innerHTML = markup;
        
    } else {
        return false;
    }
}

function test(){
	let div = document.createElement('div');
	div.className = "alert alert-success";
	div.innerHTML = "<strong>Hi there!</strong> You've read an important message.";
	document.body.appendChild(div);
	return document.body.appendChild(div);
}
        </script>
        
                
        <input type="button" value="Test" onclick="test();">

</body>
</html>