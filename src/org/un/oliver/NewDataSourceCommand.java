package org.un.oliver;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;

import java.util.Map;

public class NewDataSourceCommand implements Command {

    public String execute(Map parameterMap) {

        Entity dataSource = new Entity("DataSource");

        Repository repository = new Repository();
        for (Object key : parameterMap.keySet()) {
            String keyName = (String) key;

            dataSource.setProperty(keyName, parameterMap.get(key));
        }

        Key dataSourceKey = repository.store(dataSource);
        return "/datasource/" + dataSourceKey.toString();
    }

}
