package com.crowded.app;

import org.infinispan.client.hotrod.RemoteCacheManager;
import org.infinispan.commons.configuration.BasicConfiguration;
import org.springframework.boot.SpringApplication;

import java.util.Scanner;

public class App {

    public static void main(String args[]) {
        SpringApplication.run(App.class, args);
        Cache cache = new Cache(new RemoteCacheManager().administration().getOrCreateCache("default", (BasicConfiguration) null));
        Scanner s = new Scanner(System.in);
        System.out.println("Enter your first name");
        cache.put("firstName", s.nextLine());
        System.out.println("Enter your last name");
        cache.put("lastName", s.nextLine());
        System.out.println("FirstName: "+cache.retrieve("firstName", "").toString());
        System.out.println("LastName: "+cache.retrieve("lastName", "").toString());
    }

}