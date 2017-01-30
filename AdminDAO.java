
package app.dao;

import app.domain.Admin;

public interface AdminDAO {
    public void registerAdmin(Admin admin);
    public boolean checkAdmin(Admin admin);
}
