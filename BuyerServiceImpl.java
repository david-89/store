
package app.service;

import app.dao.BuyerDAO;
import app.domain.Buyer;
import app.model.BuyerModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BuyerServiceImpl implements BuyerService {

    @Autowired
    private BuyerDAO buyerDAO;
    
    @Override
    public void registerBuyer(BuyerModel buyerModel) { //transforms buyerModel into buyer and saves it in DB
        Buyer buyer = new Buyer();
        buyer.repack(buyerModel);
        getBuyerDAO().registerBuyer(buyer); 
    }
    
    @Override
    public boolean checkBuyer(BuyerModel buyerModel) {  //transforms buyerModel into buyer and checks if it exists in DB
        Buyer buyer = new Buyer();
        buyer.setUsername(buyerModel.getUsername());
        buyer.setPassword(buyerModel.getPassword());
        if (getBuyerDAO().checkBuyer(buyer)) {
            return true;
        }        
        return false;
    }
    
    @Override
    public BuyerModel getBuyerById(Integer id) {
        Buyer buyer = buyerDAO.getBuyerById(id);
        if (buyer == null) {
            return new BuyerModel();
        }
        return repack(buyer);
    }
    
    @Override
    public void updateBuyerCC(BuyerModel buyerModel, Double amount) {
        Buyer buyer = new Buyer();
        buyer.repack(buyerModel);
        getBuyerDAO().updateBuyerCC(buyer, amount);
    }
    
    public BuyerDAO getBuyerDAO() {
        return buyerDAO;
    }

    public void setBuyerDAO(BuyerDAO buyerDAO) {
        this.buyerDAO = buyerDAO;
    }
    
    public BuyerModel repack(Buyer buyer) {
        BuyerModel buyerModel = new BuyerModel();
        buyerModel.setBuyerAddress(buyer.getBuyerAddress());
        buyerModel.setBuyerEmail(buyer.getBuyerEmail());
        buyerModel.setBuyerId(buyer.getBuyerId());
        buyerModel.setBuyerName(buyer.getBuyerName());
        buyerModel.setCcBalance(buyer.getCcBalance());
        buyerModel.setPassword(buyer.getPassword());
        buyerModel.setRegistrationDate(buyer.getRegistrationDate());
        buyerModel.setUsername(buyer.getUsername()); 
        return buyerModel;
    }
}
