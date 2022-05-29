package com.ensias.foodstore.dao;

import org.hibernate.*;
import org.hibernate.cfg.*;

public class HibernateUtil {

    private static HibernateUtil instance = new HibernateUtil();
    private SessionFactory sessionFactory;

    private HibernateUtil(){
        this.sessionFactory = buildSessionFactory();
    }

    private synchronized static SessionFactory buildSessionFactory() {
        return new Configuration().configure().buildSessionFactory();
    }

    public static HibernateUtil getInstance() {
        if(instance == null){
            return new HibernateUtil();
        }
        return instance;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

}