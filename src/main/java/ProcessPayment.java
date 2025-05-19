import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProcessPayment")
public class ProcessPayment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String passengerName = request.getParameter("passengerName");
        String pickupLocation = request.getParameter("pickupLocation");
        String dropLocation = request.getParameter("dropLocation");
        double distance = Double.parseDouble(request.getParameter("distance"));
        double total = Double.parseDouble(request.getParameter("total"));

        // Generate a booking reference (in real app, save to database)
        String bookingRef = "TXI-" + System.currentTimeMillis();

        // Set attributes for the thank you page
        request.setAttribute("passengerName", passengerName);
        request.setAttribute("total", String.format("Rs.%.2f", total));
        request.setAttribute("bookingRef", bookingRef);
        request.setAttribute("pickupLocation", pickupLocation);

        // Forward to thank you page
        request.getRequestDispatcher("thankYou.jsp").forward(request, response);
    }
}