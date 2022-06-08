package com.ensias.foodstore.controllers.admin;

import com.ensias.foodstore.dao.AdminDao;
import com.ensias.foodstore.dao.interfaces.AdminDaoInterface;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UsersManagementServlet", value = "/admin/comptes")
public class UsersManagementServlet extends HttpServlet {
    private AdminDaoInterface adminDao;

    @Override
    public void init() throws ServletException {
        adminDao = new AdminDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("utilisateurs",adminDao.getAllUserAccounts());
        this.getServletContext().getRequestDispatcher("/views/admin/users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
