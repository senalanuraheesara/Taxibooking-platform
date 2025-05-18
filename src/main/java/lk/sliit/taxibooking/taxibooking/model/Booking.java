package lk.sliit.taxibooking.taxibooking.model;

public class Booking {
    private String passengerName;
    private String pickupLocation;
    private String dropLocation;
    private String time;
    private String distance;
    private boolean assigned;

    public Booking(String name, String pickup, String drop, String time, String distance) {
        this.passengerName = name;
        this.pickupLocation = pickup;
        this.dropLocation = drop;
        this.time = time;
        this.distance = distance;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public String getDropLocation() {
        return dropLocation;
    }

    public String getTime() {
        return time;
    }

    public String getDistance() { return distance;}

    public boolean isAssigned() {return true;}

    public void setAssigned(boolean assigned) {
        this.assigned = assigned;
    }
}
