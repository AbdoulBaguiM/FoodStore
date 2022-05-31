package com.ensias.foodstore.controllers;

import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.HibernateUtil;
import com.ensias.foodstore.models.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.time.Instant;

@WebServlet(name = "CheckoutServlet", value = "/commander")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("categories", FoodShopDao.getAllCategories());

        if(request.getSession().getAttribute("utilisateur") != null) {
            if(request.getSession().getAttribute("panier")!=null) {
                request.setAttribute("villesCouvertes",FoodShopDao.getCoveredCities());
                this.getServletContext().getRequestDispatcher("/views/checkout.jsp").forward(request, response);
            } else {
                request.setAttribute("messageErreur", "Votre panier est vide, veuillez ajouter des produits à partir de notre boutique");
                request.getRequestDispatcher("/boutique").forward(request,response);
            }
        } else {
            request.setAttribute("messageErreur", "Vous devez vous connecter afin de passer une commande");
            request.getRequestDispatcher("/connexion").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom") == null ? "" : request.getParameter("prenom");
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String ville = request.getParameter("ville");
        String zipCode = request.getParameter("zip_code");
        String telephone = request.getParameter("tel");
        boolean payment = Integer.parseInt(request.getParameter("payement")) == 1 ? true : false;

        User utilisateur = (User) request.getSession().getAttribute("utilisateur");
        Panier panier = (Panier) request.getSession().getAttribute("panier");

        Commande commande = new Commande();
        commande.setUser(utilisateur);
        commande.setCNom(nom);
        commande.setCPrenom(prenom);
        commande.setCEmail(email);
        commande.setCAdresse(adresse);
        commande.setCVille(ville);
        commande.setCZipcode(zipCode);
        commande.setCTelephone(telephone);
        commande.setCPayement(payment);
        commande.setCSubtotal(panier.totalPanier()- panier.fraixLivraison());
        commande.setCTotal(panier.totalPanier());
        commande.setCreatedAt(Instant.now());
        commande.setUpdatedAt(Instant.now());

        // Save commande & commande produit
        session.beginTransaction();
        session.save(commande);
        session.getTransaction().commit();

        for (LignePanier lignePanier:panier.getItems()) {
            CommandeProduit commandeProduit = new CommandeProduit();
            commandeProduit.setCommande(commande);
            commandeProduit.setProduit(lignePanier.getProduit());
            commandeProduit.setQuantite(lignePanier.getQuantite());
            commandeProduit.setCreatedAt(Instant.now());
            commandeProduit.setUpdatedAt(Instant.now());
            session.beginTransaction();
            session.save(commandeProduit);
            session.getTransaction().commit();

            // Update product quantities
            this.updateProductQuantity(commandeProduit.getProduit().getId(),commandeProduit.getQuantite());
        }
        session.close();

        request.getSession().removeAttribute("panier");
        request.setAttribute("categories",FoodShopDao.getAllCategories());
        request.getRequestDispatcher("/views/thanks.jsp").forward(request,response);
    }

    private void updateProductQuantity(Integer id, Integer quantite) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        Produit produit = session.get(Produit.class,id);
        produit.setQuantite(produit.getQuantite()-quantite);
        produit.setUpdatedAt(Instant.now());
        session.beginTransaction();
        session.saveOrUpdate(produit);
        session.getTransaction().commit();
        session.close();
    }
}
