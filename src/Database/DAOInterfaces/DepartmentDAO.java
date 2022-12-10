package Database.DAOInterfaces;

import Models.Department;
import Models.Faculty;

import java.util.ArrayList;

public interface DepartmentDAO {

    public ArrayList<Department> getAllDepartments();

    public Department getDepartment(String deptId);

    public boolean addNewDepartment(Department department);

    public   boolean changeHod(String departmentId,String newHodId);

    public ArrayList<Faculty> getFacultiesInDepartment(String deptId);

    public ArrayList<Faculty> getPotentialHODs();



}
