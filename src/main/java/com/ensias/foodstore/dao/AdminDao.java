package com.ensias.foodstore.dao;

import com.ensias.foodstore.dao.interfaces.AdminDaoInterface;
import com.ensias.foodstore.models.Commande;
import com.ensias.foodstore.models.Produit;
import com.ensias.foodstore.models.Review;
import com.ensias.foodstore.models.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class AdminDao implements AdminDaoInterface {

    /************************************ Orders Section ************************************/
    @Override
    public List<Commande> getAllOrders() {
        List<Commande> commandes = new ArrayList<Commande>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select c from Commande c order by c.createdAt desc");
            commandes = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        for(Commande commande:commandes)
            commande.setUser(FoodShopDao.getUserById(commande.getUser().getId()));

        return commandes;
    }

    /************************************ Users Section ************************************/
    @Override
    public List<User> getAllUserAccounts() {
        List<User> utilisateurs = new ArrayList<User>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select u from User u where u.id != 1");
            utilisateurs = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        return utilisateurs;
    }

    @Override
    public List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<Review>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select r from Review r order by r.updatedAt");
            reviews = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        for (Review review:reviews){
            review.setUser(FoodShopDao.getUserById(review.getUser().getId()));
            review.setProduit(FoodShopDao.getProduct(review.getProduit().getId()));
        }

        return reviews;
    }

    @Override
    public void updateProduct(Produit produit) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.update(produit);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void addNewProduct(Produit produit) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.save(produit);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void deleteProduct(Produit produit) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(produit);
        session.getTransaction().commit();
        session.close();
    }
}
