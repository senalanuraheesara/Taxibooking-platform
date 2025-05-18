package lk.sliit.taxibooking.taxibooking.models;

public class User {
    private int id;
    private String name;
    private String email;
    private boolean active;

    public User(int id, String name, String email, boolean active) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.active = active;
    }

    // Add getters and setters for all fields
    public int getId() { return id; }
    public String getName() { return name; }
    // ... other getters and setters
}

