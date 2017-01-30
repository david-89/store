package app.service;

import app.domain.Admin;
import app.model.AdminModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import app.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDAO adminDAO;

    @Override
    public void registerAdmin(AdminModel adminModel) {
        Admin admin = new Admin();
        admin.repack(adminModel);
        getAdminDAO().registerAdmin(admin);
    }

    @Override
    public boolean checkAdmin(AdminModel adminModel) {
        Admin admin = new Admin();
        admin.setUsername(adminModel.getUsername());
        admin.setPassword(adminModel.getPassword());
        if (getAdminDAO().checkAdmin(admin)) {
            return true;
        }
        return false;
    }

    public AdminDAO getAdminDAO() {
        return adminDAO;
    }

    public void setAdminDAO(AdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }
}
