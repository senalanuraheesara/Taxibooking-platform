package lk.sliit.taxibooking.taxibooking;

import lk.sliit.taxibooking.taxibooking.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

@WebServlet("/edit-user")
public class EditUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        String filePath = getServletContext().getRealPath("/WEB-INF/users.txt");
        File file = new File(filePath);
        List<String> updatedLines = new ArrayList<>();

        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 6 && parts[0].equals(id)) {
                // Replace line
                line = String.join(",", id, name, email, parts[3], phone, role);
            }
            updatedLines.add(line);
        }
        reader.close();

        BufferedWriter writer = new BufferedWriter(new FileWriter(file, false));
        for (String l : updatedLines) {
            writer.write(l);
            writer.newLine();
        }
        writer.close();

        response.sendRedirect("manage-users.jsp");
    }
}
