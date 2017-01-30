package app.domain;

import app.model.BuyerModel;
import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "buyer")
public class Buyer implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer buyerId;

    @Column(name = "buyer_name")
    private String buyerName;

    @Column(name = "buyer_address")
    private String buyerAddress;

    @Column(name = "buyer_email")
    private String buyerEmail;

    @Column(name = "reg_date", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP") //inserts current timestamp in db
    private Timestamp registrationDate;

    @Column(name = "cc_balance")
    private Double ccBalance;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
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

    public void repack(BuyerModel buyerModel) {  //repacks buyer into buyerModel
        this.setBuyerAddress(buyerModel.getBuyerAddress());
        this.setBuyerEmail(buyerModel.getBuyerEmail());
        this.setBuyerId(buyerModel.getBuyerId());
        this.setBuyerName(buyerModel.getBuyerName());
        this.setCcBalance(buyerModel.getCcBalance());
        this.setPassword(buyerModel.getPassword());
        this.setRegistrationDate(buyerModel.getRegistrationDate());
        this.setUsername(buyerModel.getUsername());
    }
}
