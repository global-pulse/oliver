package org.un.oliver;

import java.util.Map;

import javax.servlet.ServletOutputStream;

import org.antlr.stringtemplate.StringTemplate;

public class DataSourceComponent implements Component {

    public String executeCommand(Map<String, String[]> parameterMap) {
        NewDataSourceCommand command = new NewDataSourceCommand();

        return command.execute(parameterMap);
    }

	public void executePresenter(ServletOutputStream outputStream) {
		new StringTemplate("new-datasource.st");
	}
}
