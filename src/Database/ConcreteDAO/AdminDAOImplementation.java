package Database.ConcreteDAO;

import Database.DAOInterfaces.AdminDao;
import Database.DatabaseController;
import Models.Admin;
import Util.Config;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminDAOImplementation implements AdminDao {

    Connection conn;

    private static AdminDAOImplementation adminDAOImplementation;

    private AdminDAOImplementation() throws ClassNotFoundException, SQLException
    {
        establishConnection();
    }

    public static AdminDAOImplementation getInstance() throws SQLException, ClassNotFoundException {
        if(adminDAOImplementation==null)
            adminDAOImplementation=new AdminDAOImplementation();
        return adminDAOImplementation;
    }

    private void establishConnection() throws ClassNotFoundException, SQLException {


        Class.forName("com.mysql.jdbc.Driver");
        String databaseUrl="jdbc:mysql:"+ Config.databaseURL;
        this.conn= DriverManager.getConnection(databaseUrl, Config.databaseUsername, Config.databasePassword);
    }

    @Override
    public boolean adminLoginValidate(String adminId, String adminPass) {
        try {
            String sql="SELECT * FROM admin\n"
                    + "WHERE admin_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,adminId);
            ResultSet rs=pstm.executeQuery();

            String pass;
            while(rs.next()){
                pass=rs.getString("password");

                if( BCrypt.checkpw(adminPass,pass)){
                    return true;
                }
            }
            return false;

        }catch (SQLException e)
        {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public void updateAdmin(Admin admin) {
        try {
            String sql="Update admin"
                    + " set first_name=? , last_name=? , admin_id=? , email=? , password=?  , contact_no=? , address=? "
                    + " where admin_id=?";

            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,admin.getFirstName() );
            pstm.setString(2,admin.getLastName() );
            pstm.setString(3,admin.getAdminId());
            pstm.setString(4,admin.getEmail() );
            pstm.setString(5,BCrypt.hashpw(admin.getPassword(),BCrypt.gensalt(12)) );
            pstm.setString(6,admin.getContact() );
            pstm.setString(7,admin.getAddress() );
            pstm.setString(8,admin.getAdminId());
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Admin getAdminDetails(String adminId) {
        Admin adminDetails=null;

        try {
            String sql="SELECT * from admin where admin_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1, adminId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                adminDetails=new Admin(rs.getString(1),rs.getString(2),rs.getString(3)
                        ,rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));

            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return adminDetails;
    }

    @Override
    public boolean addNewAdmin(Admin admin) {
        try {
            String sql="INSERT into admin(first_name,last_name,admin_id,email,password,contact_no,address) "
                    + "Values(?,?,?,?,?,?,?)";

            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,admin.getFirstName() );
            pstm.setString(2,admin.getLastName() );
            pstm.setString(3,admin.getAdminId() );
            pstm.setString(4,admin.getEmail() );
            pstm.setString(5, BCrypt.hashpw(admin.getPassword(),BCrypt.gensalt(12)) );
            pstm.setString(6,admin.getContact() );
            pstm.setString(7,admin.getAddress() );
            pstm.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public ArrayList<Admin> getAllAdmins() {

        ArrayList<Admin> list = new ArrayList<>();

        try {
            String sql = "SELECT * from admin";
            PreparedStatement preparedStatement=conn.prepareStatement(sql);

            ResultSet resultSet= preparedStatement.executeQuery();

            while (resultSet.next())
                list.add(new Admin(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),
                        resultSet.getString(5),resultSet.getString(6),resultSet.getString(7)));

            return list;

        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return list;
        }
    }
}
