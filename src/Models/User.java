
package Models;


public class User {

   private String firstName,lastName, userId,email,password,contact,address;

   public User(){
       
   }
    public User( String userName, String firstName, String lastName, String email, String password,  String contact, String address) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.userId = userName;
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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
