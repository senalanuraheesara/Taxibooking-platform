package lk.sliit.taxibooking.taxibooking;

import java.util.LinkedList;
import java.util.Queue;

public class RideManager {

    private static Queue<Booking> rideQueue = new LinkedList<>();

    public void addBooking(Booking booking) {
        rideQueue.add(booking);
    }

    public Queue<Booking> getAllBookings() {
        return rideQueue;
    }

    public Booking assignDriver() {
        for (Booking booking : rideQueue) {
            if (!booking.isAssigned()) {
                booking.setAssigned(true);
                return booking;
            }
        }
        return null;
    }

    public Booking removeBooking() {
        return rideQueue.poll();
    }

    public void clearAllBookings() {
        rideQueue.clear();
    }

    public int getQueueSize() {
        return rideQueue.size();
    }
}