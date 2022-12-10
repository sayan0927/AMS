package Database.ConcreteDAO;

import Database.DAOInterfaces.FacultyDAO;
import Database.DatabaseController;
import Models.Faculty;
import Util.Config;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FacultyDAOImplementation implements FacultyDAO {

    Connection conn;

    private static FacultyDAOImplementation facultyDAOImplementation;

    private FacultyDAOImplementation() throws ClassNotFoundException, SQLException
    {
        establishConnection();
    }

    public static FacultyDAOImplementation getInstance() throws SQLException, ClassNotFoundException {
        if(facultyDAOImplementation==null)
            facultyDAOImplementation=new FacultyDAOImplementation();
        return facultyDAOImplementation;
    }

    private void establishConnection() throws ClassNotFoundException, SQLException {


        Class.forName("com.mysql.jdbc.Driver");
        String databaseUrl="jdbc:mysql:"+ Config.databaseURL;
        this.conn= DriverManager.getConnection(databaseUrl, Config.databaseUsername, Config.databasePassword);
    }

    @Override
    public Faculty getFaculty(String faculty_id) {
        Faculty faculty=null;

        try {
            String sql="SELECT * from faculty where faculty_id=?";

            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,faculty_id);
            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next())
                faculty=new Faculty(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),
                        resultSet.getString(4),resultSet.getString(5),resultSet.getString(6)
                        ,resultSet.getString(7));
            return faculty;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean fireFaculty(String faculty_id) {
        try {
            String sql= "DELETE from faculty where faculty_id=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,faculty_id);

            preparedStatement.executeUpdate();
            return true;


        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public ArrayList<Faculty> getAllFaculties() {
        ArrayList<Faculty> list=new ArrayList<>();
        Faculty faculty=null;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from faculty ORDER BY department_id");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                faculty =new Faculty(rs.getString(1),rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),
                        rs.getString(7));


                list.add(faculty);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }
        return list;
    }

    @Override
    public boolean editFaculty(Faculty faculty) {
        try {
            String sql = "UPDATE faculty set firstname=?,lastname=?,email=?,contact=?,department_id=?,address=? where faculty_id=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1, faculty.getFirstName());
            preparedStatement.setString(2, faculty.getLastName());
            preparedStatement.setString(3,faculty.getEmail());
            preparedStatement.setString(4,faculty.getContact());
            if(faculty.getDepartment_id().equals(""))
                preparedStatement.setNull(5,Types.NULL);
            else
                preparedStatement.setString(5, faculty.getDepartment_id());
            preparedStatement.setString(6,faculty.getAddress());
            preparedStatement.setString(7,faculty.getFacultyId());

            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean addNewFaculty(Faculty faculty) {
        try {
            String sql = "INSERT into faculty(faculty_id,firstname,lastname,email,contact,department_id,address)"
                    +"Values(?,?,?,?,?,?,?)";

            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,faculty.getFacultyId());
            preparedStatement.setString(2,faculty.getFirstName());
            preparedStatement.setString(3,faculty.getLastName());
            preparedStatement.setString(4,faculty.getEmail());
            preparedStatement.setString(5,faculty.getContact());

            if(faculty.getDepartment_id().equals(""))
                preparedStatement.setNull(6, Types.NULL);
            else
                preparedStatement.setNString(6,faculty.getDepartment_id());

            preparedStatement.setString(7,faculty.getAddress());
            preparedStatement.executeUpdate();

            return true;

        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    @Override
    public String getFacultyName(String faculty_id) {
        try {
            String sql = "Select firstname,lastname" +
                    " from faculty"+
                    " where faculty_id=?";


            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,faculty_id);

            ResultSet resultSet=preparedStatement.executeQuery();

            String facultyName= "";
            if(resultSet.next())
                facultyName=resultSet.getString(1)+" "+resultSet.getString(2);

            return facultyName;


        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return "Not Found";
        }
    }
}
