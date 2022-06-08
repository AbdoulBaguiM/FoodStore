package com.ensias.foodstore.dao;

import com.ensias.foodstore.dao.interfaces.CategorieDaoInterface;
import com.ensias.foodstore.models.Categorie;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class CategorieDao implements CategorieDaoInterface {

    @Override
    public List<Categorie> getAllCategories() {
        List<Categorie> categories = new ArrayList<Categorie>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            categories = session.createQuery("from Categorie").list();
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        for(Categorie categorie:categories)
            categorie.setProduits(FoodShopDao.getProductsByCategory(categorie.getId()));

        return categories;
    }

    @Override
    public Categorie getCategorieById(int categorieId) {
        Categorie categorie = new Categorie();
        Session session = HibernateUtil.getInstance().getSessionFactory().getCurrentSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("from Categorie where id = :id");
            query.setParameter("id",categorieId);
            if(query.list().size()>0)
                categorie = (Categorie) query.list().get(0);
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        return categorie;
    }

    @Override
    public void addCategorie(Categorie categorie) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.save(categorie);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void updateCategorie(Categorie categorie) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.update(categorie);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void deleteCategorie(Categorie categorie) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(categorie);
        session.getTransaction().commit();
        session.close();
    }


}
