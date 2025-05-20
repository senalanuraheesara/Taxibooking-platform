package lk.sliit.taxibooking.taxibooking.servlet;

import lk.sliit.taxibooking.taxibooking.model.Review;
import lk.sliit.taxibooking.taxibooking.service.DriverService;
import lk.sliit.taxibooking.taxibooking.service.ReviewService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SubmitReviewServlet")
public class SubmitReviewServlet extends HttpServlet {
    private ReviewService reviewService;
    private DriverService driverService;

    @Override
    public void init() {
        ServletContext context = getServletContext();
        this.reviewService = new ReviewService(context);
        this.driverService = new DriverService(context);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String driverName = request.getParameter("driverName").trim();
        String comment = request.getParameter("comment").trim();
        int rating;

        try {
            rating = Integer.parseInt(request.getParameter("rating"));
            if (rating < 1 || rating > 5) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException e) {
            setErrorResponse(request, response, "Please provide a valid rating (1-5)");
            return;
        }

        try {
            if (!driverService.isValidDriver(driverName)) {
                setErrorResponse(request, response, "Invalid driver name. Please select from registered drivers.");
                return;
            }

            Review review = new Review(driverName, rating, comment);
            reviewService.saveReview(review);
            setSuccessResponse(request, response, "Review submitted successfully!");
        } catch (IOException e) {
            setErrorResponse(request, response, "Error processing review: " + e.getMessage());
        }
    }

    private void setErrorResponse(HttpServletRequest request, HttpServletResponse response, String message)
            throws IOException {
        request.getSession().setAttribute("message", message);
        request.getSession().setAttribute("messageType", "error");
        response.sendRedirect("submit-review.jsp");
    }

    private void setSuccessResponse(HttpServletRequest request, HttpServletResponse response, String message)
            throws IOException {
        request.getSession().setAttribute("message", message);
        request.getSession().setAttribute("messageType", "success");
        response.sendRedirect("submit-review.jsp");
    }
}