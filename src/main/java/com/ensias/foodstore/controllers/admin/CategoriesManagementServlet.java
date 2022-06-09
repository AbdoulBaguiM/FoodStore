package com.ensias.foodstore.controllers.admin;

import com.ensias.foodstore.dao.CategorieDao;
import com.ensias.foodstore.dao.interfaces.CategorieDaoInterface;
import com.ensias.foodstore.models.Categorie;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.Instant;

@WebServlet(name = "CategoriesManagementServlet", value = "/admin/categories")
public class CategoriesManagementServlet extends HttpServlet {
    private CategorieDaoInterface categorieDao;

    @Override
    public void init() throws ServletException {
        categorieDao = new CategorieDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int categorieId;

        if(request.getParameter("id") == null) {
            request.setAttribute("categories", categorieDao.getAllCategories());
            this.getServletContext().getRequestDispatcher("/views/admin/categories.jsp").forward(request, response);
        } else if(request.getParameter("id") != null) {
            categorieId = Integer.parseInt(request.getParameter("id"));
            Categorie categorie = categorieDao.getCategorieById(categorieId);

            if(request.getParameter("del") == null){
                request.setAttribute("categorie",categorie);
                request.setAttribute("categories", categorieDao.getAllCategories());
                this.getServletContext().getRequestDispatcher("/views/admin/categories.jsp").forward(request, response);
            } else {
                categorieDao.deleteCategorie(categorie);
                request.setAttribute("categories", categorieDao.getAllCategories());
                this.getServletContext().getRequestDispatcher("/views/admin/categories.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Categorie categorie;
        if(!request.getParameter("id").isEmpty()) {
            int categorieId = Integer.parseInt(request.getParameter("id"));
            categorie = categorieDao.getCategorieById(categorieId);
        } else
            categorie = new Categorie();

        String nom = request.getParameter("name");
        String slug = request.getParameter("slug");

        categorie.setNom(nom);
        categorie.setSlug(slug);

        if(!request.getParameter("id").isEmpty()) {
            categorie.setUpdatedAt(Instant.now());
            categorieDao.updateCategorie(categorie);
        } else {
            categorie.setCreatedAt(Instant.now());
            categorie.setUpdatedAt(Instant.now());
            categorieDao.addCategorie(categorie);
        }

        request.removeAttribute("id");
        request.setAttribute("categories", categorieDao.getAllCategories());
        this.getServletContext().getRequestDispatcher("/views/admin/categories.jsp").forward(request, response);
    }
}
