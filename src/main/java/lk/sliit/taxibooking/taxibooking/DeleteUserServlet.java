package lk.sliit.taxibooking.taxibooking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/delete-user")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        String filePath = getServletContext().getRealPath("/WEB-INF/users.txt");
        File file = new File(filePath);
        List<String> updatedLines = new ArrayList<>();

        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 6 && !parts[0].equals(id)) {
                updatedLines.add(line);
            }
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

