package Database.DAOInterfaces;

import Models.Student;

import java.util.ArrayList;

public interface StudentDAO {

    public boolean addNewStudent(Student student);

    public ArrayList<Student> getAllStudents();

    public Student getStudent(String roll);

    public boolean appliedForHostel(String roll);
    public boolean studentLoginValidate(String roll, String userPass);
}
