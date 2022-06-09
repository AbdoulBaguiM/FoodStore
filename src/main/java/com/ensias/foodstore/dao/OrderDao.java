package com.ensias.foodstore.dao;

import com.ensias.foodstore.dao.interfaces.OrdersDaoInterface;
import com.ensias.foodstore.dao.interfaces.UserDaoInterface;
import com.ensias.foodstore.models.Commande;
import com.ensias.foodstore.models.CommandeProduit;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import java.util.ArrayList;
import java.util.List;

public class OrderDao implements OrdersDaoInterface {
    @Override
    public List<Commande> getAllOrders() {
        UserDaoInterface userDao = new UserDao();
        List<Commande> commandes = new ArrayList<Commande>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select c from Commande c order by c.createdAt desc");
            commandes = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        for(Commande commande:commandes){
            List<CommandeProduit> commandeProduits = new ArrayList<CommandeProduit>();
            commandeProduits = this.getCommandeProduit(commande.getId());
            commande.setCommandeProduits(commandeProduits);
            commande.setUser(userDao.getUserById(commande.getUser().getId()));
        }

        return commandes;
    }

    @Override
    public List<Commande> getOrdersForUser(Long userId) {
        UserDaoInterface userDao = new UserDao();
        List<Commande> commandes = new ArrayList<Commande>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select c from Commande c where c.user.id = :userId order by c.createdAt desc");
            query.setParameter("userId",userId);
            commandes = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        for(Commande commande:commandes){
            List<CommandeProduit> commandeProduits = new ArrayList<CommandeProduit>();
            commandeProduits = this.getCommandeProduit(commande.getId());
            commande.setCommandeProduits(commandeProduits);
            commande.setUser(userDao.getUserById(commande.getUser().getId()));
        }

        return commandes;
    }

    @Override
    public Commande getOrberById(int commandeId) {
        UserDaoInterface userDao = new UserDao();
        Commande commande = new Commande();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select c from Commande c where c.id = :commandeId");
            query.setParameter("commandeId",commandeId);
            if(query.list().size()>0)
                commande = (Commande) query.list().get(0);
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        List<CommandeProduit> commandeProduits = new ArrayList<CommandeProduit>();
        commandeProduits = this.getCommandeProduit(commande.getId());
        commande.setCommandeProduits(commandeProduits);
        commande.setUser(userDao.getUserById(commande.getUser().getId()));

        return commande;
    }

    public List<CommandeProduit> getCommandeProduit(Integer commandeId) {
        List<CommandeProduit> commandeProduits = new ArrayList<CommandeProduit>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select cp from CommandeProduit cp where cp.commande.id = :commandeId");
            query.setParameter("commandeId",commandeId);
            commandeProduits = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        for(CommandeProduit commandeProduit:commandeProduits)
            commandeProduit.setProduit(FoodShopDao.getProduct(commandeProduit.getProduit().getId()));

        return commandeProduits;
    }

    @Override
    public void updateOrder(Commande commande) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.update(commande);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void deleteOrder(Commande commande) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(commande);
        session.getTransaction().commit();
        session.close();
    }
}
