
package app.controller;

import app.dao.BuyerDAO;
import app.domain.Buyer;
import app.domain.OrderBuyerProduct;
import app.model.BuyerModel;
import app.service.BuyerService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BuyerController {

    @Autowired
    private BuyerService buyerService;
    
    @Autowired
    private BuyerDAO buyerDAO;

    @RequestMapping(value = "/registerBuyer")
    public String getRegisterBuyer(Model model) {
        model.addAttribute("buyerModel", new BuyerModel());
        return "registerBuyer";
    }

    @RequestMapping(value = "/registerBuyer", method = RequestMethod.POST) //passes buyerModel to service layer to register him/her but performs server validation first
    public String postRegisterBuyer(@Valid @ModelAttribute("buyerModel") BuyerModel buyerModel, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "registerBuyer";
        }
        getBuyerService().registerBuyer(buyerModel);
        return "successfullyRegistered";  
    }
    
    @RequestMapping(value = "/LoginBuyer")
    public String getLoginBuyer(Model model) {
        model.addAttribute("buyerModel", new BuyerModel());
        return "buyerAccountLogin";
    }

    @RequestMapping(value = "/LoginBuyer", method = RequestMethod.POST) //checks if the credentials exist and if yes, it opens the session
    public String postLoginBuyer(HttpServletRequest request, @ModelAttribute("buyerModel") BuyerModel buyerModel) {
        if (getBuyerService().checkBuyer(buyerModel)) {
            request.getSession(true).setAttribute("logged", true);
            return "homePageBuyer";
        }
        return "unauthorised";
    }
    
    @RequestMapping(value = "/depositMoney")
    public String getDepositMoney(@RequestParam Integer buyerId, Model model){
        return "depositMoney";
    }    

    @RequestMapping(value = "depositMoney", method = RequestMethod.POST)  //gets the buyer id from form, takes the buyer and adds the passed amount to his/her CC balance
    public String postDepositMoney(@RequestParam Integer buyerId, @RequestParam Double amount) {        
        Buyer buyer = getBuyerDAO().getBuyerById(buyerId);
        getBuyerDAO().updateBuyerCC(buyer, amount); 
        return "depositedSuccessfully";
    }
    
    @RequestMapping(value = "buyerOrders") 
    public String getBuyerOrders(@RequestParam Integer buyerId) {        
        return "buyerOrders";
    }
    
    @RequestMapping(value = "logoutBuyer") //logs out the buyer
    public String getBuyerLogout(HttpServletRequest request, @RequestParam Integer buyerId, @ModelAttribute("buyerModel") BuyerModel buyerModel) {
        request.getSession(true).invalidate();
        return "buyerAccountLogin";
    }
    
    public BuyerService getBuyerService() {
        return buyerService;
    }
    
    public void setBuyerService(BuyerService buyerService) {
        this.buyerService = buyerService;
    }
   
    public BuyerDAO getBuyerDAO() {
        return buyerDAO;
    }
    
    public void setBuyerDAO(BuyerDAO buyerDAO) {
        this.buyerDAO = buyerDAO;
    }    
}
