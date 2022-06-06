package com.ensias.foodstore.controllers;

import com.ensias.foodstore.dao.FoodShopDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "PromotionsServlet", value = "/promotions")
public class PromotionsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("categories", FoodShopDao.getAllCategories());
        request.setAttribute("query","Promotions");
        request.setAttribute("produits",FoodShopDao.getProductsInPromotion());
        this.getServletContext().getRequestDispatcher("/views/search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
