
package app.dao;

import app.domain.Buyer;


public interface BuyerDAO {
    public void registerBuyer(Buyer buyer);
    public boolean checkBuyer(Buyer buyer);
    public Buyer getBuyerById(Integer id);
    public void updateBuyerCC(Buyer buyer, Double amount);   
}
