package com.ensias.foodstore.models;

import com.ensias.foodstore.dao.HibernateUtil;
import org.hibernate.Session;

import java.util.ArrayList;

public class Panier {

    private ArrayList<LignePanier> items = new ArrayList<LignePanier>();

    public ArrayList<LignePanier> getItems() {
        return items;
    }

    public void setItems(ArrayList<LignePanier> items) {
        this.items = items;
    }

    public void addItems(int produitId, int quantite) {
        boolean flag = true;

        for(LignePanier lignePanier:items)
            if (lignePanier.getProduit().getId() == produitId) {
                lignePanier.setQuantite(quantite);
                flag = false;
                break;
            }

        if (flag) {
            Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
            Produit produit = session.get(Produit.class,produitId);
            LignePanier lignePanier = new LignePanier(produit, quantite);
            items.add(lignePanier);
        }
    }

    public void supprimerProduit(int produitId) {
        for(LignePanier lignePanier:items) {
            if(lignePanier.getProduit().getId() == produitId){
                items.remove(lignePanier);
                break;
            }
        }
    }

    public void updateItem(int produitId, int quantite) {
        boolean flag = true;

        for(LignePanier lignePanier:items)
            if (lignePanier.getProduit().getId() == produitId) {
                lignePanier.setQuantite(lignePanier.getQuantite()+quantite);
                flag = false;
                break;
            }

        if (flag) {
            Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
            Produit produit = session.get(Produit.class,produitId);
            LignePanier lignePanier = new LignePanier(produit, quantite);
            items.add(lignePanier);
        }
    }

    public double totalPanier() {
        double total = 0;

        for(LignePanier lignePanier:items) {
            total+=lignePanier.getProduit().getPrixHt()*lignePanier.getQuantite();
        }
        return total;
    }

    public double fraixLivraison() {
        double frais = 10;
        return frais;
    }
}
