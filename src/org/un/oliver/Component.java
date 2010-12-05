package org.un.oliver;

import java.util.Map;

import javax.servlet.ServletOutputStream;

public interface Component {

    String executeCommand(Map<String,String[]> parameterMap);

	void executePresenter(ServletOutputStream outputStream);
}
