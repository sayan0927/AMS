package Models;

public class Hostel {

    private String  hostelId;
    private String hostelName;

    private String wardenId;

    public String getHostelId() {
        return hostelId;
    }

    public String getHostelName() {
        return hostelName;
    }

    public String getWardenId() {
        return wardenId;
    }



    public Hostel(String hostelId, String hostelName, String wardenId) {
        this.hostelId = hostelId;
        this.hostelName = hostelName;
        this.wardenId = wardenId;
    }


}
