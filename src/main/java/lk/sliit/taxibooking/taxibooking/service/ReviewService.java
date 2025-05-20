package lk.sliit.taxibooking.taxibooking.service;

import lk.sliit.taxibooking.taxibooking.model.Review;
import lk.sliit.taxibooking.taxibooking.util.FileUtil;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ReviewService {
    private final ServletContext context;

    public ReviewService(ServletContext context) {
        this.context = context;
    }

    public void saveReview(Review review) throws IOException {
        FileUtil.appendToFile(context, review.toString()); // ✅ removed filename
    }

    public List<Review> getAllReviews() throws IOException {
        List<String> lines = FileUtil.readFile(context);  // ✅ removed filename
        List<Review> reviews = new ArrayList<>();

        for (String line : lines) {
            String[] parts = line.split(",", 4);
            if (parts.length >= 4) {
                Review review = new Review(
                        parts[0],  // driverName
                        Integer.parseInt(parts[1]),  // rating
                        parts[2].replace(";", ",")   // comment
                );
                review.setReviewDate(LocalDateTime.parse(parts[3], DateTimeFormatter.ISO_LOCAL_DATE_TIME));
                reviews.add(review);
            }
        }
        return reviews;
    }
}