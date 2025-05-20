package lk.sliit.taxibooking.taxibooking.service;

import lk.sliit.taxibooking.taxibooking.model.Driver;
import lk.sliit.taxibooking.taxibooking.model.Review;
import jakarta.servlet.ServletContext;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class DriverService {
    private static final String DRIVERS_FILE = "driverDetails.txt";
    private final ServletContext context;
    private final ReviewService reviewService;

    // Constructor for driver validation version
    public DriverService(ServletContext context) {
        this.context = context;
        this.reviewService = null; // Not needed for basic validation
    }

    // Constructor for ratings version
    public DriverService(ReviewService reviewService) {
        this.context = null;
        this.reviewService = reviewService;
    }

    /* Driver Validation Methods */
    public List<String> getAllDriverNames() throws IOException {
        if (context == null) {
            throw new IllegalStateException("ServletContext not available");
        }

        List<String> driverNames = new ArrayList<>();
        String filePath = context.getRealPath("/WEB-INF/" + DRIVERS_FILE);

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 2) {
                    driverNames.add(parts[1].trim()); // Driver name is at index 1
                }
            }
        }
        return driverNames;
    }

    public boolean isValidDriver(String driverName) throws IOException {
        return getAllDriverNames().stream()
                .anyMatch(name -> name.equalsIgnoreCase(driverName.trim()));
    }

    /* Driver Ratings Methods */
    public List<Driver> getAllDrivers() throws IOException {
        if (reviewService == null) {
            throw new IllegalStateException("ReviewService not available");
        }

        List<Review> reviews = reviewService.getAllReviews();
        return reviews.stream()
                .collect(Collectors.groupingBy(Review::getDriverName))
                .entrySet().stream()
                .map(entry -> {
                    Driver driver = new Driver(entry.getKey());
                    entry.getValue().forEach(driver::addReview);
                    return driver;
                })
                .collect(Collectors.toList());
    }

    public List<Driver> searchDrivers(String query) throws IOException {
        if (query == null || query.trim().isEmpty()) {
            return getAllDrivers();
        }
        String lowerQuery = query.toLowerCase();
        return getAllDrivers().stream()
                .filter(driver -> driver.getName().toLowerCase().contains(lowerQuery))
                .collect(Collectors.toList());
    }
}