public class Booking {

    private String passengerName;
    private String pickupLocation;
    private String dropLocation;
    private String time;
    private String distance;
    private boolean assigned;
    private double fare;

    private String userId;
    private String email;
    private String phone;
    private String role;

    private String assignedDriverName;

    //  Default constructor
    public Booking() {
    }

    //  Optional constructor with main fields
    public Booking(String name, String pickup, String drop, String time, String distance) {
        this.passengerName = name;
        this.pickupLocation = pickup;
        this.dropLocation = drop;
        this.time = time;
        this.distance = distance;
    }

    //  Setters
    public void setPassengerName(String name) {
        this.passengerName = name;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public void setDropLocation(String dropLocation) {
        this.dropLocation = dropLocation;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    public void setAssigned(boolean assigned) {
        this.assigned = assigned;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setAssignedDriverName(String assignedDriverName) {
        this.assignedDriverName = assignedDriverName;
    }

    //  Getters
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

    public String getDistance() {
        return distance;
    }

    public boolean isAssigned() {
        return assigned;
    }

    public double getFare() {
        return fare;
    }

    public String getUserId() {
        return userId;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getRole() {
        return role;
    }

    public String getAssignedDriverName() {
        return assignedDriverName;
    }

    public void setUserDetails(String id, String email, String phone, String role) {
        this.userId = id;
        this.email = email;
        this.phone = phone;
        this.role = role;
    }
}