package lk.sliit.taxibooking.taxibooking.servlet;

import lk.sliit.taxibooking.taxibooking.model.Driver;
import lk.sliit.taxibooking.taxibooking.service.DriverService;
import lk.sliit.taxibooking.taxibooking.service.ReviewService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DriverRatingsServlet")
public class DriverRatingsServlet extends HttpServlet {
    private DriverService driverService;

    @Override
    public void init() {
        // Correct initialization sequence
        ServletContext context = getServletContext();
        ReviewService reviewService = new ReviewService(context);
        this.driverService = new DriverService(reviewService);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String searchQuery = request.getParameter("searchQuery");
            List<Driver> drivers = driverService.searchDrivers(searchQuery);

            request.setAttribute("drivers", drivers);
            request.setAttribute("searchQuery", searchQuery);
            request.getRequestDispatcher("/driver-ratings.jsp").forward(request, response);
        } catch (IOException e) {
            request.setAttribute("error", "Error loading driver ratings: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}