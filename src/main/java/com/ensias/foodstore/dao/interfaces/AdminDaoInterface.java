package com.ensias.foodstore.dao.interfaces;

import com.ensias.foodstore.models.Commande;
import com.ensias.foodstore.models.Produit;
import com.ensias.foodstore.models.Review;
import com.ensias.foodstore.models.User;

import java.util.List;

public interface AdminDaoInterface {

    // Get all orders
    List<Commande> getAllOrders();

    // Get all users
    List<User> getAllUserAccounts();

    List<Review> getAllReviews();

    void updateProduct(Produit produit);

    void addNewProduct(Produit produit);

    void deleteProduct(Produit produit);
}
