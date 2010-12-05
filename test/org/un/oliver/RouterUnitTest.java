package org.un.oliver;

import org.junit.Test;

import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class RouterUnitTest {
    @Test
    public void routerMatchesSimplePaths() {
        Router router = new DefaultRouter();
        router.addRoute("/datasource/new", new DataSourceComponent());

        assertThat(router.findRoute("/datasource/new"), is(notNullValue()));
    }
}
