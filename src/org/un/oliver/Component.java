package org.un.oliver;

import java.util.Map;

public interface Component {

    String executeCommand(Map<String,String[]> parameterMap);
}
