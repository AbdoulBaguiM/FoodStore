package com.ensias.foodstore.dao;

import com.ensias.foodstore.models.Categorie;
import com.ensias.foodstore.models.Produit;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class FoodShopDao {

    // Get all the categories
    public static List<Categorie> getAllCategories() {
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

    // Get Categorie by id
    public static Categorie getCategory(int id) {
        Categorie categorie = new Categorie();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        categorie = session.get(Categorie.class,id);

        return categorie;
    }

    // Get all the products
    public static List<Produit> getAllProducts() {
        List<Produit> produits = new ArrayList<Produit>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            produits = session.createQuery("from Produit").list();
            session.getTransaction().commit();
        } finally {
            session.close();
        }
        for(Produit produit:produits)
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));

        return produits;
    }

    // Get all featured products
    public static List<Produit> getAllFeaturedProducts() {
        List<Produit> nouveauxProduits = new ArrayList<Produit>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            nouveauxProduits = session.createQuery("from Produit where featured = true").list();

            session.getTransaction().commit();
        } finally {
            session.close();
        }

        for(Produit produit:nouveauxProduits)
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));

        return nouveauxProduits;
    }

    // Get all the best sales
    public static List<Produit> getBestSales() {
        List<Produit> bestSales = new ArrayList<Produit>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            bestSales = session.createQuery("select p from Produit as p, CommandeProduit as lc where p.id = lc.produit.id group by p.id order By SUM(lc.quantite) DESC").list();

            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        for(Produit produit:bestSales)
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));

        return bestSales;
    }

    // Search a product by name
    public static List<Produit> getProductsBySearch(String sqlQuery) {
        List<Produit> searchresult = new ArrayList<Produit>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            searchresult = session.createQuery(sqlQuery).list();

            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        for(Produit produit:searchresult)
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));

        return searchresult;
    }

    // Get a product by id
    public static Produit getProduct(int id) {
        Produit produit = new Produit();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        produit = session.get(Produit.class,id);

        return produit;
    }

    public static List<Produit> getRelatedProducts(int id) {
        List<Produit> produits = new ArrayList<Produit>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        int idCategorie = getProduct(id).getCategorie().getId();

        try {
            session.beginTransaction();
            Query query = session.createQuery("from Produit where categorie.id = :idCategorie and id != :idProduit");
            query.setParameter("idCategorie",idCategorie);
            query.setParameter("idProduit",id);
            produits = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }
        for(Produit produit:produits)
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));

        return produits;
    }

    public static List<Produit> getProductsByCategory(int id) {
        List<Produit> produits = new ArrayList<Produit>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select p from Produit p where p.categorie.id = :idCategorie");
            query.setParameter("idCategorie",id);
            produits = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }
        for(Produit produit:produits)
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));

        return produits;
    }

}
