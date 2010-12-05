<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="org.un.oliver.*"%>
<%@ page import="com.google.appengine.api.datastore.*;"%>
<html>
<body>

<%
	Repository repository = new Repository();

	Entity dataSource = repository.get("DataSource",
			Integer.parseInt((String) request.getParameter("id")));
%>

<h1><%=dataSource.getProperty("name")%></h1>

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