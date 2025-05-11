package lk.sliit.taxibooking.taxibooking;

import java.io.*;
import java.util.*;

public class UserDAO {
    private static final String FILE_PATH = "C:\\Users\\senal\\IdeaProjects\\Taxibooking\\src\\main\\resources\\users.txt";
    private static Map<String, User> users = new HashMap<>();

    // Load users when class loads
    static {
        loadFromFile();
    }

    public static void register(User user) {
        users.put(user.getId(), user);
        saveToFile();
    }

    public static User login(String email, String password) {
        for (User user : users.values()) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    public static User getById(String id) {
        return users.get(id);
    }

    public static void update(User user) {
        users.put(user.getId(), user);
        saveToFile();
    }

    public static void delete(String id) {
        users.remove(id);
        saveToFile();
        System.out.println("deleted" + id);
    }

    private static void saveToFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User user : users.values()) {
                String role = user instanceof Driver ? "Driver" : "Passenger";
                writer.write(user.getId() + "," + user.getName() + "," + user.getEmail() + "," + user.getPassword() + "," + user.getPhone() + "," + role);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void loadFromFile() {
        File file = new File(FILE_PATH);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", -1);
                if (parts.length == 6) {
                    String id = parts[0];
                    String name = parts[1];
                    String email = parts[2];
                    String password = parts[3];
                    String phone = parts[4];
                    String role = parts[5];

                    User user;
                    if (role.equalsIgnoreCase("Driver")) {
                        user = new Driver(id, name, email, password, phone);
                    } else {
                        user = new Passenger(id, name, email, password, phone);
                    }

                    users.put(id, user);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
