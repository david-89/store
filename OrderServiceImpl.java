
package app.service;

import app.dao.OrderDAO;
import app.domain.OrderBuyerProduct;
import app.model.OrderModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService { 
    
    @Autowired
    private OrderDAO orderDAO;

    @Override
    public void registerOrder(OrderModel orderModel) {
        OrderBuyerProduct order = new OrderBuyerProduct();
        order.repack(orderModel);
        getOrderDAO().registerOrder(order); 
    }

    @Override
    public OrderModel getOrderById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public OrderDAO getOrderDAO() {
        return orderDAO;
    }

    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    public OrderModel repack(OrderBuyerProduct orderBuyerProduct) {
        OrderModel orderModel = new OrderModel();
        orderModel.setBuyerId(orderBuyerProduct.getBuyerId());
        orderModel.setId(orderBuyerProduct.getId());
        orderModel.setOrderId(orderBuyerProduct.getOrderId());
        orderModel.setProductId(orderBuyerProduct.getProductId());
        orderModel.setPucrhasedQty(orderBuyerProduct.getPurhcasedQty());
        orderModel.setPurchaseDate(orderBuyerProduct.getPurchaseDate());
        return orderModel;
    }    
}
