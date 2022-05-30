package com.ensias.foodstore.controllers;

import com.ensias.foodstore.dao.FoodShopDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SearchServlet", value = "/rechercher")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String query = request.getParameter("query").isEmpty() ? "" : request.getParameter("query").toString();
        String idc = request.getParameter("idc")==null? "" : request.getParameter("idc");
        String sqlQuery;

        if(idc.isEmpty()){
            sqlQuery = "SELECT p FROM Produit p WHERE p.nom like '%"+query+"%'";
        }
        else
            sqlQuery = "SELECT p FROM Produit p WHERE p.nom like '%"+query+"%' and categorie_id="+idc;

        request.setAttribute("query",query);
        request.setAttribute("categories", FoodShopDao.getAllCategories());
        request.setAttribute("produits", FoodShopDao.getProductsBySearch(sqlQuery));

        this.getServletContext().getRequestDispatcher("/views/search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
