
package app.model;

import app.domain.Admin;

public class AdminModel {
           
    private int adminId;
    private String adminName;
    private String adminEmail;
    private String username;
    private String password;
    
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
    
    public void repack(Admin admin) {
        this.setAdminId(admin.getAdminId());
        this.setAdminName(admin.getAdminName());        
        this.setAdminEmail(admin.getAdminEmail());        
        this.setUsername(admin.getUsername());
        this.setPassword(admin.getPassword()); 
    }
}
