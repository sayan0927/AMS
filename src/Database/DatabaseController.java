//THIS CLASS IS REQUIRED FOR DATABASE OPERATIONS
package Database;

import Database.ConcreteDAO.*;
import Database.DAOInterfaces.*;
import Models.*;
import Util.Config;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

 public class DatabaseController {

     ApplicationDAO applicationDAO;
     CourseDAO courseDAO;

     HostelDAO hostelDAO;

     DepartmentDAO departmentDAO;

     UserDAO userDAO;

     FacultyDAO facultyDAO;

     AdminDao adminDao;

     StudentDAO studentDAO;

     private Connection conn;
    
    public DatabaseController() throws ClassNotFoundException, SQLException {
        establishConnection();
        applicationDAO = ApplicationDAOImplementation.getInstance();
        courseDAO = CourseDAOImplementation.getInstance();
        departmentDAO= DepartmentDAOImplementation.getInstance();
        hostelDAO=HostelDAOImplementation.getInstance();
        userDAO=UserDAOImplementation.getInstance();
        facultyDAO= FacultyDAOImplementation.getInstance();
        adminDao= AdminDAOImplementation.getInstance();
        studentDAO=StudentDAOImplementation.getInstance();
    }

    
    private void establishConnection() throws ClassNotFoundException, SQLException {


            Class.forName("com.mysql.jdbc.Driver");

            String databaseUrl="jdbc:mysql:"+ Config.databaseURL;
            conn= DriverManager.getConnection(databaseUrl, Config.databaseUsername, Config.databasePassword);
    }
    
    public ArrayList<User> getAllUsers(){
       return userDAO.getAllUsers();
    }


    public Faculty getFaculty(String faculty_id)
    {
       return facultyDAO.getFaculty(faculty_id);
    }
     public ArrayList<Department> getAllDepartments(){
        return departmentDAO.getAllDepartments();
     }

     public ArrayList<Course> getAllCourses(){

        return courseDAO.getAllCourses();
     }

     public boolean fireFaculty(String faculty_id)
     {
         return facultyDAO.fireFaculty(faculty_id);
     }

     public ArrayList<Student> getAllStudents()
     {

         return studentDAO.getAllStudents();

     }

     public Faculty getHOD(String course_id)
     {
        return courseDAO.getHOD(course_id);
     }

     public String getCourseName(String course_id)
     {
         return courseDAO.getCourseName(course_id);
     }


     public String getHostelName(String hostel_id)
     {
         return hostelDAO.getHostelName(hostel_id);
     }


     public ArrayList<Faculty> getAllFaculties(){
        return facultyDAO.getAllFaculties();
     }

     public Student getStudent(String roll)
     {
         return studentDAO.getStudent(roll);
     }


     public Faculty getWarden(String wardenId)
     {
         return hostelDAO.getWarden(wardenId);
     }
     public Hostel getHostel(String hostelId)
     {
        return hostelDAO.getHostel(hostelId);
     }

     public Department getDepartment(String deptId)
     {
        return departmentDAO.getDepartment(deptId);

     }

     public boolean editFaculty(Faculty faculty)
     {
         if(duplicateMail(faculty.getFacultyId(),faculty.getEmail()) || duplicateContact(faculty.getFacultyId(),faculty.getContact()))
             return false;

        return facultyDAO.editFaculty(faculty);
     }
     public ArrayList<Faculty> getFacultiesInDepartment(String deptId)
     {
         return departmentDAO.getFacultiesInDepartment(deptId);
     }

     public boolean appliedForHostel(String roll)
     {
        return studentDAO.appliedForHostel(roll);
     }

     public void rejectApplication(String applicationId) throws SQLException, ClassNotFoundException {
         applicationDAO.rejectApplication(applicationId);

     }

     public ArrayList<Hostel> getAllHostels(){
         return hostelDAO.getAllHostels();
     }

     public ArrayList<Application> getAllApplications() throws SQLException, ClassNotFoundException {

        return applicationDAO.getAllApplications();
     }



     public User getUserDetails(String userId){
         return userDAO.getUserDetails(userId);
     }



     public Admin getAdminDetails(String adminId){
         return adminDao.getAdminDetails(adminId);
     }

     public Application getApplicationDetails(String appId){

        return applicationDAO.getApplicationDetails(appId);
     }

    public boolean addNewDepartment(Department department)
    {
        return departmentDAO.addNewDepartment(department);

    }

     public boolean addNewHostel(Hostel hostel)
     {
        return hostelDAO.addNewHostel(hostel);
     }


     public ArrayList<Faculty> getPotentialHODs()
     {
        return departmentDAO.getPotentialHODs();
     }

     public boolean addNewFaculty(Faculty faculty)
     {
         if(duplicateMail(faculty.getFacultyId(),faculty.getEmail()) || duplicateContact(faculty.getFacultyId(),faculty.getContact()))
             return false;

        return facultyDAO.addNewFaculty(faculty);
     }

     public String getFacultyName(String faculty_id)
     {
         return facultyDAO.getFacultyName(faculty_id);
     }



     public boolean addNewCourse(Course course)
     {
        return courseDAO.addNewCourse(course);
     }

     public boolean addNewApplication(Application application)
     {
        return applicationDAO.addNewApplication(application);
     }

     public boolean applicationAccepted(String applierId) {

        return applicationDAO.applicationAccepted(applierId);

     }

     public boolean applicationRejected(String applierId)
     {

        return applicationDAO.applicationRejected(applierId);
     }
     public boolean applicationPending(String applierId)
     {
         return applicationDAO.applicationPending(applierId);
     }
     public void addToRollConventions(String course_id,String rollPrefix,String rollSuffix)
     {
         try {
             String sql = "INSERT into roll_name_conventions(course_id,roll_prefix,roll_suffix)"
                     +"Values(?,?,?)";

             PreparedStatement preparedStatement= conn.prepareStatement(sql);
             preparedStatement.setString(1,course_id);
             preparedStatement.setString(2,rollPrefix);
             preparedStatement.setString(3,rollSuffix);
             preparedStatement.executeUpdate();


         } catch (SQLException e) {
             Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);

         }
     }

     public void removeInvalidCourse(String courseId)
     {
         courseDAO.removeInvalidCourse(courseId);
     }
    
    public boolean addNewUser(User user)
    {
        if(duplicateMail(user.getUserId(),user.getEmail()) || duplicateContact(user.getUserId(),user.getContact()))
            return false;
       return userDAO.addNewUser(user);
    }

     public boolean addNewStudent(Student student)
     {

        return studentDAO.addNewStudent(student);
     }



   public   boolean changeWarden(String hostelId,String wardenId)
     {
         return hostelDAO.changeWarden(hostelId,wardenId);
     }


     public   boolean changeHod(String departmentId,String newHodId)
     {
        return departmentDAO.changeHod(departmentId,newHodId);
     }

    private boolean duplicateMail(String id,String mail)
    {
        try {
            String sql="(SELECT user_id,email from users) UNION (SELECT admin_id,email from admin) UNION (SELECT faculty_id,email from faculty);";
            PreparedStatement preparedStatement=conn.prepareStatement(sql);

            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next())
            {
                if(mail.equals(resultSet.getString(2)) && !id.equals(resultSet.getString(1))) {
                    System.out.println(id+"  "+resultSet.getString(1));
                    return true;
                }
            }

            return false;

        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }


     private boolean duplicateContact(String id,String contact)
     {
         try {
             String sql="(SELECT user_id,contact_no from users) UNION (SELECT admin_id,contact_no from admin) UNION (SELECT faculty_id,contact from faculty);";
             PreparedStatement preparedStatement=conn.prepareStatement(sql);

             ResultSet resultSet=preparedStatement.executeQuery();

             while (resultSet.next())
             {
                 if(contact.equals(resultSet.getString(2)) && !id.equals(resultSet.getString(1))) {
                     System.out.println(id+"  "+resultSet.getString(1)+" yo");
                     return true;
                 }
             }

             return false;

         } catch (SQLException e) {
             e.printStackTrace();
             return true;
         }
     }




     String stringifyRoll(int roll)
     {
         StringBuilder stringBuilder=new StringBuilder(String.valueOf(roll));


         while (stringBuilder.length()<4)
             stringBuilder.insert(0, "0");


         return stringBuilder.toString();
     }

     public List<String> getRollPrefixAndSuffix(String courseId)
     {
         try{
             String sql="SELECT roll_prefix,roll_suffix from roll_name_conventions where course_id=?";
             PreparedStatement preparedStatement = conn.prepareStatement(sql);

             preparedStatement.setString(1,courseId);
             ResultSet resultSet=preparedStatement.executeQuery();

             List<String> prefixSuffix=new ArrayList<>();

             while (resultSet.next())
             {
                 prefixSuffix.add(resultSet.getString(1));
                 prefixSuffix.add(resultSet.getString(2));
             }
             return prefixSuffix;

         } catch (SQLException e) {
             Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
             return new ArrayList<>();
         }
     }

   public   String getNextRoll(String courseId)
     {
         try{
             String sql="SELECT * from student where course_id=?";
             PreparedStatement preparedStatement = conn.prepareStatement(sql);

             preparedStatement.setString(1,courseId);
             ResultSet resultSet=preparedStatement.executeQuery();

             int count=1;

             while (resultSet.next())
                 count++;

             return stringifyRoll(count);

         } catch (SQLException e) {
             Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, e);
             return "";
         }

     }

     public ArrayList<Admin> getAllAdmins()
     {
         return adminDao.getAllAdmins();
     }
     public String getOfferingDepartmentId(String courseId)
     {
       return courseDAO.getOfferingDepartmentId(courseId);
     }

     public void setApplicationStatusToAccepted(String applierId)
     {
         applicationDAO.setApplicationStatusToAccepted(applierId);
     }


    public boolean addNewAdmin(Admin admin)
    {
        if(duplicateMail(admin.getAdminId(),admin.getEmail()) || duplicateContact(admin.getAdminId(),admin.getContact()))
            return false;

       return adminDao.addNewAdmin(admin);
    }


    public void updateUser(User user)
    {
        if(duplicateMail(user.getUserId(),user.getEmail()) || duplicateContact(user.getUserId(),user.getContact()))
            return;
        userDAO.updateUser(user);
    }



     public void updateAdmin(Admin admin)
     {
        if(duplicateMail(admin.getAdminId(),admin.getEmail()) || duplicateContact(admin.getAdminId(),admin.getContact()))
            return;

         adminDao.updateAdmin(admin);
     }

    
    public boolean userLoginValidate(String userName, String userPass) {
        return userDAO.userLoginValidate(userName,userPass);
    }

     public boolean adminLoginValidate(String adminId, String adminPass) {


        return adminDao.adminLoginValidate(adminId,adminPass);

     }

     public boolean studentLoginValidate(String roll, String userPass) {
        return studentDAO.studentLoginValidate(roll,userPass);

     }

     public void delUser(String uid){
        userDAO.delUser(uid);
    }


    public void finalize(){
        try{
            if(conn!=null)
                conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
   
}