package com.ensias.foodstore.controllers;

import com.ensias.foodstore.dao.FoodShopDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/produit")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("id"));

        request.setAttribute("categories", FoodShopDao.getAllCategories());
        request.setAttribute("produit",FoodShopDao.getProduct(productId));
        request.setAttribute("relatedProducts", FoodShopDao.getRelatedProducts(productId));

        this.getServletContext().getRequestDispatcher("/views/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
