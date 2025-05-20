package lk.sliit.taxibooking.taxibooking.servlet;

import lk.sliit.taxibooking.taxibooking.service.ReviewService;
import lk.sliit.taxibooking.taxibooking.model.Review;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/ReviewManagementServlet")
public class ReviewManagementServlet extends HttpServlet {
    private ReviewService reviewService;

    @Override
    public void init() {
        this.reviewService = new ReviewService(getServletContext());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Review> recentReviews = reviewService.getAllReviews();
            // Get last 5 reviews (or all if less than 5)
            List<Review> displayReviews = recentReviews.stream()
                    .limit(5)
                    .collect(Collectors.toList());

            request.setAttribute("recentReviews", displayReviews);
            request.getRequestDispatcher("/review-management.jsp").forward(request, response);
        } catch (IOException e) {
            request.setAttribute("error", "Error loading reviews: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}