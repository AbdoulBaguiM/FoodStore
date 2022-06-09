package com.ensias.foodstore.controllers.admin;

import com.ensias.foodstore.dao.AdminDao;
import com.ensias.foodstore.dao.CategorieDao;
import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.OrderDao;
import com.ensias.foodstore.dao.interfaces.AdminDaoInterface;
import com.ensias.foodstore.dao.interfaces.CategorieDaoInterface;
import com.ensias.foodstore.dao.interfaces.OrdersDaoInterface;
import com.ensias.foodstore.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AdminHomeServlet", value = "/admin")
public class AdminHomeServlet extends HttpServlet {

    private OrdersDaoInterface orderDao;
    private CategorieDaoInterface categorieDao;

    @Override
    public void init() throws ServletException {
        orderDao = new OrderDao();
        categorieDao = new CategorieDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User admin = (User) request.getSession().getAttribute("utilisateur");
        if(admin != null && admin.getRole().getName().equals("admin")) {

            request.setAttribute("commandes",orderDao.getAllOrders());
            this.getServletContext().getRequestDispatcher("/views/admin/dashboard.jsp").forward(request, response);

        } else {
            request.setAttribute("messageErreur","Vous n'avez pas les autorisations requises");
            request.setAttribute("categories",categorieDao.getAllCategories());
            request.getRequestDispatcher("/views/auth/signIn.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
