package lk.sliit.taxibooking.taxibooking.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Review {
    private String driverName;
    private int rating;
    private String comment;
    private LocalDateTime reviewDate;

    public Review(String driverName, int rating, String comment) {
        this.driverName = driverName;
        this.rating = rating;
        this.comment = comment;
        this.reviewDate = LocalDateTime.now();
    }

    public String getDriverName() { return driverName; }
    public int getRating() { return rating; }
    public String getComment() { return comment; }
    public LocalDateTime getReviewDate() { return reviewDate; }

    public void setReviewDate(LocalDateTime reviewDate) {
        this.reviewDate = reviewDate;
    }

    public String getFormattedDate() {
        return reviewDate.format(DateTimeFormatter.ofPattern("MMM dd, yyyy hh:mm a"));
    }

    @Override
    public String toString() {
        return String.format("%s,%d,%s,%s",
                driverName,
                rating,
                comment.replace(",", ";"),
                reviewDate.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
    }
}