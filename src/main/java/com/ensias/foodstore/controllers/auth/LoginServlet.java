package com.ensias.foodstore.controllers.auth;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.HibernateUtil;
import com.ensias.foodstore.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/connexion")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("categories", FoodShopDao.getAllCategories());
        this.getServletContext().getRequestDispatcher("/views/auth/signIn.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        Query query = session.createQuery("select u from User u where u.email = :email and u.password = :password");
        query.setParameter("email",email);
        query.setParameter("password",password);

        List<User> users = query.list();
        if(users.size()>0){
            request.getSession().setAttribute("utilisateur",users.get(0));
            request.getRequestDispatcher("").forward(request, response);
        } else {
            request.setAttribute("messageErreur","Identifiant ou mot de passe incorrect");
            request.setAttribute("categories",FoodShopDao.getAllCategories());
            request.getRequestDispatcher("/views/auth/signIn.jsp").forward(request, response);
        }
    }

}
