package lk.sliit.taxibooking.taxibooking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pickupLocation = request.getParameter("pickupLocation");
        String dropLocation = request.getParameter("dropLocation");
        String distanceStr = request.getParameter("distance");
        String time = request.getParameter("time");
        String ampm = request.getParameter("ampm");
        String fullTime = time + " " + ampm;

        double distance;
        try {
            distance = Double.parseDouble(distanceStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("booking.jsp?error=Invalid distance");
            return;
        }

        double fare = distance * 50.0;

        HttpSession session = request.getSession();
        String passengerName = (String) session.getAttribute("username");
        String userId = (String) session.getAttribute("userId");
        String email = (String) session.getAttribute("email");
        String phone = (String) session.getAttribute("phone");
        String role = (String) session.getAttribute("role");

        Booking booking = new Booking();
        booking.setPassengerName(passengerName);
        booking.setPickupLocation(pickupLocation);
        booking.setDropLocation(dropLocation);
        booking.setDistance(distanceStr);
        booking.setTime(fullTime);
        booking.setFare(fare);
        booking.setUserDetails(userId, email, phone, role);
        booking.setAssigned(false);

        session.setAttribute("currentBooking", booking);

        response.sendRedirect("assign.jsp");
    }
}