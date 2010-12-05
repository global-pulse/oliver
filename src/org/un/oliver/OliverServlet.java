package org.un.oliver;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
public class OliverServlet extends HttpServlet {
    Router router = new DefaultRouter();

    public OliverServlet() {
        router.addRoute("/datasource/new", new DataSourceComponent());
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    	Component handler = router.findRoute(req.getRequestURI());
    	
    	handler.executePresenter(resp.getOutputStream());
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        Component handler = router.findRoute(req.getRequestURI());
        resp.sendRedirect(handler.executeCommand(req.getParameterMap()));
    }
}
