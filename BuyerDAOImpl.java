
package app.dao;

import app.domain.Buyer;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuyerDAOImpl implements BuyerDAO { 

    @Autowired
    private SessionFactory sessionFactory; 
    
    @Override
    public void registerBuyer(Buyer buyer) {      //inserts a buyer into DB 
        Session session = getCurrentSession();
        Transaction tx = session.beginTransaction();
        session.save(buyer);
        tx.commit();        
    }
    
    @Override
    public Buyer getBuyerById(Integer id) { //retrieves the buyer by his/her id
        Session session = getCurrentSession();
        Transaction tx = session.beginTransaction();
        Buyer buyer = (Buyer) session.get(Buyer.class, id);
        tx.commit();
        return buyer;
    }
    
    @Override
    public boolean checkBuyer(Buyer buyer) {  //checks if the entered credentials exist in DB
        Session session = getCurrentSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("FROM Buyer WHERE username = :username AND password = :password");
        query.setParameter("username", buyer.getUsername());
        query.setParameter("password", buyer.getPassword());
        if (query.uniqueResult() != null) {
            tx.commit();
            return true;
        }
        tx.commit();
        return false;
    }
    
    @Override
    public void updateBuyerCC(Buyer buyer, Double amount) { //adds the passed amount to the current CC balance for the passed buyer
        Session session = getCurrentSession();        
        Transaction tx = session.beginTransaction();
        Query query;
        String sql = "UPDATE buyer SET cc_balance = cc_balance + " + amount + " WHERE buyerId = " + buyer.getBuyerId() + " ";
        query = session.createSQLQuery(sql);
        query.executeUpdate();
        tx.commit();
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
