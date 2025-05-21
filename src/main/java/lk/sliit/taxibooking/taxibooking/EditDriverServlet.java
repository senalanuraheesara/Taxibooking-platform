package lk.sliit.taxibooking.taxibooking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

@WebServlet("/edit-driver")
public class EditDriverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userID = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String license = request.getParameter("license");
        String vehicleType = request.getParameter("vehicleType");
        String workStatus = request.getParameter("workStatus");
        int experience = Integer.parseInt(request.getParameter("experience"));
        double rating = Double.parseDouble(request.getParameter("rating"));

        String filePath = getServletContext().getRealPath("/WEB-INF/driverDetails.txt");

        // Read all lines
        List<String> updatedLines = new ArrayList<>();
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 9 && parts[0].equals(userID)) {
                // Replace with updated line
                String updatedLine = String.join(",", userID, name, email, phone, license,
                        vehicleType, workStatus, String.valueOf(experience), String.valueOf(rating));
                updatedLines.add(updatedLine);
            } else {
                updatedLines.add(line);
            }
        }
        reader.close();

        // Write back all lines
        BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false));
        for (String updated : updatedLines) {
            writer.write(updated);
            writer.newLine();
        }
        writer.close();

        response.sendRedirect("manage-drivers.jsp");
    }
}
