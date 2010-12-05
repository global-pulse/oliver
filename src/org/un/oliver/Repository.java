package org.un.oliver;

import com.google.appengine.api.datastore.*;

public class Repository {
    private final DatastoreService datastoreService;

    public Repository() {
        this(DatastoreServiceFactory.getDatastoreService());
    }

    public Repository(DatastoreService datastoreService) {
        this.datastoreService = datastoreService;
    }

    public Key store(Entity entity) {
        Key result = datastoreService.put(entity);
        return result;
    }

    public Entity get(Key key) {
        try {
            return datastoreService.get(key);
        } catch (EntityNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
