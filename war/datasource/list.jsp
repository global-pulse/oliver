<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="org.un.oliver.Repository" %>

<html>
  <body>

These are the data stores and feeds that we know about.If we've missed one, please <a href="/datasource/new.jsp">tell us about it</a>.

<table>
  <tr>
    <th>Name</th>
    <th>Available from...</th>
    <th>Tags</th>
  </tr>
  <%
    Repository repo = new Repository();
    List<Entity> datasources = repo.findAllDataSources();
    for (Entity datasource : datasources) {
      %>
      <tr>
        <td>
          <a href="/datasource/show.jsp?id=<%= datasource.getKey().getId() %>">
          <%= datasource.getProperty("name") %></a>
        </td>
        <td><%= datasource.getProperty("address") %></td>
        <td><%= datasource.getProperty("tags") %></td>
      </tr>
      <%
    }
  %>
</table>

  </body>
</html>