package Models;

public class Course {

    private String courseId;
    private String courseLevel;
    private String courseName;

    private String offeringDepartment;

    public String getCourseId() {
        return courseId;
    }

    public String getCourseLevel() {
        return courseLevel;
    }

    public String getCourseName() {
        return courseName;
    }

    public String getOfferingDepartment() {
        return offeringDepartment;
    }



    public Course(String courseId, String courseLevel, String courseName, String offeringDepartment) {
        this.courseId = courseId;
        this.courseLevel = courseLevel;
        this.courseName = courseName;
        this.offeringDepartment = offeringDepartment;
    }


}
