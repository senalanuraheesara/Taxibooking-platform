package lk.sliit.taxibooking.taxibooking.servlet;

import lk.sliit.taxibooking.taxibooking.model.Booking;
import lk.sliit.taxibooking.taxibooking.service.RideManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
        String distance = request.getParameter("distance");
        String timeInput = request.getParameter("time");
        String ampm = request.getParameter("ampm");
        String time = timeInput + " " + ampm;

        Booking booking = new Booking(name, pickup, drop, time, distance);
        rideManager.addBooking(booking);

        // update context attribute
        getServletContext().setAttribute("rideQueue", rideManager.getAllBookings());

        response.sendRedirect("status.jsp");
    }
}

