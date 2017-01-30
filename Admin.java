
package app.domain;

import app.model.AdminModel;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
public class Admin implements Serializable  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int adminId;

    @Column(name = "admin_name")
    private String adminName;

    @Column(name = "admin_email")
    private String adminEmail;
           
    @Column(name = "username")
    private String username;
    
    @Column(name = "password")
    private String password;
    
    public Admin() {
        
    }
    
    public Admin(String name) {
        this.adminName = name;
    }
    
    public int getAdminId() {
        return adminId;
    }
    
    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }
    
    public String getAdminName() {
        return adminName;
    }
    
    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }
   
    public String getAdminEmail() {
        return adminEmail;
    }
    
    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
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
      
    public void repack(AdminModel adminModel) {   //repacks sellerModel attrs to seller
        this.setAdminId(adminModel.getAdminId());
        this.setAdminName(adminModel.getAdminName());
        this.setAdminEmail(adminModel.getAdminEmail());
        this.setUsername(adminModel.getUsername());
        this.setPassword(adminModel.getPassword());
    }
}
