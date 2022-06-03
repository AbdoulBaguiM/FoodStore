package com.ensias.foodstore.controllers.auth.profile;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.HibernateUtil;
import com.ensias.foodstore.models.Commande;
import com.ensias.foodstore.models.CommandeProduit;
import com.ensias.foodstore.models.Produit;
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

@WebServlet(name = "ProfileServlet", value = "/profil")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User utilisateur = (User) request.getSession().getAttribute("utilisateur");

        if(utilisateur != null) {
            Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

            List<Commande> commandes = new ArrayList<Commande>();

            Query query = session.createQuery("select c from Commande c where c.user.id = :userId");
            query.setParameter("userId",utilisateur.getId());
            commandes = query.list();


            //Marche
            request.setAttribute("categories", FoodShopDao.getAllCategories());
            request.setAttribute("villesCouvertes",FoodShopDao.getCoveredCities());
            request.setAttribute("commandes",commandes);
            this.getServletContext().getRequestDispatcher("/views/auth/profile.jsp").forward(request, response);
        } else {
            request.setAttribute("messageErreur", "Veuillez vous connecter afin de faire le suivi de vos commandes");
            request.getRequestDispatcher("/connexion").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Session session;
        try {
            session = HibernateUtil.getInstance().getSessionFactory().getCurrentSession();
        } catch (HibernateException ex) {
            session = HibernateUtil.getInstance().getSessionFactory().openSession();
        }

        if(request.getParameter("buttonUpdateProfile") != null){
            User user = (User) request.getSession().getAttribute("utilisateur");
            user.setName(request.getParameter("first_name"));
            user.setLastName(request.getParameter("last_name"));
            user.setTelephone(request.getParameter("telephone"));
            user.setEmail(request.getParameter("email"));
            user.setAdresse(request.getParameter("adresse"));
            user.setVille(request.getParameter("ville"));
            user.setZipcode(request.getParameter("zipcode"));

            String password = request.getParameter("password").isEmpty() ? user.getPassword() : request.getParameter("password");
            user.setPassword(password);
            user.setUpdatedAt(Instant.now());

            try {
                session.beginTransaction();
                session.update(user);
                session.getTransaction().commit();
            } catch (HibernateException he) {
                System.out.println("Error : " + he);
                he.printStackTrace();
            } finally {
                if (session.isOpen()){
                    session.close();
                }
            }
            request.setAttribute("messageSucces","Votre profil a été mis à jour");
            doGet(request, response);

        } else if(request.getParameter("buttonCommande") != null) {

        }
    }
}
