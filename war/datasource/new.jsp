<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<html>
  <body>

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>
<p>Hello, <%= user.getNickname() %>! (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
    } else {
%>
<p>Hello!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
to include your name with greetings you post.</p>
<%
    }
%>

<H1>Please tell us about your data source or feed:</H1>
<form method="post" action="/app/datasource/new">

<label>name:</label>
<input id="name" name="name" type="text"></input>(Do not use '%;:`)
<BR>

<label>tags:</label>
<input id="tags" name="tags" type="text"></input>(please separate with commas)
<BR>

<label>address:</label>
<input id="address"  name="address" type="text"></input>
<BR>

<input id="submit" type="submit" name="submit"></input>
<input id="cancel" type="submit" name="cancel"  value="cancel"></input>
</form>

  </body>
</html>