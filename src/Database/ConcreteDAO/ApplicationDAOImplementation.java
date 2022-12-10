package Database.ConcreteDAO;

import Database.DAOInterfaces.ApplicationDAO;
import Database.DatabaseController;
import Models.Application;
import Util.Config;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ApplicationDAOImplementation implements ApplicationDAO {

    Connection conn;

   private static ApplicationDAOImplementation applicationDAOImplementation;

    private ApplicationDAOImplementation() throws ClassNotFoundException, SQLException
    {
        establishConnection();
    }

    public static ApplicationDAOImplementation getInstance() throws SQLException, ClassNotFoundException {
        if(applicationDAOImplementation==null)
            applicationDAOImplementation=new ApplicationDAOImplementation();
        return applicationDAOImplementation;
    }

    private void establishConnection() throws ClassNotFoundException, SQLException {


        Class.forName("com.mysql.jdbc.Driver");
        String databaseUrl="jdbc:mysql:"+ Config.databaseURL;
        this.conn= DriverManager.getConnection(databaseUrl, Config.databaseUsername, Config.databasePassword);
    }

    @Override
    public boolean addNewApplication(Application application) {
        try {
            String sql = "INSERT into application(applier_id,first_name,last_name,email,contact,address,course_id,application_status,score,hostel_required)"
                    +" Values(?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setString(1,application.getApplierId());
            preparedStatement.setString(2,application.getFirstName());
            preparedStatement.setString(3,application.getLastName());
            preparedStatement.setString(4,application.getEmail());
            preparedStatement.setString(5,application.getContact());
            preparedStatement.setString(6,application.getAddress());
            preparedStatement.setString(7,application.getCourseId());
            preparedStatement.setString(8,application.getApplicationStatus());
            preparedStatement.setString(9,application.getScore());
            preparedStatement.setString(10,application.getHostelRequired());

            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    @Override
    public void rejectApplication(String applicationId) {
        try {
            String sql="Update application"
                    + " set   application_status=? "
                    + " where applier_id=?";
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setString(1,"rejected");
            preparedStatement.setString(2,applicationId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);

        }
    }

    @Override
    public ArrayList<Application> getAllApplications() {
        ArrayList<Application> list=new ArrayList<>();
        Application application=null;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from application");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                application =new Application(rs.getString(1),rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9),rs.getString(10));

                list.add(application);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }
        return list;
    }

    @Override
    public Application getApplicationDetails(String appId) {
        Application application=null;

        try {
            String sql="SELECT * from application where applier_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1, appId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                application=new Application(rs.getString(1),rs.getString(2),rs.getString(3)
                        ,rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
                        rs.getString(8),rs.getString(9),rs.getString(10) );

            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return application;
    }

    @Override
    public boolean applicationAccepted(String applierId) {
        try {
            String sql = "Select application_status from application where applier_id=?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, applierId);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                if(resultSet.getString(1).equals("accepted"))
                    return true;
            }
            return false;
        } catch (SQLException e)
        {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean applicationRejected(String applierId) {
        try {
            String sql = "Select application_status from application where applier_id=?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, applierId);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                if(resultSet.getString(1).equals("rejected"))
                    return true;
            }
            return false;
        } catch (SQLException e)
        {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean applicationPending(String applierId) {
        try {
            String sql = "Select application_status from application where applier_id=?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, applierId);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                if(resultSet.getString(1).equals("pending"))
                    return true;
            }
            return false;
        } catch (SQLException e)
        {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public void setApplicationStatusToAccepted(String applierId) {
        try {
            String sql = "UPDATE application"
                    +    " set application_status=?"
                    +     "where applier_id=?";



            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,"accepted");
            preparedStatement.setString(2,applierId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
        }
    }


}
