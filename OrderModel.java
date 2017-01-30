
package app.model;

import app.domain.OrderBuyerProduct;
import java.sql.Timestamp;

public class OrderModel {
    
    private Integer id;
    private String orderId;
    private Integer buyerId;
    private Integer productId;
    private Integer pucrhasedQty;
    private Timestamp purchaseDate;

    
    public String getOrderId() {
        return orderId;
    }
   
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getPucrhasedQty() {
        return pucrhasedQty;
    }

    public void setPucrhasedQty(Integer pucrhasedQty) {
        this.pucrhasedQty = pucrhasedQty;
    }

    public Timestamp getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Timestamp purchaseDate) {
        this.purchaseDate = purchaseDate;
    }
    
    public void repack(OrderBuyerProduct order) {
        this.setBuyerId(order.getBuyerId());
        this.setOrderId(order.generateOrderId());
        this.setProductId(order.getProductId());
        this.setPucrhasedQty(order.getPurhcasedQty());
        this.setPurchaseDate(order.getPurchaseDate()); 
        this.setId(order.getId()); 
    }

    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
}
