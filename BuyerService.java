
package app.service;

import app.model.BuyerModel;

public interface BuyerService {
    public void registerBuyer(BuyerModel buyerModel);
    public boolean checkBuyer(BuyerModel buyerModel);
    public BuyerModel getBuyerById(Integer id);
    public void updateBuyerCC(BuyerModel buyerModel, Double amount);
}
