package lk.sliit.taxibooking.taxibooking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

@WebServlet("/processPayment")
public class ProcessPaymentServlet extends HttpServlet {

    private static final String PAYMENT_FILE_PATH = "D:\\20.05\\final project 5.20\\final project 5.20\\Taxibooking\\Taxibooking\\src\\main\\webapp\\WEB-INF\\payment.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Booking booking = (Booking) request.getSession().getAttribute("currentBooking");

        if (booking == null) {
            response.sendRedirect("booking.jsp");
            return;
        }

        // Save payment info to file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(PAYMENT_FILE_PATH, true))) {
            writer.write(String.join(",",
                    booking.getPassengerName(),
                    booking.getAssignedDriverName(),
                    booking.getPickupLocation(),
                    booking.getDropLocation(),
                    booking.getTime(),
                    booking.getDistance(),
                    String.valueOf(booking.getFare())
            ));
            writer.newLine();
        }

        // Forward to receipt.jsp
        request.getRequestDispatcher("receipt.jsp").forward(request, response);
    }
}