package Database.DAOInterfaces;

import Models.Course;
import Models.Faculty;

import java.util.ArrayList;

public interface CourseDAO {

    public ArrayList<Course> getAllCourses();

    public String getCourseName(String course_id);

    public boolean addNewCourse(Course course);

    public String getOfferingDepartmentId(String courseId);

    public void removeInvalidCourse(String courseId);

    public Faculty getHOD(String course_id);
}
