
package app.controller;

import app.dao.BuyerDAO;
import app.dao.OrderDAO;
import app.dao.ProductDAO;
import app.domain.Buyer;
import app.domain.Product;
import app.model.OrderModel;
import app.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController {

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private BuyerDAO buyerDAO;

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/placeOrder")
    public String getPlaceOrder(@RequestParam Integer buyerId, Model model) {   
        model.addAttribute("orderModel", new OrderModel());
        return "placeOrder";
    }

    @RequestMapping(value = "/placeOrder", method = RequestMethod.POST) //writes an order in order_table
    public String postPlaceOrder(@RequestParam Integer buyerId, @RequestParam Integer purchasedQty, @RequestParam Integer id, @ModelAttribute("orderModel") OrderModel orderModel) {
        if (getOrderDAO().checkQty(id, purchasedQty)) { //checks if the passed qty is available
            if (getOrderDAO().checkCCBalance(buyerId, id, purchasedQty)) { // checks if the buyer has sufficient funds in the account
                Product product = getProductDAO().getProductById(id); //gets the product from the passed productId
                getOrderService().registerOrder(orderModel);
                getOrderDAO().insertProductInOrder(product);
                Buyer buyer = getBuyerDAO().getBuyerById(buyerId);
                getOrderDAO().insertBuyerInOrder(buyer);
                getOrderDAO().insertQtyInOrder(purchasedQty);
                getOrderDAO().chargeCC(id, buyerId, purchasedQty);
                return "orderPlacedSuccessfully";  
            }            
            return "insufficientFunds";
        }
        return "unavailableStock";
    }
    
    @RequestMapping(value = "orderList")
    public String getOrderList(Model model) {
        return "orderList";
    }
    
    public ProductDAO getProductDAO() {
        return productDAO;
    }
    
    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }
    
    public BuyerDAO getBuyerDAO() {
        return buyerDAO;
    }
    
    public void setBuyerDAO(BuyerDAO buyerDAO) {
        this.buyerDAO = buyerDAO;
    }
    
    public OrderDAO getOrderDAO() {
        return orderDAO;
    }
    
    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }
    
    public OrderService getOrderService() {
        return orderService;
    }
    
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
}
