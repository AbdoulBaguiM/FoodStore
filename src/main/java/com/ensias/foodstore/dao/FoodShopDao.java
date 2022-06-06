package com.ensias.foodstore.dao;

import com.ensias.foodstore.models.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.time.Instant;
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
        Session session = HibernateUtil.getInstance().getSessionFactory().getCurrentSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("from Categorie where id = :id");
            query.setParameter("id",id);
            if(query.list().size()>0)
                categorie = (Categorie) query.list().get(0);
            session.getTransaction().commit();
        } finally {
            session.close();
        }

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
        for(Produit produit:produits){
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));
            if(produit.getPromotion() != null){
                produit.setPromotion(FoodShopDao.getPromotionById(produit.getPromotion().getId()));
                produit.setPrixPromo(produit.getPrixHt()-produit.getPrixHt()*produit.getPromotion().getPercentOff()/100);
            }

        }

        return produits;
    }

    // Get promotion by Id
    private static Promotion getPromotionById(Integer id) {
        Promotion promotion = new Promotion();
        Session session = HibernateUtil.getInstance().getSessionFactory().getCurrentSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("from Promotion where id = :id");
            query.setParameter("id",id);
            if(query.list().size()>0)
                promotion = (Promotion) query.list().get(0);
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        return promotion;
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

        for(Produit produit:nouveauxProduits){
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));
            if(produit.getPromotion() != null){
                produit.setPromotion(FoodShopDao.getPromotionById(produit.getPromotion().getId()));
                produit.setPrixPromo(produit.getPrixHt()-produit.getPrixHt()*produit.getPromotion().getPercentOff()/100);
            }
        }

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

        for(Produit produit:bestSales){
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));
            if(produit.getPromotion() != null){
                produit.setPromotion(FoodShopDao.getPromotionById(produit.getPromotion().getId()));
                produit.setPrixPromo(produit.getPrixHt()-produit.getPrixHt()*produit.getPromotion().getPercentOff()/100);
            }
        }

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

        for(Produit produit:searchresult){
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));
            if(produit.getPromotion() != null){
                produit.setPromotion(FoodShopDao.getPromotionById(produit.getPromotion().getId()));
                produit.setPrixPromo(produit.getPrixHt()-produit.getPrixHt()*produit.getPromotion().getPercentOff()/100);
            }
        }

        return searchresult;
    }

    // Get a product by id
    public static Produit getProduct(int id) {
        Produit produit = new Produit();
        Session session = HibernateUtil.getInstance().getSessionFactory().getCurrentSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("from Produit where id = :id");
            query.setParameter("id",id);
            if(query.list().size()>0)
                produit = (Produit) query.list().get(0);
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        produit.setCategorie(getCategory(produit.getCategorie().getId()));
        if(produit.getPromotion() != null){
            produit.setPromotion(FoodShopDao.getPromotionById(produit.getPromotion().getId()));
            produit.setPrixPromo(produit.getPrixHt()-produit.getPrixHt()*produit.getPromotion().getPercentOff()/100);
        }

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

        for(Produit produit:produits){
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));
            if(produit.getPromotion() != null){
                produit.setPromotion(FoodShopDao.getPromotionById(produit.getPromotion().getId()));
                produit.setPrixPromo(produit.getPrixHt()-produit.getPrixHt()*produit.getPromotion().getPercentOff()/100);
            }
        }

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
        for(Produit produit:produits){
            produit.setCategorie(FoodShopDao.getCategory(produit.getCategorie().getId()));
            if(produit.getPromotion() != null){
                produit.setPromotion(FoodShopDao.getPromotionById(produit.getPromotion().getId()));
                produit.setPrixPromo(produit.getPrixHt()-produit.getPrixHt()*produit.getPromotion().getPercentOff()/100);
            }
        }

        return produits;
    }

    public static String[] getCoveredCities() {
        String[] cities = {"Agadir","Casablanca","Fes","Kenitra","Meknes","Oujda","Rabat","Salé","Tanger"};
        return cities;
    }

    public static List<Review> getReviewsForProduct(int productId) {
        List<Review> reviews = new ArrayList<Review>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select r from Review r where r.produit.id = :idProduct");
            query.setParameter("idProduct",productId);
            reviews = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        for(Review review:reviews)
            review.setUser(FoodShopDao.getUserById(review.getUser().getId()));

        return reviews;
    }

    private static User getUserById(Long userId) {
        User user= new User();
        Session session = HibernateUtil.getInstance().getSessionFactory().getCurrentSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("from User where id = :id");
            query.setParameter("id",userId);
            if(query.list().size()>0)
                user = (User) query.list().get(0);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
        return user;
    }

    public static Review getReviewForProductByUser(Long userId, int productId) {
        List<Review> reviews = new ArrayList<Review>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select r from Review r where r.user.id = :userId and r.produit.id = :produitId");
            query.setParameter("userId",userId);
            query.setParameter("produitId",productId);
            reviews = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        Review review = new Review();
        if(reviews.size()>0) {
            review = reviews.get(0);
        } else {
            review.setProduit(FoodShopDao.getProduct(productId));
        }

        review.setUser(FoodShopDao.getUserById(userId));
        return review;
    }

    public static void saveOrUpdateReview(Review review) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        if(review.getCreatedAt() == null)
            review.setCreatedAt(Instant.now());

        try {
            session.beginTransaction();
            session.saveOrUpdate(review);
            session.getTransaction().commit();
        } catch (HibernateException he) {
            System.out.println("Error : " + he);
            he.printStackTrace();
        } finally {
            if (session.isOpen()){
                session.close();
            }
        }

    }

    public static void updateProductRating(Produit produit, Review review) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            session.update(produit);
            session.getTransaction().commit();
        } catch (HibernateException he) {
            System.out.println("Error : " + he);
            he.printStackTrace();
        } finally {
            if (session.isOpen()){
                session.close();
            }
        }

    }

    public static String getPromotionDateTime() {
        return "2022-07-30T12:00:00";
    }
}
