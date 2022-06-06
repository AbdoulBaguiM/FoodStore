package com.ensias.foodstore.controllers;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.HibernateUtil;
import com.ensias.foodstore.models.Contactus;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;

import java.io.IOException;
import java.time.Instant;

@WebServlet(name = "ContactUsServlet", value = "/contactez-nous")
public class ContactUsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("categories", FoodShopDao.getAllCategories());
        this.getServletContext().getRequestDispatcher("/views/contactUs.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nom = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        Contactus contactus = new Contactus();
        contactus.setName(nom);
        contactus.setEmail(email);
        contactus.setMessage(message);
        contactus.setCreatedAt(Instant.now());
        contactus.setUpdatedAt(Instant.now());
        session.beginTransaction();
        session.save(contactus);
        session.getTransaction().commit();
        session.close();

        request.setAttribute("messageSucces","Merci d'avoir contacte notre boutique, nous vous recontacterons dans les plus brefs delais");
        doGet(request, response);
    }
}
