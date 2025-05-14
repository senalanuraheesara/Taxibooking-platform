package com.taxi.booking.servlet;

import com.taxi.booking.model.Booking;
import com.taxi.booking.service.RideManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    private RideManager rideManager;

    @Override
    public void init() {
        rideManager = new RideManager();
        getServletContext().setAttribute("rideQueue", rideManager.getAllBookings());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("passengerName");
        String pickup = request.getParameter("pickupLocation");
        String drop = request.getParameter("dropLocation");
        String time = request.getParameter("time");

        Booking booking = new Booking(name, pickup, drop, time);
        rideManager.addBooking(booking);

        // update context attribute
        getServletContext().setAttribute("rideQueue", rideManager.getAllBookings());

        response.sendRedirect("status.jsp");
    }
}

