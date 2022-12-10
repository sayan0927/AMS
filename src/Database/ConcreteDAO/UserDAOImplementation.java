package Database.ConcreteDAO;

import Database.DAOInterfaces.UserDAO;
import Database.DatabaseController;
import Models.User;
import Util.Config;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAOImplementation implements UserDAO {

    Connection conn;

    private static UserDAOImplementation userDAOImplementation;

    private UserDAOImplementation() throws ClassNotFoundException, SQLException
    {
        establishConnection();
    }

    public static UserDAOImplementation getInstance() throws SQLException, ClassNotFoundException {
        if(userDAOImplementation==null)
            userDAOImplementation=new UserDAOImplementation();
        return userDAOImplementation;
    }

    private void establishConnection() throws ClassNotFoundException, SQLException {


        Class.forName("com.mysql.jdbc.Driver");
        String databaseUrl="jdbc:mysql:"+ Config.databaseURL;
        this.conn= DriverManager.getConnection(databaseUrl, Config.databaseUsername, Config.databasePassword);
    }

    @Override
    public ArrayList<User> getAllUsers() {
        ArrayList<User> list=new ArrayList<>();
        User user=null;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from users");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                user =new User(rs.getString(1),rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
                list.add(user);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }
        return list;
    }

    @Override
    public User getUserDetails(String userId) {
        User userDetails=null;
        try {
            String sql="SELECT * from users where user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1, userId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                userDetails=new User(rs.getString(1),rs.getString(2),rs.getString(3)
                        ,rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userDetails;
    }

    @Override
    public boolean userLoginValidate(String userName, String userPass) {

       try {
           String sql="SELECT * FROM users\n"
                   + "WHERE user_id=?";

           PreparedStatement pstm=conn.prepareStatement(sql);
           pstm.setString(1,userName);
           ResultSet rs=pstm.executeQuery();
           String hashedpass;
           while(rs.next()){
               hashedpass=rs.getString("password");

               if( BCrypt.checkpw(userPass,hashedpass)){
                   return true;
               }
           }//end while
           return false;
       } catch (SQLException e) {
           e.printStackTrace();
           return false;
       }

    }

    @Override
    public void delUser(String uid) {
        try {
            String sql="DELETE from users where user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,uid);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public boolean addNewUser(User user) {
        try {
            String sql="INSERT into users(user_id,first_name,last_name,email,password,contact_no,address) "
                    + "Values(?,?,?,?,?,?,?)";

            String hashedPassword= BCrypt.hashpw(user.getPassword(),BCrypt.gensalt(12));

            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,user.getUserId());
            pstm.setString(2,user.getFirstName() );
            pstm.setString(3,user.getLastName() );
            pstm.setString(4,user.getEmail() );
            pstm.setString(5,hashedPassword );
            pstm.setString(6,user.getContact() );
            pstm.setString(7,user.getAddress() );
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public void updateUser(User user) {
        try {
            String sql="Update users"
                    + " set user_id=? , first_name=? , last_name=? , email=? , password=?  , contact_no=? , address=? "
                    + " where user_id=?";

            String hashedPassword= BCrypt.hashpw(user.getPassword(),BCrypt.gensalt(12));

            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,user.getUserId() );
            pstm.setString(2,user.getFirstName() );
            pstm.setString(3,user.getLastName());
            pstm.setString(4,user.getEmail() );
            pstm.setString(5,hashedPassword );
            pstm.setString(6,user.getContact() );
            pstm.setString(7,user.getContact() );
            pstm.setString(8,user.getUserId());
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
