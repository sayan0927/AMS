package Models;

public class Admin {


    private String firstName,lastName, adminId,email,password,contact,address;

    public Admin(){

    }
    public Admin( String firstName, String lastName, String adminId, String email, String password,  String contact, String address) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.adminId = adminId;
        this.email = email;
        this.password = password;

        this.contact = contact;

        this.address = address;
    }



    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }



    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


}
