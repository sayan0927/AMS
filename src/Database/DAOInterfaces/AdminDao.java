package Database.DAOInterfaces;

import Models.Admin;
import Models.Application;

import java.util.ArrayList;

public interface AdminDao {
    public boolean adminLoginValidate(String adminId, String adminPass);

    public void updateAdmin(Admin admin);

    public Admin getAdminDetails(String adminId);

    public boolean addNewAdmin(Admin admin);

    public  ArrayList<Admin> getAllAdmins();
}
