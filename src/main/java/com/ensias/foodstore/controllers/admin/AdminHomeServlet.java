package com.ensias.foodstore.controllers.admin;

import com.ensias.foodstore.dao.AdminDao;
import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.interfaces.AdminDaoInterface;
import com.ensias.foodstore.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AdminHomeServlet", value = "/admin")
public class AdminHomeServlet extends HttpServlet {

    private AdminDaoInterface adminDao;

    @Override
    public void init() throws ServletException {
        adminDao = new AdminDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User admin = (User) request.getSession().getAttribute("utilisateur");
        if(admin != null && admin.getRole().getName().equals("admin")) {

            request.setAttribute("commandes",adminDao.getAllOrders());
            this.getServletContext().getRequestDispatcher("/views/admin/dashboard.jsp").forward(request, response);

        } else {
            request.setAttribute("messageErreur","Identifiant ou mot de passe incorrect");
            request.setAttribute("categories",FoodShopDao.getAllCategories());
            request.getRequestDispatcher("/views/auth/signIn.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
