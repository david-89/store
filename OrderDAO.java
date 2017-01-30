
package app.dao;

import app.domain.Buyer;
import app.domain.OrderBuyerProduct;
import app.domain.Product;

public interface OrderDAO {
    public void registerOrder(OrderBuyerProduct order);
    public OrderBuyerProduct getOrderById(Integer id);
    public void insertBuyerInOrder(Buyer buyer);
    public void insertProductInOrder(Product product);  
    public void insertQtyInOrder(Integer qtyPurchased); 
    public boolean checkQty(Integer productId, Integer qtyPurchased);
    public void chargeCC(Integer productId, Integer buyerId, Integer qtyPurchased);
    public boolean checkCCBalance(Integer buyerId, Integer productId, Integer qtyPurchased);    
}
