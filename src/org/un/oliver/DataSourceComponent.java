package org.un.oliver;

import java.util.Map;

public class DataSourceComponent implements Component {

    public String executeCommand(Map<String, String[]> parameterMap) {
        NewDataSourceCommand command = new NewDataSourceCommand();

        return command.execute(parameterMap);
    }
}
