package Database.ConcreteDAO;

import Database.DAOInterfaces.CourseDAO;
import Database.DatabaseController;
import Models.Course;
import Models.Faculty;
import Util.Config;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CourseDAOImplementation implements CourseDAO {

    Connection conn;

    private static CourseDAOImplementation courseDAOImplementation;

    private CourseDAOImplementation() throws ClassNotFoundException, SQLException
    {
        establishConnection();
    }

    public static CourseDAOImplementation getInstance() throws SQLException, ClassNotFoundException {
        if(courseDAOImplementation==null)
            courseDAOImplementation=new CourseDAOImplementation();
        return courseDAOImplementation;
    }

    private void establishConnection() throws ClassNotFoundException, SQLException {


        Class.forName("com.mysql.jdbc.Driver");
        String databaseUrl="jdbc:mysql:"+ Config.databaseURL;
        this.conn= DriverManager.getConnection(databaseUrl, Config.databaseUsername, Config.databasePassword);
    }

    @Override
    public ArrayList<Course> getAllCourses() {
        ArrayList<Course> list=new ArrayList<>();
        Course course=null;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from course ORDER BY offering_department");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                course =new Course(rs.getString(1),rs.getString(2),
                        rs.getString(3),rs.getString(4));
                list.add(course);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }
        return list;
    }

    @Override
    public String getCourseName(String course_id) {
        String cname=null;

        try {
            String sql="SELECT course_name from course where course_id=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,course_id);

            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next())
                cname=resultSet.getString(1);

            return cname;


        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean addNewCourse(Course course) {
        try {
            String sql = "INSERT into course(course_id,course_level,course_name,offering_department)"
                    +"Values(?,?,?,?)";

            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1, course.getCourseId());
            preparedStatement.setString(2, course.getCourseLevel());
            preparedStatement.setString(3, course.getCourseName());
            preparedStatement.setString(4, course.getOfferingDepartment());
            preparedStatement.executeUpdate();

            return true;

        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    @Override
    public String getOfferingDepartmentId(String courseId) {
        try {
            String sql = "SELECT offering_department from course where course_id=?";
            PreparedStatement preparedStatement=conn.prepareStatement(sql);

            preparedStatement.setString(1,courseId);
            ResultSet resultSet=preparedStatement.executeQuery();

            String deptId = null;
            if(resultSet.next())
                deptId=resultSet.getString(1);

            return deptId;
        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return "";
        }
    }

    @Override
    public void removeInvalidCourse(String courseId) {
        try {
            String sql="DELETE from course where course_id=?";
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setString(1,courseId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Faculty getHOD(String course_id) {
        Faculty faculty=null;

        try {
            String sql="SELECT f.faculty_id,f.firstname,f.lastname,f.email,f.contact,f.department_id,f.address " +
                    "from faculty as f,department as d,course as c WHERE c.course_id=? " +
                    "and c.offering_department= d.department_id and d.hod_id=f.faculty_id";

            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,course_id);
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
}
