package com.taxi.booking.model;

public class Booking {
    private String passengerName;
    private String pickupLocation;
    private String dropLocation;
    private String time;
    private boolean assigned;

    public Booking(String passengerName, String pickupLocation, String dropLocation, String time) {
        this.passengerName = passengerName;
        this.pickupLocation = pickupLocation;
        this.dropLocation = dropLocation;
        this.time = time;
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

    public boolean isAssigned() {return true;}

    public void setAssigned(boolean assigned) {
        this.assigned = assigned;
    }
}
