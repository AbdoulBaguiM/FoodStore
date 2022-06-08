package com.ensias.foodstore.dao;

import com.ensias.foodstore.dao.interfaces.RoleDaoInterface;
import com.ensias.foodstore.models.Role;
import com.ensias.foodstore.models.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class RoleDao implements RoleDaoInterface {

    @Override
    public List<Role> getAllRoles() {
        List<Role> roles = new ArrayList<Role>();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("from Role");
            roles = query.list();
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        return roles;
    }

    @Override
    public Role getRoleById(Long roleId) {
        Role role = new Role();
        Session session = HibernateUtil.getInstance().getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createQuery("from Role where id = :roleId");
            query.setParameter("roleId",roleId);
            if(query.list().size()>0)
                role = (Role) query.list().get(0);
            session.getTransaction().commit();
        }catch (HibernateException e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }
        return role;
    }

}
