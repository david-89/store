
package app.service;

import app.model.AdminModel;

public interface AdminService {
    public void registerAdmin(AdminModel adminModel);
    public boolean checkAdmin(AdminModel adminModel);
}
