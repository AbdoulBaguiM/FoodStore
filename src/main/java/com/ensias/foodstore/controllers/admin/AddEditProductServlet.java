package com.ensias.foodstore.controllers.admin;

import com.ensias.foodstore.dao.AdminDao;
import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.interfaces.AdminDaoInterface;
import com.ensias.foodstore.models.Categorie;
import com.ensias.foodstore.models.Produit;
import com.ensias.foodstore.models.Promotion;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.Instant;

@WebServlet(name = "AddEditProductServlet", value = "/admin/produit")
public class AddEditProductServlet extends HttpServlet {
    private AdminDaoInterface adminDao;

    @Override
    public void init() throws ServletException {
        adminDao = new AdminDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int productId;
        if(request.getParameter("id") == null){
            request.setAttribute("categories",FoodShopDao.getAllCategories());
            request.setAttribute("promotions",FoodShopDao.getPromotions());
            this.getServletContext().getRequestDispatcher("/views/admin/editProduct.jsp").forward(request, response);
        } else
            if(request.getParameter("id") != null) {
            productId = Integer.parseInt(request.getParameter("id"));
            Produit produit = FoodShopDao.getProduct(productId);
            if(request.getParameter("del") == null) {
                request.setAttribute("categories",FoodShopDao.getAllCategories());
                request.setAttribute("promotions",FoodShopDao.getPromotions());
                request.setAttribute("produit", produit);
                this.getServletContext().getRequestDispatcher("/views/admin/editProduct.jsp").forward(request, response);
            } else {
                adminDao.deleteProduct(produit);
                request.setAttribute("produits", FoodShopDao.getAllProducts());
                this.getServletContext().getRequestDispatcher("/views/admin/products.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Produit produit;

        if (!request.getParameter("id").isEmpty()) {
            int productId = Integer.parseInt(request.getParameter("id"));
            produit = FoodShopDao.getProduct(productId);
        } else
            produit = new Produit();

        Promotion promotion = null;
        int promotionId = 0;

        String nom = request.getParameter("name");
        String details = request.getParameter("details");
        String description = request.getParameter("description");

        int categorieId = Integer.parseInt(request.getParameter("categorie"));
        Categorie categorie = FoodShopDao.getCategory(categorieId);

        if (!request.getParameter("promotion").isEmpty()){
            promotionId = Integer.parseInt(request.getParameter("promotion"));
            promotion = FoodShopDao.getPromotion(promotionId);
        }

        double prixHt = Double.parseDouble(request.getParameter("prixHt"));
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        String photoPrincipale = request.getParameter("photoPrincipale");



        produit.setNom(nom);
        produit.setDetails(details);
        produit.setDescription(description);
        produit.setCategorie(categorie);
        produit.setPrixHt(prixHt);
        produit.setQuantite(quantite);
        produit.setPhotoPrincipale(photoPrincipale);
        produit.setPromotion(promotion);


        if (!request.getParameter("id").isEmpty()) {
            produit.setUpdatedAt(Instant.now());
            adminDao.updateProduct(produit);
        } else {
            produit.setCreatedAt(Instant.now());
            produit.setUpdatedAt(Instant.now());
            adminDao.addNewProduct(produit);
        }

        response.sendRedirect("/admin/produits");
    }

}
