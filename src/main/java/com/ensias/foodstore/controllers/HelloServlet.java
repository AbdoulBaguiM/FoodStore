package com.ensias.foodstore.controllers;

import java.io.*;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.HibernateUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Hibernate;
import org.hibernate.Session;


@WebServlet(name = "helloServlet", value = "")
public class HelloServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setAttribute("categories", FoodShopDao.getAllCategories());
        request.setAttribute("newProducts", FoodShopDao.getAllFeaturedProducts());
        request.setAttribute("datePromotion",FoodShopDao.getPromotionDateTime());
        request.setAttribute("bestSales", FoodShopDao.getBestSales());

        this.getServletContext().getRequestDispatcher("/views/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    public void destroy() {
    }

}