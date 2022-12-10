package Database.ConcreteDAO;

import Database.DAOInterfaces.StudentDAO;
import Database.DatabaseController;
import Models.Student;
import Util.Config;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StudentDAOImplementation  implements StudentDAO {
    Connection conn;

    private static StudentDAOImplementation studentDAOImplementation;

    private StudentDAOImplementation() throws ClassNotFoundException, SQLException
    {
        establishConnection();
    }

    public static StudentDAOImplementation getInstance() throws SQLException, ClassNotFoundException {
        if(studentDAOImplementation==null)
            studentDAOImplementation=new StudentDAOImplementation();
        return studentDAOImplementation;
    }

    private void establishConnection() throws ClassNotFoundException, SQLException {


        Class.forName("com.mysql.jdbc.Driver");
        String databaseUrl="jdbc:mysql:"+ Config.databaseURL;
        this.conn= DriverManager.getConnection(databaseUrl, Config.databaseUsername, Config.databasePassword);
    }

    @Override
    public boolean addNewStudent(Student student) {
        try {
            String sql="INSERT into student(roll,first_name,last_name,email,contact,pass,address,course_id,hostel_id) "
                    + "Values(?,?,?,?,?,?,?,?,?)";

            System.out.println(student.getCourseId()+" "+student.getHostelId());

            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,student.getRoll());
            pstm.setString(2,student.getFname() );
            pstm.setString(3,student.getLname() );
            pstm.setString(4,student.getEmail());
            pstm.setString(5,student.getContact());
            pstm.setString(6, BCrypt.hashpw(student.getPassword(),BCrypt.gensalt(12)));
            pstm.setString(7,student.getAddress() );
            pstm.setString(8,student.getCourseId());

            if(student.getHostelId()==null)
                pstm.setNull(9, Types.NULL);
            else
                pstm.setString(9,student.getHostelId());

            pstm.executeUpdate();



            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public ArrayList<Student> getAllStudents() {
        ArrayList<Student> students=new ArrayList<>();
        Student student=null;
        PreparedStatement pstm;

        try {
            pstm=conn.prepareStatement("SELECT roll,first_name,last_name,email,contact,address,course_id,hostel_id " +
                    "from student NATURAL JOIN course ORDER BY offering_department,course_id,roll");
            ResultSet resultSet= pstm.executeQuery();

            while (resultSet.next())
            {
                student=new Student(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),
                        resultSet.getString(5),resultSet.getString(6),resultSet.getString(7),resultSet.getString(8));
                students.add(student);
            }
            return students;


        }catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Student getStudent(String roll) {
        Student student=null;

        try {
            String sql = "SELECT * from student where roll=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,roll);
            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next())
                student=new Student(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),
                        resultSet.getString(5),resultSet.getString(7),resultSet.getString(8),resultSet.getString(9));

            return student;
        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }

    @Override
    public boolean appliedForHostel(String roll) {
        try {
            String sql="SELECT hostel_id from student where roll=?";
            PreparedStatement preparedStatement= conn.prepareStatement(sql);
            preparedStatement.setString(1,roll);
            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next())
            {
                return resultSet.getString(1) != null;
            }

            return true;

        } catch (SQLException e) {
            Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
            return false;

        }
    }

    @Override
    public boolean studentLoginValidate(String roll, String userPass) {
       try {
           boolean status=false;

           String sql="SELECT * FROM student\n"
                   + "WHERE roll=?";
           PreparedStatement pstm=conn.prepareStatement(sql);
           pstm.setString(1,roll);
           ResultSet rs=pstm.executeQuery();
           String pass;
           while(rs.next()){
               pass=rs.getString("pass");

               System.out.println(userPass+"  ypp");
               if( BCrypt.checkpw(userPass,pass)){
                   return true;
               }
           }//end while
           return false;
       }catch (Exception e)
       {
           e.printStackTrace();
       }
      return false;
    }
}
