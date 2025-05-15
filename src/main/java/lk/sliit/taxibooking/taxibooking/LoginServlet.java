package lk.sliit.taxibooking.taxibooking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserDAO.login(email, password);

        if (user != null) {
            HttpSession session = request.getSession();

            // Store full user object in session
            session.setAttribute("user", user);

            // Also store individual attributes if needed
            session.setAttribute("userId", user.getId());
            session.setAttribute("username", user.getName());
            session.setAttribute("role", user.getRole());

            // Redirect based on user role
            switch (user.getRole().toLowerCase()) {
                case "admin":
                    response.sendRedirect("adminmanagement.jsp");
                    break;
                case "driver":
                    response.sendRedirect("driverdashboard.jsp");
                    break;
                case "passenger":
                    response.sendRedirect("dashboard.jsp");
                    break;
                default:
                    response.sendRedirect("login.jsp?error=unknownrole");
                    break;
            }

        } else {
            //  Login failed
            request.setAttribute("error", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}