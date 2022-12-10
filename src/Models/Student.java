package Models;

public class Student {

    private String roll;
    private String fname;
    private String lname;
    private String email;
    private String contact;
    private String address;
    private String courseId;

    public String getPassword() {
        return password;
    }

    private String password;

    public String getRoll() {

        return roll;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
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

    public String getHostelId() {
        return hostelId;
    }

    private String hostelId;

    public Student(String roll, String fname, String lname, String email, String contact, String address, String courseId, String hostelId,String password) {
        this.roll = roll;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.contact = contact;
        this.address = address;

        this.courseId = courseId;
        this.hostelId = hostelId;
        this.password=password;
    }

    public Student(String roll, String fname, String lname, String email, String contact, String address, String courseId, String hostelId) {
        this.roll = roll;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.contact = contact;
        this.address = address;

        this.courseId = courseId;
        this.hostelId = hostelId;

    }


    @Override
    public String toString() {
        return this.roll+this.fname+this.lname+this.email+this.contact+this.address+this.hostelId+this.courseId;
    }
}
