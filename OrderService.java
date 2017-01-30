
package app.service;

import app.model.OrderModel;


public interface OrderService {
    public void registerOrder(OrderModel orderModel);
    public OrderModel getOrderById(Integer id);    
}
