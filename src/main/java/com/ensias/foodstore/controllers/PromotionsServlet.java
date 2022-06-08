package com.ensias.foodstore.controllers;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.models.Produit;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;

@WebServlet(name = "PromotionsServlet", value = "/promotions")
public class PromotionsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(FoodShopDao.getPromotionDateTime().compareTo(Instant.now().toString()) == 1) {
            request.setAttribute("produits",FoodShopDao.getProductsInPromotion());
        } else {
            request.setAttribute("produits",new ArrayList<Produit>());
            request.setAttribute("messageSucces","Les promotions sont terminées, restez connectés pour profiter des prochaines");
        }
        request.setAttribute("categories", FoodShopDao.getAllCategories());
        request.setAttribute("query","Promotions");
        this.getServletContext().getRequestDispatcher("/views/search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
