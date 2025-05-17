package lk.sliit.taxibooking.taxibooking.servlets;

import lk.sliit.taxibooking.taxibooking.services.AdminService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set dashboard data
        request.setAttribute("totalUsers", adminService.getTotalUsers());
        request.setAttribute("totalDrivers", adminService.getTotalDrivers());
        request.setAttribute("activeRides", adminService.getActiveRides());
        request.setAttribute("users", adminService.getAllUsers());

        // Forward to JSP
        request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(request, response);
    }
}