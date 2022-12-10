package Database.DAOInterfaces;

import Models.Application;

import java.util.ArrayList;

public interface ApplicationDAO {



    boolean addNewApplication(Application application);

    public void rejectApplication(String applicationId);

    public ArrayList<Application> getAllApplications();

    public Application getApplicationDetails(String appId);

    public boolean applicationAccepted(String applierId);

    public boolean applicationRejected(String applierId);

    public boolean applicationPending(String applierId);

    public void setApplicationStatusToAccepted(String applierId);
}
