package com.taxi.booking.service;

import com.taxi.booking.model.Booking;
import java.util.LinkedList;
import java.util.Queue;

public class RideManager {
    private Queue<Booking> rideQueue = new LinkedList<>();

    public void addBooking(Booking booking) {
        rideQueue.add(booking);
    }

    public Queue<Booking> getAllBookings() {
        return rideQueue;
    }

    public Booking assignDriver() {
        Booking next = rideQueue.peek();
        if (next != null && !next.isAssigned()) {
            next.setAssigned(true);
        }
        return next;
    }

    public Booking removeBooking() {
        return rideQueue.poll();
    }
}

