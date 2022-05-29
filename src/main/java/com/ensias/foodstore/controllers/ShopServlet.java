package com.ensias.foodstore.controllers;

import com.ensias.foodstore.dao.FoodShopDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


import java.io.IOException;


@WebServlet(name = "ShopServlet", value = "/boutique")
public class ShopServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("categories", FoodShopDao.getAllCategories());
        request.setAttribute("produits",FoodShopDao.getAllProducts());
        request.setAttribute("bestSales", FoodShopDao.getBestSales());

        this.getServletContext().getRequestDispatcher("/views/store.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
