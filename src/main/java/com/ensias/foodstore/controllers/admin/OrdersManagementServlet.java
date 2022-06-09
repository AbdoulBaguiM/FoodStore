package com.ensias.foodstore.controllers.admin;

import com.ensias.foodstore.dao.CategorieDao;
import com.ensias.foodstore.dao.FoodShopDao;
import com.ensias.foodstore.dao.HibernateUtil;
import com.ensias.foodstore.dao.OrderDao;
import com.ensias.foodstore.dao.interfaces.CategorieDaoInterface;
import com.ensias.foodstore.dao.interfaces.OrdersDaoInterface;
import com.ensias.foodstore.models.Commande;
import com.ensias.foodstore.models.CommandeProduit;
import com.ensias.foodstore.models.Review;
import com.ensias.foodstore.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;

import java.io.IOException;
import java.time.Instant;
import java.util.List;

@WebServlet(name = "OrdersManagementServlet", value = "/admin/commandes")
public class OrdersManagementServlet extends HttpServlet {

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

            if(request.getParameter("id") != null) {
                int commandeId = Integer.parseInt(request.getParameter("id"));
                Commande commande = orderDao.getOrberById(commandeId);
                request.setAttribute("villesCouvertes", FoodShopDao.getCoveredCities());
                request.setAttribute("commande",commande);
                this.getServletContext().getRequestDispatcher("/views/admin/editOrder.jsp").forward(request, response);

                if(request.getParameter("del") != null){
                    orderDao.deleteOrder(commande);
                    request.setAttribute("commandes",orderDao.getAllOrders());
                    this.getServletContext().getRequestDispatcher("/views/admin/dashboard.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("commandes",orderDao.getAllOrders());
                this.getServletContext().getRequestDispatcher("/views/admin/dashboard.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("messageErreur","Vous n'avez pas les autorisations requises");
            request.setAttribute("categories",categorieDao.getAllCategories());
            request.getRequestDispatcher("/views/auth/signIn.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Commande commande;

        int commandeId = Integer.parseInt(request.getParameter("id"));
        commande = orderDao.getOrberById(commandeId);

        String nom = request.getParameter("name");
        String prenom = request.getParameter("lastName");
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String ville = request.getParameter("ville");
        String telephone = request.getParameter("telephone");
        int statut = Integer.parseInt(request.getParameter("statut"));

        commande.setCNom(nom);
        commande.setCPrenom(prenom);
        commande.setCEmail(email);
        commande.setCAdresse(adresse);
        commande.setCVille(ville);
        commande.setCTelephone(telephone);
        commande.setStatut(statut);

        List<CommandeProduit> commandeProduits = orderDao.getCommandeProduit(commande.getId());
        commande.setCommandeProduits(commandeProduits);
        commande.setUpdatedAt(Instant.now());
        orderDao.updateOrder(commande);

        response.sendRedirect("/admin/commandes");
    }
}
