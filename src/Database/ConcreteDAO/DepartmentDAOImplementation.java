package Database.ConcreteDAO;

import Database.DAOInterfaces.DepartmentDAO;
import Database.DatabaseController;
import Models.Department;
import Models.Faculty;
import Util.Config;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DepartmentDAOImplementation implements DepartmentDAO {


    Connection conn;

    private static DepartmentDAOImplementation departmentDAOImplementation;

    private DepartmentDAOImplementation() throws ClassNotFoundException, SQLException
    {
        establishConnection();
    }

    public static DepartmentDAOImplementation getInstance() throws SQLException, ClassNotFoundException {
        if(departmentDAOImplementation==null)
            departmentDAOImplementation=new DepartmentDAOImplementation();
        return departmentDAOImplementation;
    }

    private void establishConnection() throws ClassNotFoundException, SQLException {


        Class.forName("com.mysql.jdbc.Driver");
        String databaseUrl="jdbc:mysql:"+ Config.databaseURL;
        this.conn= DriverManager.getConnection(databaseUrl, Config.databaseUsername, Config.databasePassword);
    }

    @Override
    public ArrayList<Department> getAllDepartments() {
        ArrayList<Department> list=new ArrayList<>();
        Department department=null;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from department");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                department =new Department(rs.getString(1),rs.getString(2),
                        rs.getString(3));
                list.add(department);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }
        return list;
    }

    @Override
    public Department getDepartment(String deptId) {

        Department department=null;

        try {
            String sql="SELECT * FROM department where department_id=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,deptId);
            ResultSet resultSet= preparedStatement.executeQuery();

            while (resultSet.next())
                department=new Department(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3));

            return department;

        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }

    @Override
    public boolean addNewDepartment(Department department) {
        try {
            String sql = "INSERT into department(department_id,department_name,hod_id)"
                    +"Values(?,?,?)";

            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1, department.getDepartmentId());
            preparedStatement.setString(2, department.getDepartmentName());
            preparedStatement.setString(3, department.getHodID());
            preparedStatement.executeUpdate();




            return updateFacultyDepartment(department.getHodID(), department.getDepartmentId());


        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    @Override
    public boolean changeHod(String departmentId, String newHodId) {
        try {
            String sql="UPDaTE department set hod_id=? where department_id=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,newHodId);
            preparedStatement.setString(2,departmentId);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    @Override
    public ArrayList<Faculty> getFacultiesInDepartment(String deptId) {
        ArrayList<Faculty> list=new ArrayList<>();
        Faculty faculty=null;

        try {
            String sql = "SELECT * from faculty WHERE department_id=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,deptId);
            ResultSet resultSet= preparedStatement.executeQuery();

            while (resultSet.next())
            {
                faculty = new Faculty(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3),
                        resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getString(7));
                list.add(faculty);
            }
            return list;


        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }

    @Override
    public ArrayList<Faculty> getPotentialHODs() {
        ArrayList<Faculty> list=new ArrayList<>();
        try {
            String sql = "SELECT * from faculty where department_id IS NULL";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);


            ResultSet resultSet= preparedStatement.executeQuery();

            while (resultSet.next())
            {
                Faculty faculty = new Faculty(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),
                        resultSet.getString(4),resultSet.getString(5),resultSet.getString(6),resultSet.getString(7));
                list.add(faculty);
            }
            return list;
        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return list;
        }
    }

    public boolean updateFacultyDepartment(String faculty_id,String department_id)
    {


        try {
            String sql="Update faculty"
                    + " set   department_id=? "
                    + " where faculty_id=?";
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setString(1,department_id);
            preparedStatement.setString(2,faculty_id);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }

    }
}
