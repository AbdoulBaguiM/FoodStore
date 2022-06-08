package com.ensias.foodstore.dao.interfaces;

import com.ensias.foodstore.models.Contactus;

import java.util.List;

public interface ContactUsDaoInterface {

    List<Contactus> getAllMessages();

    Contactus getMessageById(int messageId);

    void deleteMessage(Contactus contactus);
}
