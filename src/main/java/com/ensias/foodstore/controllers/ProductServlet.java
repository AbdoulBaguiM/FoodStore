package com.ensias.foodstore.controllers;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.models.Produit;
import com.ensias.foodstore.models.Review;
import com.ensias.foodstore.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.time.Instant;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/produit")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("id"));

        request.setAttribute("categories", FoodShopDao.getAllCategories());
        request.setAttribute("produit",FoodShopDao.getProduct(productId));
        request.setAttribute("reviews",FoodShopDao.getReviewsForProduct(productId));
        request.setAttribute("relatedProducts", FoodShopDao.getRelatedProducts(productId));

        this.getServletContext().getRequestDispatcher("/views/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("utilisateur");

        if(user != null) {
            String commentaire = request.getParameter("commentaire");
            int note = Integer.parseInt(request.getParameter("rating"));
            Produit produit = FoodShopDao.getProduct(Integer.parseInt(request.getParameter("id")));
            Review review;
            review = FoodShopDao.getReviewForProductByUser(user.getId(),produit.getId());

            review.setNote(note);
            review.setMessage(commentaire);
            review.setUpdatedAt(Instant.now());
            FoodShopDao.saveOrUpdateReview(review);

            int reviewNotes = 0;
            if(review.getId() != null){
                List<Review> reviews = FoodShopDao.getReviewsForProduct(produit.getId());
                for (Review review1:reviews){
                    reviewNotes+=review1.getNote();
                }
                produit.setRatingCount(reviews.size());
                produit.setRatingCache(Double.valueOf(reviewNotes)/reviews.size());
            } else {
                produit.setRatingCount(produit.getRatingCount()+1);
                produit.setRatingCache((Double.valueOf(produit.getRatingCache()+review.getNote())/produit.getRatingCount()));
            }

            produit.setUpdatedAt(Instant.now());
            FoodShopDao.updateProductRating(produit,review);

            request.setAttribute("messageSucces","Merci d'avoir note ce plat");
            doGet(request, response);
        } else {
            request.setAttribute("messageErreur","Connectez-vous afin de noter nos plats");
            doGet(request, response);
        }
    }
}
