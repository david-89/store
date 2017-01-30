
package app.domain;

import app.model.OrderModel;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Random;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "order_table") 
public class OrderBuyerProduct implements Serializable { 
    
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    
    @Column(name = "order_id", nullable = true)
    private String orderId = generateOrderId();  
    
    @Column(name = "product_id")
    private Integer productId;
    
    @Column(name = "buyer_id")
    private Integer buyerId;
    
    @Column(name = "purchased_qty")
    private Integer purhcasedQty;
    
    @Column(name = "purchase_date", columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP") //inserts current timestamp in db
    private Timestamp purchaseDate;
    
    
    public String generateOrderId() {   //generates a random order id string of 10 chars upper case
        Random random = new Random();
        int top = 10;
        char data = ' ';
        String orderId = "";
        for (int i = 0; i <= top; i++) {
            data = (char) (random.nextInt(25) + 97);
            orderId = data + orderId;
            orderId = orderId.toUpperCase();
        }        
        return orderId;
    }
   
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
    
    public Integer getProductId() {
        return productId;
    }
    
    public void setProductId(Integer productId) {
        this.productId = productId;
    }
    
    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    public Integer getPurhcasedQty() {
        return purhcasedQty;
    }

    public void setPurhcasedQty(Integer purhcasedQty) {
        this.purhcasedQty = purhcasedQty;
    }

    public Timestamp getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Timestamp purchaseDate) {
        this.purchaseDate = purchaseDate;
    }
    
    public void repack(OrderModel orderModel) {
        this.setBuyerId(orderModel.getBuyerId());
        this.setOrderId(orderModel.getOrderId());
        this.setProductId(orderModel.getProductId());
        this.setPurchaseDate(orderModel.getPurchaseDate());
        this.setPurhcasedQty(orderModel.getPucrhasedQty()); 
        this.setId(orderModel.getId());
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }    
}
