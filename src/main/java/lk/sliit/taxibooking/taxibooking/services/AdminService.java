package lk.sliit.taxibooking.taxibooking.services;


import lk.sliit.taxibooking.taxibooking.models.User;
import java.util.ArrayList;
import java.util.List;

public class AdminService {
    public int getTotalUsers() {
        // Replace with actual database call
        return 125;
    }

    public int getTotalDrivers() {
        return 42;
    }

    public int getActiveRides() {
        return 8;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        // Sample data - replace with database query
        users.add(new User(1, "John Doe", "john@example.com", true));
        users.add(new User(2, "Alice Smith", "alice@example.com", true));
        return users;
    }
}
