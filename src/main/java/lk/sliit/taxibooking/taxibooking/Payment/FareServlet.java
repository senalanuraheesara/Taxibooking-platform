package lk.sliit.taxibooking.taxibooking.Payment;

import lk.sliit.taxibooking.taxibooking.model.Booking;
import lk.sliit.taxibooking.taxibooking.service.RideManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/processPayment")

public class FareServlet extends HttpServlet {

        private final RideManager rideManager = new RideManager();

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            // Try to assign a driver to the next available booking
            Booking booking = rideManager.assignDriver();

            if (booking == null) {
                response.getWriter().println("<h3>No pending bookings or all are already assigned.</h3>");
                return;
            }

            // Simulate payment (use fare field from booking)
            double fare = booking.getFare(); // Assuming Booking has a getFare() method

            // You can store in session or forward to JSP
            request.setAttribute("booking", booking);
            request.setAttribute("fare", fare);

            request.getRequestDispatcher("/paymentResult.jsp").forward(request, response);
        }
    }

}
