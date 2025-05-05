package lk.sliit.taxibooking.taxibooking;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.*;

@WebServlet(name = "UserServlet", value = "/user-servlet")
public class UserServlet extends HttpServlet {
    private static final String USERS_FILE = "users.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch(action) {
            case "register":
                registerUser(request, response);
                break;
            case "login":
                loginUser(request, response);
                break;
            case "update":
                updateUser(request, response);
                break;
            case "changePassword":
                changePassword(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if(action == null) action = "list";

        switch(action) {
            case "list":
                listUsers(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "profile":
                showProfile(request, response);
                break;
            case "logout":
                logoutUser(request, response);
                break;
        }
    }

    // Implement all the helper methods (registerUser, loginUser, etc.)
    // with proper file handling operations
}