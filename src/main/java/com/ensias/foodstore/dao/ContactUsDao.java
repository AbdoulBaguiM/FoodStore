package com.ensias.foodstore.dao;

import com.ensias.foodstore.dao.interfaces.ContactUsDaoInterface;
import com.ensias.foodstore.models.Contactus;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class ContactUsDao implements ContactUsDaoInterface {
    @Override
    public List<Contactus> getAllMessages() {
        List<Contactus> messages = new ArrayList<Contactus>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("from Contactus order by createdAt desc");
            messages = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        return messages;
    }

    public Contactus getMessageById(int messageId) {
        Contactus message = new Contactus();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select c from Contactus c where c.id = :messageId");
            query.setParameter("messageId",messageId);
            if(query.list().size()>0)
                message = (Contactus) query.list().get(0);
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        return message;
    }

    @Override
    public void deleteMessage(Contactus contactus) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(contactus);
        session.getTransaction().commit();
        session.close();
    }
}
