<%--
  Created by IntelliJ IDEA.
  User: pcadmin
  Date: 5/9/2025
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*, jakarta.servlet.http.*, lk.sliit.taxibooking.taxibooking.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🚖 Ride History</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eaf6ff;
            margin: 0;
            padding: 0;
        }

        .login-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-container {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 1200px;
            width: 100%;
            margin: 50px auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #222;
        }

        .alert {
            background-color: #ffecec;
            color: #d8000c;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            font-size: 1rem;
        }

        table thead {
            background-color: #f4f6f8;
        }

        table th, table td {
            text-align: left;
            padding: 12px 16px;
            border-bottom: 1px solid #ddd;
            white-space: nowrap;
        }

        table th {
            font-weight: bold;
            color: #333;
        }

        table tr:hover {
            background-color: #f9f9f9;
        }

        .form-footer {
            text-align: center;
            margin-top: 30px;
        }

        .form-footer a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        /* Responsive */
        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead {
                display: none;
            }

            tr {
                margin-bottom: 15px;
            }

            td {
                padding: 10px;
                text-align: right;
                position: relative;
            }

            td::before {
                content: attr(data-label);
                position: absolute;
                left: 10px;
                text-align: left;
                font-weight: bold;
                color: #555;
            }
        }
    </style>
</head>
<body>

<div class="login-wrapper">
    <div class="login-container">
        <h2>🚘 Your Ride History</h2>

        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String name = user.getName();
            File file = new File(application.getRealPath("/WEB-INF/passenger.txt"));

            if (!file.exists()) {
        %>
        <div class="alert">No rides recorded yet.</div>
        <%
        } else {
            List<String[]> rideList = new ArrayList<>();
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split(",");
                    if (parts.length >= 10 && parts[1].equalsIgnoreCase(name)) {
                        rideList.add(parts);
                    }
                }
            }

            if (rideList.isEmpty()) {
        %>
        <div class="alert">You have no ride history yet.</div>
        <%
        } else {
        %>
        <table>
            <thead>
            <tr>
                <th>Pickup</th>
                <th>Drop</th>
                <th>Distance (km)</th>
                <th>Time</th>
                <th>Phone</th>
                <th>Driver</th>
            </tr>
            </thead>
            <tbody>
            <% for (String[] ride : rideList) { %>
            <tr>
                <td data-label="Pickup"><%= ride[5] %></td>
                <td data-label="Drop"><%= ride[6] %></td>
                <td data-label="Distance (km)"><%= ride[7] %></td>
                <td data-label="Time"><%= ride[8] %></td>
                <td data-label="Phone"><%= ride[3] %></td>
                <td data-label="Driver"><%= ride[9] %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
        <%
                }
            }
        %>

        <div class="form-footer mt-3">
            <a href="dashboard.jsp">← Back to Dashboard</a>
        </div>
    </div>
</div>
</body>
</html>

