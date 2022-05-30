package com.ensias.foodstore.controllers;

import java.io.*;

import com.ensias.foodstore.dao.FoodShopDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "helloServlet", value = "")
public class HelloServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setAttribute("categories", FoodShopDao.getAllCategories());
        request.setAttribute("newProducts", FoodShopDao.getAllFeaturedProducts());
        request.setAttribute("bestSales", FoodShopDao.getBestSales());

        this.getServletContext().getRequestDispatcher("/views/index.jsp").forward(request, response);
    }

    public void destroy() {
    }

}