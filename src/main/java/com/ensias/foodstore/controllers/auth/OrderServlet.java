package com.ensias.foodstore.controllers.auth;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.HibernateUtil;
import com.ensias.foodstore.models.Commande;
import com.ensias.foodstore.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/annuler")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User utilisateur = (User) request.getSession().getAttribute("utilisateur");

        if (utilisateur != null) {
            Session session;
            try {
                session = HibernateUtil.getInstance().getSessionFactory().getCurrentSession();
            } catch (HibernateException ex) {
                session = HibernateUtil.getInstance().getSessionFactory().openSession();
            }

            int commandeId = Integer.parseInt(request.getParameter("commandeId"));

            try {
                session.beginTransaction();
                Commande commande = session.get(Commande.class,commandeId);
                commande.setStatut(-1);
                commande.setUpdatedAt(Instant.now());
                session.update(commande);
                session.getTransaction().commit();
            } catch (HibernateException he) {
                System.out.println("Error : " + he);
                he.printStackTrace();
            } finally {
                if (session.isOpen()){
                    session.close();
                }
            }
            request.setAttribute("messageSucces","La commande a été annulée");
            request.getRequestDispatcher("/profil").forward(request, response);
        } else {
            request.setAttribute("messageErreur", "Veuillez vous connecter afin de gérer vos commandes");
            request.getRequestDispatcher("/connexion").forward(request, response);
        }
    }
}
