<%--
  Created by IntelliJ IDEA.
  User: pcadmin
  Date: 5/13/2025
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taxi.booking.service.RideManager" %>
<%@ page import="com.taxi.booking.model.Booking" %>
<%
    RideManager manager = new RideManager();
    Booking ride = manager.assignDriver();
%>
<html>
<head><title>Assign Driver</title><link rel="stylesheet" href="styles.css"></head>
<body>
<h2>Assign Driver Result</h2>
<% if (ride != null && ride.isAssigned()) { %>
<p>Driver assigned to <b><%= ride.getPassengerName() %></b></p>
<% } else if (ride != null) { %>
<p>Ride already assigned</p>
<% } else { %>
<p>No rides available!</p>
<% } %>
<a href="status.jsp">← Back to Status</a>
</body>
</html>

