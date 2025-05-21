package lk.sliit.taxibooking.taxibooking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;

@WebServlet("/confirmBooking")
public class ConfirmBookingServlet extends HttpServlet {

    private static final String DRIVER_FILE_PATH = "D:\\20.05\\final project 5.20\\final project 5.20\\Taxibooking\\Taxibooking\\src\\main\\webapp\\WEB-INF\\driverDetails.txt";
    private static final String PASSENGER_FILE_PATH = "D:\\20.05\\final project 5.20\\final project 5.20\\Taxibooking\\Taxibooking\\src\\main\\webapp\\WEB-INF\\passenger.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get selected driver ID
        String driverId = request.getParameter("driverName"); // actually driver ID
        HttpSession session = request.getSession();
        Booking booking = (Booking) session.getAttribute("currentBooking");

        if (booking == null || driverId == null) {
            response.sendRedirect("assign.jsp");
            return;
        }

        // Find and set actual driver name
        String assignedDriverName = "Unknown";
        File driverFile = new File(DRIVER_FILE_PATH);
        try (BufferedReader reader = new BufferedReader(new FileReader(driverFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 2 && parts[0].trim().equals(driverId.trim())) {
                    assignedDriverName = parts[1]; // driver name
                    break;
                }
            }
        }

        // Update booking object
        booking.setAssigned(true);
        booking.setAssignedDriverName(assignedDriverName);

        // Calculate fare again (safe guard)
        try {
            double fare = Double.parseDouble(booking.getDistance()) * 50.0;
            booking.setFare(fare);
        } catch (NumberFormatException ignored) {}

        // Save updated booking back to session
        session.setAttribute("currentBooking", booking);

        // Write passenger booking info to file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(PASSENGER_FILE_PATH, true))) {
            writer.write(String.join(",",
                    booking.getUserId(),
                    booking.getPassengerName(),
                    booking.getEmail(),
                    booking.getPhone(),
                    booking.getRole(),
                    booking.getPickupLocation(),
                    booking.getDropLocation(),
                    booking.getDistance(),
                    booking.getTime(),
                    booking.getAssignedDriverName(),
                    String.valueOf(booking.getFare())
            ));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Go to payment page
        response.sendRedirect("payment.jsp");
    }
}