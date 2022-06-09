package com.ensias.foodstore.controllers.admin;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.RoleDao;
import com.ensias.foodstore.dao.UserDao;
import com.ensias.foodstore.dao.interfaces.RoleDaoInterface;
import com.ensias.foodstore.dao.interfaces.UserDaoInterface;
import com.ensias.foodstore.models.Role;
import com.ensias.foodstore.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.Instant;

@WebServlet(name = "AddEditUserServlet", value = "/admin/compte")
public class AddEditUserServlet extends HttpServlet {
    private UserDaoInterface userDao;
    private RoleDaoInterface roleDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
        roleDao = new RoleDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long userId;
        if(request.getParameter("id") == null){
            request.setAttribute("villesCouvertes", FoodShopDao.getCoveredCities());
            request.setAttribute("roles",roleDao.getAllRoles());
            this.getServletContext().getRequestDispatcher("/views/admin/editUser.jsp").forward(request, response);
        } else
        if(request.getParameter("id") != null) {
            userId = Long.valueOf(request.getParameter("id"));
            User utilisateur = userDao.getUserById(userId);
            if(request.getParameter("del") == null) {
                request.setAttribute("villesCouvertes", FoodShopDao.getCoveredCities());
                request.setAttribute("roles",roleDao.getAllRoles());
                request.setAttribute("user", utilisateur);
                this.getServletContext().getRequestDispatcher("/views/admin/editUser.jsp").forward(request, response);
            } else {
                userDao.deleteUser(utilisateur);
                request.setAttribute("users", userDao.getAllUsers());
                request.getRequestDispatcher("/views/admin/users.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user;

        if(!request.getParameter("id").isEmpty()) {
            Long userId = Long.valueOf(request.getParameter("id"));
            user = userDao.getUserById(userId);
        } else
            user = new User();

        Long roleId = Long.valueOf(request.getParameter("role"));
        Role role = roleDao.getRoleById(roleId);

        String nom = request.getParameter("name");
        String prenom = request.getParameter("lastName");
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String ville = request.getParameter("ville");
        String zipcode = request.getParameter("zipcode");
        String telephone = request.getParameter("telephone");
        String password = request.getParameter("password");

        user.setRole(role);
        user.setName(nom);
        user.setLastName(prenom);
        user.setEmail(email);
        user.setAdresse(adresse);
        user.setVille(ville);
        user.setZipcode(zipcode);
        user.setTelephone(telephone);

        if(!request.getParameter("id").isEmpty()){
            if(!password.isEmpty())
                user.setPassword(password);
            user.setUpdatedAt(Instant.now());
            userDao.updateUser(user);
        } else {
            user.setPassword(password);
            user.setCreatedAt(Instant.now());
            user.setUpdatedAt(Instant.now());
            userDao.addUser(user);
        }

        response.sendRedirect("/admin/comptes");
    }
}
