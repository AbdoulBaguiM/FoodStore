package com.ensias.foodstore.dao.interfaces;

import com.ensias.foodstore.models.Commande;
import com.ensias.foodstore.models.CommandeProduit;

import java.util.List;

public interface OrdersDaoInterface {

    List<Commande> getAllOrders();

    List<Commande> getOrdersForUser(Long userId);

    Commande getOrberById(int commandeId);

    List<CommandeProduit> getCommandeProduit(Integer commandeId);

    void updateOrder(Commande commande);

    void deleteOrder(Commande commande);
}
