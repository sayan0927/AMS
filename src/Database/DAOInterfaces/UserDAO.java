package Database.DAOInterfaces;

import Models.Student;
import Models.User;

import java.util.ArrayList;

public interface UserDAO {

    public ArrayList<User> getAllUsers();

    public User getUserDetails(String userId);

    public boolean userLoginValidate(String userName, String userPass);

    public void delUser(String uid);

    public boolean addNewUser(User user);

    public void updateUser(User user);


}
