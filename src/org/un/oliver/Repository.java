package org.un.oliver;

import java.util.ArrayList;
import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

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

	public Entity get(String kind, long id) {
		return get(KeyFactory.createKey(kind, id));
	}

	public Entity get(Key key) {
		try {
			return datastoreService.get(key);
		} catch (EntityNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

    public List<Entity> findAllDataSources() {
		List<Entity> entityList = new ArrayList();
		boolean moreEntitiesExist = true;
		int keyEntityId = 1;
		while (moreEntitiesExist) {
			Key key = KeyFactory.createKey("DataSource", keyEntityId);
			try {
				Entity entity = datastoreService.get(key);
				entityList.add(entity);
			} catch (EntityNotFoundException e) {
				moreEntitiesExist = false;
			}
			keyEntityId++;
		}
    	return entityList;
    }
    
    private PersistenceManager getPersistenceManager() {
    	return JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();
    }
}
