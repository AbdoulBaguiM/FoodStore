package com.ensias.foodstore.dao;

import com.ensias.foodstore.dao.interfaces.ReviewDaoInterface;
import com.ensias.foodstore.models.Review;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao implements ReviewDaoInterface {
    @Override
    public List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<Review>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("from Review");
            reviews = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        for(Review review:reviews){
            review.setProduit(FoodShopDao.getProduct(review.getProduit().getId()));
            review.setUser(FoodShopDao.getUserById(review.getUser().getId()));
        }

        return reviews;
    }

    @Override
    public List<Review> getReviewsForProduct(int productId) {
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

    @Override
    public Review getReviewForProductByUser(Long userId, int productId) {
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

    @Override
    public Review getReviewById(Long reviewId) {
        Review review = new Review();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select r from Review r where r.id = :idReview");
            query.setParameter("idReview",reviewId);
            if(query.list().size()>0)
                review = (Review) query.list().get(0);
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        review.setUser(FoodShopDao.getUserById(review.getUser().getId()));
        review.setProduit(FoodShopDao.getProduct(review.getProduit().getId()));

        return review;
    }

    @Override
    public void saveOrUpdateReview(Review review) {
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

}
