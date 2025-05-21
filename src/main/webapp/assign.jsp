<%--
  Created by IntelliJ IDEA.
  User: pcadmin
  Date: 5/13/2025
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="lk.sliit.taxibooking.taxibooking.Booking" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Booking booking = (Booking) session.getAttribute("currentBooking");
    if (booking == null) {
        response.sendRedirect("booking.jsp");
        return;
    }

    List<String[]> availableDrivers = new ArrayList<>();
    String driverFilePath = application.getRealPath("/WEB-INF/driverDetails.txt");
    File driverFile = new File(driverFilePath);
    if (driverFile.exists()) {
        try (BufferedReader br = new BufferedReader(new FileReader(driverFile))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 7 && (parts[6].trim().equalsIgnoreCase("Full-Time") || parts[6].trim().equalsIgnoreCase("Part-Time"))) {
                    availableDrivers.add(parts);
                }
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error reading driver details: " + e.getMessage());
        }
    } else {
        request.setAttribute("error", "Driver details file not found!");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🚖 Assign Driver</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="login-wrapper">
    <div class="login-container">
        <h2>Select a Driver</h2>
        <table>
            <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Car</th>
                <th>Work Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% for (String[] driver : availableDrivers) { %>
            <tr>
                <td><%= driver[1] %></td>
                <td><%= driver[2] %></td>
                <td><%= driver[3] %></td>
                <td>
                    <%= driver[5] %><br>
                    <small>(Code: <%= driver[4] %>)</small>
                </td>
                <td><%= driver[6] %></td>
                <td>
                    <form action="confirmBooking" method="post">
                        <input type="hidden" name="driverName" value="<%= driver[0] %>">
                        <input type="submit" value="Book" class="btn">
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>

        <div class="form-footer mt-3">
            <a href="dashboard.jsp">← Back to Dashboard</a>
        </div>
    </div>
</div>
</body>
</html>



