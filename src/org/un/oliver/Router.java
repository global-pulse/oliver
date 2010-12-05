package org.un.oliver;

public interface Router {
    Component findRoute(String string);

    void addRoute(String string, Component component);

}
