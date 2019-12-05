package com.crowded.app;

import org.infinispan.client.hotrod.RemoteCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Cache {

    private final RemoteCache<String, Object> defaultCache;

    @Autowired
    public Cache(RemoteCache<String, Object> defaultCache) {
        this.defaultCache = defaultCache;
    }

    public void put(String key, Object value) {
        defaultCache.put(key, value);
    }

    public Object retrieve(String key, Object defaultValue) {
        return defaultCache.getOrDefault(key, defaultValue);
    }
}