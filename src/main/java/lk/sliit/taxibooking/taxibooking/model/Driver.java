package lk.sliit.taxibooking.taxibooking.model;

import java.util.ArrayList;
import java.util.List;

public class Driver {
    private String id;
    private String name;
    private List<Review> reviews;

    public Driver(String id, String name) {
        this.id = id;
        this.name = name;
        this.reviews = new ArrayList<>();
    }

    // Getters and methods to add reviews and calculate average rating
    public String getId() { return id; }
    public String getName() { return name; }
    public List<Review> getReviews() { return reviews; }

    public void addReview(Review review) {
        reviews.add(review);
    }

    public double getAverageRating() {
        if (reviews.isEmpty()) return 0;
        return reviews.stream().mapToInt(Review::getRating).average().orElse(0);
    }

    public int getTotalReviews() {
        return reviews.size();
    }
}