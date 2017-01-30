
package app.dao;

import app.domain.Buyer;
import app.domain.OrderBuyerProduct;
import app.domain.Product;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements  OrderDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public void registerOrder(OrderBuyerProduct order) {  //adds a new row to order table
        Session session = getCurrentSession();
        Transaction tx = session.beginTransaction();                
        session.save(order);        
        tx.commit();  
    }
    
    @Override
    public void insertBuyerInOrder(Buyer buyer) {  //inserts a random order_id string and buyer id in order_table  
        Session session = getCurrentSession();
        OrderBuyerProduct obp = new OrderBuyerProduct();
        String orderId = obp.generateOrderId();
        Query query;
        Transaction tx = session.beginTransaction();
        String sql = "UPDATE order_table SET buyer_id = " + buyer.getBuyerId() + ", order_id = '" + orderId + "' ORDER BY id DESC LIMIT 1";        
        query = session.createSQLQuery(sql);  
        query.executeUpdate(); 
        tx.commit();
    }
    
    @Override
    public void insertProductInOrder(Product product) { //inserts product id into order table
        Session session = getCurrentSession();
        Query query;
        Transaction tx = session.beginTransaction();
        String sql = "UPDATE order_table SET product_id = " + product.getProductId() + " ORDER BY id DESC LIMIT 1";
        query = session.createSQLQuery(sql);
        query.executeUpdate();
        tx.commit();
    }
    
    @Override  
    public void insertQtyInOrder(Integer purchasedQty) { //inserts purchased qty into the corresponding row in order table
        Session session = getCurrentSession();
        Query query;
        Transaction tx = session.beginTransaction();
        String sqlOrderTable = "UPDATE order_table SET purchased_qty = " + purchasedQty + " ORDER BY id DESC LIMIT 1";
        query = session.createSQLQuery(sqlOrderTable);
        query.executeUpdate(); // inserts qty in the last updated row
        String getId = "SELECT product_id FROM order_table ORDER BY purchase_date DESC limit 1 ";
        query = session.createSQLQuery(getId); //gets product id from 
        List list = query.list();
        String id = null;
        for (Object elem : list) {
            id = (String) elem.toString();
        }
        Integer idInt = Integer.parseInt(id); //stores productId obtained from the query
        String updateQtyProduct = "UPDATE product SET qty = qty - " + purchasedQty + " WHERE productId = " + idInt + " "; 
        query = session.createSQLQuery(updateQtyProduct); //adds qty to the last product added in the table
        query.executeUpdate();
        tx.commit();        
    }
    
    @Override
    public boolean checkQty(Integer productId, Integer qtyPurchased) { //checks available qty
        Session session = getCurrentSession();
        Query query;
        Transaction tx = session.beginTransaction();
        String sql = "SELECT qty FROM product WHERE productId = " + productId + " ";
        query = session.createSQLQuery(sql);
        String qty = null;
        List list = query.list();
        for (Object elem : list) {
            qty = (String) elem.toString();
        }        
        Integer qtyInt = Integer.parseInt(qty);
        tx.commit();
        
        if (qtyInt - qtyPurchased >= 0) {
            return true;
        }
        return false;
    }
    
    @Override
    public void chargeCC(Integer productId, Integer buyerId, Integer qtyPurchased) { 
        Session session = getCurrentSession();
        Query query;
        Transaction tx = session.beginTransaction();
        String sqlGetPrice = "SELECT price FROM product WHERE productId = " + productId + " ";
        query = session.createSQLQuery(sqlGetPrice);
        String price = null;
        List list = query.list();
        for (Object elem : list) {
            price = (String) elem.toString();
        }
        Double productPrice = Double.parseDouble(price); //stores price of the given product
        Double orderAmount = productPrice * qtyPurchased;
        String sqlUpdateCC = "UPDATE buyer SET cc_balance = cc_balance - " + orderAmount + " WHERE buyerId = " + buyerId;
        query = session.createSQLQuery(sqlUpdateCC); //charges the amount from the buyer's CC
        query.executeUpdate();
        tx.commit();
    }
    
    @Override
    public boolean checkCCBalance(Integer buyerId, Integer productId, Integer qtyPurchased) {   
        Session session = getCurrentSession();
        Query query;
        Transaction tx = session.beginTransaction();
        String sqlGetPrice = "SELECT price FROM product WHERE productId = " + productId + " ";
        query = session.createSQLQuery(sqlGetPrice);
        String price = null;
        List list = query.list();
        for (Object elem : list) {
            price = (String) elem.toString();
        }
        Double productPrice = Double.parseDouble(price); //stores price from the given product
        Double orderAmount = productPrice * qtyPurchased;        
        String sqlGetCCBalance = "SELECT cc_balance FROM buyer WHERE buyerId = " + buyerId + " ";
        query = session.createSQLQuery(sqlGetCCBalance);
        String ccBalanceStr = null;
        List listCC = query.list();
        for (Object elem : listCC) {
            ccBalanceStr = (String) elem.toString();
        }        
        Double ccBalance = Double.parseDouble(ccBalanceStr); //stores current CC balance from the given buyer
        if (ccBalance - orderAmount >= 0) { //returns true if the updated CC balance is greater than 0
            tx.commit();
            return true;
        }
        tx.commit();
        return false;        
    }

    @Override
    public OrderBuyerProduct getOrderById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   
    public Session getCurrentSession(){
        return getSessionFactory().getCurrentSession();
    }
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }    
}
