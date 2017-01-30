
package app.dao;

import app.domain.Admin;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override   
    public void registerAdmin(Admin admin) { // saves the admin into admin table
        Session session = getCurrentSession();
        Transaction tx = session.beginTransaction();
        session.save(admin);
        tx.commit();      
    }
    
    @Override
    public boolean checkAdmin(Admin admin) {   //checks if the entered credentials exist in DB
        Session session = getCurrentSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("FROM Admin WHERE username = :username AND password = :password");
        query.setParameter("username", admin.getUsername());
        query.setParameter("password", admin.getPassword());
        if(query.uniqueResult() != null) { 
            tx.commit();
            return true;
        }
        tx.commit();
        return false;
    }
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public Session getCurrentSession(){
        return getSessionFactory().getCurrentSession();
    }
}
