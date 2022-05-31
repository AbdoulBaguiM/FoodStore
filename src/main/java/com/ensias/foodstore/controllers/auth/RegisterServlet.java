package com.ensias.foodstore.controllers.auth;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.HibernateUtil;
import com.ensias.foodstore.models.Role;
import com.ensias.foodstore.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;
import java.time.Instant;
import java.util.List;

@WebServlet(name = "RegisterServlet", value = "/inscription")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("categories", FoodShopDao.getAllCategories());
        this.getServletContext().getRequestDispatcher("/views/auth/signUp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("telephone");
        String password = request.getParameter("password");

        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        User user = new User();
        user.setRole(this.getRoleById(2L));
        user.setName(name);
        user.setEmail(email);
        user.setTelephone(phoneNumber);
        user.setPassword(password);
        user.setCreatedAt(Instant.now());
        user.setUpdatedAt(Instant.now());

        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();

        request.getSession().setAttribute("messageSucces","Votre compte a ete cree avec succes, veuillez vous connecter");
        request.setAttribute("categories",FoodShopDao.getAllCategories());
        request.getRequestDispatcher("/views/auth/signIn.jsp").forward(request, response);
    }

    private Role getRoleById(Long roleId) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        Role role = new Role();

        role = session.get(Role.class, roleId);
        return role;
    }
}
