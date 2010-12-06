<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="org.un.oliver.*"%>
<%@ page import="com.google.appengine.api.datastore.*;"%>

<%
	Repository repository = new Repository();

	Entity dataSource = repository.get("DataSource",
			Integer.parseInt((String) request.getParameter("id")));
%>

<html>
<head>
<title>Gobal Pulse Application "<%=dataSource.getProperty("name")%>"
</title>
</head>
<body>


<h1>Application <%=dataSource.getProperty("name")%></h1>

<table>
	<%
		for (Object key : dataSource.getProperties().keySet()) {
	%>
	<tr>
		<td><%=key.toString()%></td>
		<td><%=dataSource.getProperty(key.toString())%></td>
	</tr>
	<%
		}
	%>
</table>

</body>
</html>