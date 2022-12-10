package Models;

public class Application {

    private String applierId;
    private String firstName;
    private String lastName;
    private String email;
    private String contact;
    private String address;
    private String courseId;

    private String applicationStatus;
    private String score;

    public String getHostelRequired() {
        return hostelRequired;
    }

    private String hostelRequired;





    public Application(String applierId, String firstName, String lastName, String email, String contact, String address, String courseId, String applicationStatus, String score,String hostelRequired) {
        this.applierId = applierId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.contact = contact;
        this.address = address;
        this.courseId = courseId;
        this.applicationStatus = applicationStatus;
        this.score = score;
        this.hostelRequired=hostelRequired;
    }




    public String getApplierId() {
        return applierId;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getContact() {
        return contact;
    }

    public String getAddress() {
        return address;
    }

    public String getCourseId() {
        return courseId;
    }

    public String getApplicationStatus() {
        return applicationStatus;
    }

    public String getScore() {
        return score;
    }






}
