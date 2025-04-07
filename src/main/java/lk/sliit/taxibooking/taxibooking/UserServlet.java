package lk.sliit.taxibooking.taxibooking;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.*;

@WebServlet(name = "UserServlet", value = "/user-servlet")
public class UserServlet extends HttpServlet {
    private static final String USERS_FILE = "users.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            handleLogin(request, response);
        } else if ("register".equals(action)) {
            handleRegistration(request, response);
        }
    }

    // Implement handleLogin method
    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            List<User> users = readUsersFromFile();
            for (User user : users) {
                if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    response.sendRedirect("profile.jsp");
                    return;
                }
            }
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
        } catch (IOException e) {
            request.setAttribute("error", "System error. Please try again.");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
        }
    }

    // Implement handleRegistration method
    private void handleRegistration(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = "user"; // Default role

        try {
            List<User> users = readUsersFromFile();

            // Check for existing email
            for (User user : users) {
                if (user.getEmail().equals(email)) {
                    request.setAttribute("error", "Email already registered");
                    request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
                    return;
                }
            }

            // Create new user
            String id = UUID.randomUUID().toString();
            User newUser = new User(id, name, email, password, role);
            users.add(newUser);
            writeUsersToFile(users);

            // Auto-login after registration
            HttpSession session = request.getSession();
            session.setAttribute("user", newUser);
            response.sendRedirect("profile.jsp");

        } catch (IOException e) {
            request.setAttribute("error", "Registration failed. Please try again.");
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
        }
    }

    // Helper method to read users
    private List<User> readUsersFromFile() throws IOException {
        List<User> users = new ArrayList<>();
        String path = getServletContext().getRealPath("/") + USERS_FILE;
        File file = new File(path);

        if (!file.exists()) {
            file.createNewFile();
            return users;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 5) {
                    users.add(new User(parts[0], parts[1], parts[2], parts[3], parts[4]));
                }
            }
        }
        return users;
    }

    // Helper method to write users
    private void writeUsersToFile(List<User> users) throws IOException {
        String path = getServletContext().getRealPath("/") + USERS_FILE;
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(path))) {
            for (User user : users) {
                writer.write(user.toFileString() + "\n");
            }
        }
    }

    // User model class
    public static class User {
        private String id;
        private String name;
        private String email;
        private String password;
        private String role;

        public User(String id, String name, String email, String password, String role) {
            this.id = id;
            this.name = name;
            this.email = email;
            this.password = password;
            this.role = role;
        }

        // Getters
        public String getId() { return id; }
        public String getName() { return name; }
        public String getEmail() { return email; }
        public String getPassword() { return password; }
        public String getRole() { return role; }

        // Format for file storage
        public String toFileString() {
            return String.join(",", id, name, email, password, role);
        }
    }
}