package com.ensias.foodstore.dao;

import com.ensias.foodstore.dao.interfaces.RoleDaoInterface;
import com.ensias.foodstore.dao.interfaces.UserDaoInterface;
import com.ensias.foodstore.models.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class UserDao implements UserDaoInterface {

    @Override
    public List<User> getAllUsers() {
        RoleDaoInterface roleDao = new RoleDao();
        List<User> utilisateurs = new ArrayList<User>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("select u from User u where u.id != 1");
            utilisateurs = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        for (User utilisateur:utilisateurs)
            utilisateur.setRole(roleDao.getRoleById(utilisateur.getRole().getId()));
        return utilisateurs;
    }

    @Override
    public User getUserById(Long userId) {
        RoleDaoInterface roleDao = new RoleDao();
        User user= new User();
        Session session = HibernateUtil.getInstance().getSessionFactory().getCurrentSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("from User where id = :id");
            query.setParameter("id",userId);
            if(query.list().size()>0)
                user = (User) query.list().get(0);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
        user.setRole(roleDao.getRoleById(user.getRole().getId()));
        return user;
    }

    @Override
    public void addUser(User utilisateur) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.save(utilisateur);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void updateUser(User utilisateur) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.update(utilisateur);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void deleteUser(User utilisateur) {
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(utilisateur);
        session.getTransaction().commit();
        session.close();
    }
}
