<%--
  Created by IntelliJ IDEA.
  User: pcadmin
  Date: 5/9/2025
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Queue" %>
<%@ page import="lk.sliit.taxibooking.taxibooking.model.Booking" %>
<%@ page import="lk.sliit.taxibooking.taxibooking.service.RideManager" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>🚖 Ride Status</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<div class="login-wrapper">
    <div class="login-container">
        <h2>Active Ride Status</h2>

        <%
            RideManager manager = new RideManager();
            Queue<Booking> rides = manager.getAllBookings();

            if (rides.isEmpty()) {
        %>
            <div class="alert">No Pending Ride Requests!</div>
        <%
            } else {
        %>
            <table>
                <tr>
                    <th>Passenger</th>
                    <th>Pickup</th>
                    <th>Drop</th>
                    <th>Time</th>
                    <th>Distance (km)</th>
                    <th>Status</th>
                </tr>
                <%
                    for (Booking ride : rides) {
                %>
                <tr>
                    <td><%= ride.getPassengerName() %></td>
                    <td><%= ride.getPickupLocation() %></td>
                    <td><%= ride.getDropLocation() %></td>
                    <td><%= ride.getTime() %></td>
                    <td><%= ride.getDistance() %></td>
                    <td>
                        <% if (ride.isAssigned()) { %>
                            Assigned
                        <% } else { %>
                            Not Assigned
                        <% } %>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        <%
            }
        %>

        <div class="form-footer">
            <a href="assign.jsp">Assign Driver</a>
        </div>
        <div class="form-footer">
            <a href="clear.jsp">Clear All Rides</a>
        </div>
        <div class="form-footer mt-3">
            <a href="booking.jsp">Back to Booking</a>
        </div>
    </div>
</div>
</body>
</html>