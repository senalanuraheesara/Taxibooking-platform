<%--
  Created by IntelliJ IDEA.
  User: pcadmin
  Date: 5/9/2025
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*, com.taxi.booking.model.Booking" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ride Status</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h2>Ride Status</h2>
<table>
    <tr>
        <th>Passenger</th>
        <th>Pickup</th>
        <th>Drop</th>
        <th>Time</th>
    </tr>
    <%
        Queue<Booking> rideQueue = (Queue<Booking>) application.getAttribute("rideQueue");
        if (rideQueue != null && !rideQueue.isEmpty()) {
            for (Booking booking : rideQueue) {
    %>
    <tr>
        <td><%= booking.getPassengerName() %></td>
        <td><%= booking.getPickupLocation() %></td>
        <td><%= booking.getDropLocation() %></td>
        <td><%= booking.getTime() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr><td colspan="4">No active bookings.</td></tr>
    <% } %>
</table>

<a href="assign.jsp">Assign Next Ride</a>
<a href="clear.jsp">Clear All Rides</a>
<a href="booking.jsp">Back to Booking</a>
</body>
</html>
