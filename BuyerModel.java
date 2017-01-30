
package app.model;

import app.domain.Buyer;
import java.sql.Timestamp;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class BuyerModel {
    
    private Integer buyerId; 
    private String buyerName;
    
    @Size(min = 5, message = "Must contain at least 5 characters")
    private String buyerAddress;
    
    @Pattern(regexp = "^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$", message = "Invalid email")
    private String buyerEmail;
    
    private Timestamp registrationDate;
        
    @Digits(integer = 1000000000, fraction = 2)
    private Double ccBalance;
        
    @Size(min = 5, message = "Must contain at least 5 letters")
    private String username;
        
    @Pattern(regexp = "\\S*(\\S*([a-zA-Z]\\S*[0-9])|([0-9]\\S*[a-zA-Z]))\\S*", message = "Must contain at least 8 characters, both letters and numbers!")
    private String password;
    
    public Integer getBuyerId() {
        return buyerId;
    }
    
    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }

    public String getBuyerAddress() {
        return buyerAddress;
    }

    public void setBuyerAddress(String buyerAddress) {
        this.buyerAddress = buyerAddress;
    }

    public String getBuyerEmail() {
        return buyerEmail;
    }

    public void setBuyerEmail(String buyerEmail) {
        this.buyerEmail = buyerEmail;
    }

    public Timestamp getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Timestamp registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Double getCcBalance() {
        return ccBalance;
    }

    public void setCcBalance(Double ccBalance) {
        this.ccBalance = ccBalance;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public void repack(Buyer buyer) {
        this.setBuyerAddress(buyer.getBuyerAddress());
        this.setBuyerEmail(buyer.getBuyerEmail());
        this.setBuyerId(buyer.getBuyerId());
        this.setBuyerName(buyer.getBuyerName());
        this.setCcBalance(buyer.getCcBalance());
        this.setPassword(buyer.getPassword());
        this.setRegistrationDate(buyer.getRegistrationDate());
        this.setUsername(buyer.getUsername());       
    }
}
