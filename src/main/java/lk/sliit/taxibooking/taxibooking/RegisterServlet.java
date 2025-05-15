package lk.sliit.taxibooking.taxibooking;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        String id = UUID.randomUUID().toString();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        User user;
        if ("driver".equalsIgnoreCase(role)) {
            user = new Driver(id, name, email, password, phone,role);
        } else {
            user = new Passenger(id, name, email, password, phone,role);
        }

        UserDAO.register(user);
        response.sendRedirect("login.jsp");
    }
}
