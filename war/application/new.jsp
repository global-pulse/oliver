<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>

<H1>Please tell us about your application:</H1>
<form method="post" action="/app/datasource/new"><label>name:</label>
<input id="name" name="name" type="text"></input>(Do not use '%;:`) <BR>

<label>tags:</label> <input id="tags" name="tags" type="text"></input>(please
separate with commas) <BR>

<label>Github url:</label> <input id="githubaddress"
	name="githubaddress" type="text"></input> <BR>

<input id="submit" type="submit" name="submit"></input> <input
	id="cancel" type="submit" name="cancel" value="cancel"></input></form>

</body>
</html>



</html>