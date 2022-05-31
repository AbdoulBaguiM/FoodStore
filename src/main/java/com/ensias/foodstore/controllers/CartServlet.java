package com.ensias.foodstore.controllers;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.models.Panier;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "CartServlet", value = "/panier")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("categories", FoodShopDao.getAllCategories());
        this.getServletContext().getRequestDispatcher("/views/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action")==null ? "ajouter" : request.getParameter("action");

        int produitId;
        int quantite;

        Panier panier = null;
        if(request.getSession().getAttribute("panier")!=null){
            panier = (Panier) request.getSession().getAttribute("panier");
        } else {
            panier = new Panier();
        }

        if (action.equals("ajouter")){
             produitId = Integer.parseInt(request.getParameter("id"));
             quantite = Integer.parseInt(request.getParameter("qte"));
            panier.addItems(produitId, quantite);
        }

        if(action.equals("supprimer")){
            produitId = Integer.parseInt(request.getParameter("id"));
            panier.supprimerProduit(produitId);
        }

        if(action.equals("update")) {
            produitId = Integer.parseInt(request.getParameter("id"));
            quantite = Integer.parseInt(request.getParameter("quant["+produitId+"]"));
            panier.updateItem(produitId,quantite);
        }

        request.getSession().setAttribute("panier",panier);

        doGet(request,response);
    }
}
