package com.ensias.foodstore.controllers.auth;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.HibernateUtil;
import com.ensias.foodstore.dao.OrderDao;
import com.ensias.foodstore.dao.interfaces.OrdersDaoInterface;
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

    private OrdersDaoInterface orderDao;

    @Override
    public void init() throws ServletException {
        orderDao = new OrderDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User utilisateur = (User) request.getSession().getAttribute("utilisateur");

        if (utilisateur != null) {

            int commandeId = Integer.parseInt(request.getParameter("commandeId"));

            Commande commande = orderDao.getOrberById(commandeId);
            commande.setStatut(-1);
            commande.setUpdatedAt(Instant.now());
            orderDao.updateOrder(commande);

            request.setAttribute("messageSucces","La commande a été annulée");
            List<Commande> commandes = orderDao.getOrdersForUser(utilisateur.getId());

            request.setAttribute("categories", FoodShopDao.getAllCategories());
            request.setAttribute("villesCouvertes",FoodShopDao.getCoveredCities());
            request.setAttribute("commandes",commandes);
            this.getServletContext().getRequestDispatcher("/views/auth/profile.jsp").forward(request, response);
        } else {
            request.setAttribute("messageErreur", "Veuillez vous connecter afin de gérer vos commandes");
            request.getRequestDispatcher("/connexion").forward(request, response);
        }
    }
}
