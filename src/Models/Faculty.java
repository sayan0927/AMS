package Models;

public class Faculty {

    private String faculty_id;
    private String firstName;
    private String lastName;
    private String email;
    private String contact;

    private String department_id;

    private String address;

    public Faculty(String faculty_id, String firstName, String lastName, String email, String contact, String department_id, String address) {
        this.faculty_id = faculty_id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.contact = contact;

        this.department_id = department_id;
        this.address = address;
    }

    public String getFacultyId() {
        return faculty_id;
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

    public String getDepartment_id() {
        return department_id;
    }

    public String getAddress() {
        return address;
    }




}
