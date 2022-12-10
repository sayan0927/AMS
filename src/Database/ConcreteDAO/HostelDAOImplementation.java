package Database.ConcreteDAO;

import Database.DAOInterfaces.HostelDAO;
import Database.DatabaseController;
import Models.Faculty;
import Models.Hostel;
import Util.Config;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class HostelDAOImplementation implements HostelDAO {

    Connection conn;

    private static HostelDAOImplementation hostelDAOImplementation;

    private HostelDAOImplementation() throws ClassNotFoundException, SQLException
    {
        establishConnection();
    }

    public static HostelDAOImplementation getInstance() throws SQLException, ClassNotFoundException {
        if(hostelDAOImplementation==null)
            hostelDAOImplementation=new HostelDAOImplementation();
        return hostelDAOImplementation;
    }

    private void establishConnection() throws ClassNotFoundException, SQLException {


        Class.forName("com.mysql.jdbc.Driver");
        String databaseUrl="jdbc:mysql:"+ Config.databaseURL;
        this.conn= DriverManager.getConnection(databaseUrl, Config.databaseUsername, Config.databasePassword);
    }

    @Override
    public String getHostelName(String hostel_id) {
        String hname=null;

        try {
            String sql="SELECT hostel_name from hostel where hostel_id=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,hostel_id);

            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next())
                hname=resultSet.getString(1);

            return hname;


        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Faculty getWarden(String wardenId) {
        Faculty faculty=null;

        try {
            String sql = "SELECT * from faculty,hostel WHERE faculty_id=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,wardenId);
            ResultSet resultSet= preparedStatement.executeQuery();

            while (resultSet.next())
                faculty = new Faculty(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),
                        resultSet.getString(4),resultSet.getString(5),resultSet.getString(6),resultSet.getString(7));

            return faculty;


        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }

    @Override
    public Hostel getHostel(String hostelId) {
        Hostel hostel=null;

        try {
            String sql="SELECT * FROM hostel where hostel_id=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,hostelId);
            ResultSet resultSet= preparedStatement.executeQuery();

            while (resultSet.next())
                hostel=new Hostel(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3));

            return hostel;

        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }

    @Override
    public ArrayList<Hostel> getAllHostels() {
        ArrayList<Hostel> list=new ArrayList<>();
        Hostel hostel=null;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from hostel");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                hostel =new Hostel(rs.getString(1),rs.getString(2),
                        rs.getString(3));

                list.add(hostel);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }
        return list;
    }

    @Override
    public boolean addNewHostel(Hostel hostel) {
        try {
            String sql = "INSERT into hostel(hostel_id,hostel_name,warden_id)"
                    +"Values(?,?,?)";

            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1, hostel.getHostelId());
            preparedStatement.setString(2, hostel.getHostelName());
            preparedStatement.setString(3, hostel.getWardenId());
            preparedStatement.executeUpdate();





            return true;


        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    @Override
    public boolean changeWarden(String hostelId, String wardenId) {
        try {
            String sql="UPDaTE hostel set warden_id=? where hostel_id=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,wardenId);
            preparedStatement.setString(2,hostelId);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }
}
