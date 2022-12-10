package Database.DAOInterfaces;

import Models.Faculty;
import Models.Hostel;

import java.util.ArrayList;

public interface HostelDAO {

    public String getHostelName(String hostel_id);

    public Faculty getWarden(String wardenId);

    public Hostel getHostel(String hostelId);

    public ArrayList<Hostel> getAllHostels();

    public boolean addNewHostel(Hostel hostel);

    public   boolean changeWarden(String hostelId,String wardenId);

}
