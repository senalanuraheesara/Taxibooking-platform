package lk.sliit.taxibooking.taxibooking;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "taxiBookingServlet", value = "/taxi-booking-servlet")
public class TaxiBookingServlet extends HttpServlet {
    private String welcomeMessage;

    public void init() {
        welcomeMessage = "Welcome to City Cab Service";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>City Cab Service</title>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css' rel='stylesheet'>");
        out.println("<link href='assets/css/styles.css' rel='stylesheet'>");
        out.println("</head>");
        out.println("<body class='bg-light'>");
        out.println("<div class='container mt-5'>");
        out.println("<div class='card shadow'>");
        out.println("<div class='card-header bg-primary text-white'>");
        out.println("<h2>" + welcomeMessage + "</h2>");
        out.println("</div>");
        out.println("<div class='card-body'>");
        out.println("<p class='lead'>Your reliable transportation solution</p>");
        out.println("<div class='d-grid gap-2 d-md-block mt-4'>");
        out.println("<a href='register.jsp' class='btn btn-primary me-md-2'>Register</a>");
        out.println("<a href='login.jsp' class='btn btn-outline-primary'>Login</a>");
        out.println("</div>");
        out.println("</div>");
        out.println("</div>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }

    public void destroy() {
        // Cleanup code if needed
    }
}