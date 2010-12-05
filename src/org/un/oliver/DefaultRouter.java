package org.un.oliver;

import java.util.HashMap;
import java.util.Map;

public class DefaultRouter implements Router {
    Map<String, Component> componentMap = new HashMap<String, Component>();

    public Component findRoute(String routePath) {
        return componentMap.get(routePath);
    }

    public void addRoute(String path, Component component) {
        componentMap.put(path, component);
    }
}
