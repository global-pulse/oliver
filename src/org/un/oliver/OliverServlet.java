package org.un.oliver;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
public class OliverServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        Entity dataSource = new Entity("DataSource");

        Repository repository = new Repository();
        Map parameterMap = req.getParameterMap();
        
		for (Object key : parameterMap.keySet()) {
            String keyName = (String) key;

            dataSource.setProperty(keyName, req.getParameter(keyName));
        }

        Key dataSourceKey = repository.store(dataSource);
        resp.sendRedirect("/datasource/show?id="+dataSourceKey.getId());
    }
}
