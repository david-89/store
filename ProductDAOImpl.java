
package app.dao;

import app.domain.Product;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void registerProduct(Product product) {  //saves the product into DB
        Session session = getCurrentSession();
        Transaction tx = session.beginTransaction();
        session.save(product);
        tx.commit();  
    }
    
    @Override
    public Product getProductById(Integer id) { //retrieves a particular product by its ID
        Session session = getCurrentSession();
        Transaction tx = session.beginTransaction();
        Product product = (Product) session.get(Product.class, id);
        tx.commit();
        return product;
    }
    
    @Override
    public List<Product> getProductsByName(String name) { //enables search option by product name for active products only
        List<Product> products = new ArrayList<>();
        Session session = getCurrentSession();
        Query query;
        Transaction tx = session.beginTransaction();
        String hql = "FROM Product WHERE productName like '%" + name + "%'" + " AND active = true";
        query = session.createQuery(hql);
        products = query.list();
        tx.commit();
        return products;        
    }
    
    @Override
    public void deleteProduct(Product product) { //sets the product to inactive which simulates deletion
        Session session = getCurrentSession(); 
        Query query;
        Transaction tx = session.beginTransaction();
        String hql = "UPDATE Product SET active = 0 WHERE productId = " + product.getProductId() + "";
        query = session.createQuery(hql);
        query.executeUpdate();
        tx.commit();          
    }
    
    @Override
    public List<Product> getAllProducts() { // retrieves all active products from DB
        List<Product> products = new ArrayList<>();
        Session session = getCurrentSession();
        Query query;
        Transaction tx = session.beginTransaction();
        String hql = "FROM Product WHERE active = true";
        query = session.createQuery(hql);
        products = query.list();
        tx.commit();
        return products;
    } 
    
    @Override
    public void updateProduct(Product product){ //updates a product in DB
        Session ses = getCurrentSession();
        Transaction tx = ses.beginTransaction();
        ses.update(product);
        tx.commit();
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
