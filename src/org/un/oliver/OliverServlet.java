package org.un.oliver;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.*;

@SuppressWarnings("serial")
public class OliverServlet extends HttpServlet {

    Map<String, Class<? extends Command>> routes = new HashMap<String, Class<? extends Command>>();

    public OliverServlet() {
        routes.put("/datasource/new", NewDataSourceCommand.class);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Class<? extends Command> handler = findHandler(req.getRequestURI());
        Command command;
        try {
            command = handler.newInstance();
            resp.sendRedirect(command.execute(req.getParameterMap()));
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }


    private Class<? extends Command> findHandler(String uri) {
        return routes.get(uri);
    }
}
