package Models;

public class Department {


    private String departmentId,departmentName, hodID;
    public String getDepartmentId() {
        return departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public String getHodID() {
        return hodID;
    }



    public Department(String departmentId, String departmentName, String hodID) {
        this.departmentId = departmentId;
        this.departmentName = departmentName;
        this.hodID = hodID;
    }



}
