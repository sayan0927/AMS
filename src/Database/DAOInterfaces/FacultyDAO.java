package Database.DAOInterfaces;

import Models.Faculty;

import java.util.ArrayList;

public interface FacultyDAO {

    public Faculty getFaculty(String faculty_id);

    public boolean fireFaculty(String faculty_id);

    public ArrayList<Faculty> getAllFaculties();

    public boolean editFaculty(Faculty faculty);

    public boolean addNewFaculty(Faculty faculty);

    public String getFacultyName(String faculty_id);
}
