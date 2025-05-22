package lk.sliit.taxibooking.taxibooking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/LoginServlet") // ✅ Matches the form action="LoginServlet"
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get login form values
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Authenticate using UserDAO
        User user = UserDAO.login(email, password);

        if (user != null) {
            HttpSession session = request.getSession();

            //  Set user data in session
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("username", user.getName());
            session.setAttribute("role", user.getRole());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("phone", user.getPhone());

            //  Redirect to dashboard based on role
            switch (user.getRole().toLowerCase()) {
                case "admin":
                    response.sendRedirect("adminmanagement.jsp");
                    break;
                case "driver":
                    response.sendRedirect("driverDashboard.jsp");
                    break;
                case "passenger":
                    response.sendRedirect("dashboard.jsp");
                    break;
                default:
                    response.sendRedirect("login.jsp?error=unknownrole");
                    break;
            }

        } else {
            // Login failed – show error
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}