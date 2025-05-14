<%--
  Created by IntelliJ IDEA.
  User: pcadmin
  Date: 5/13/2025
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taxi.booking.service.RideManager" %>
<%
    RideManager manager = new RideManager();
    manager.clearAllBookings();
%>
<html>
<head><title>Clear All Rides</title><link rel="stylesheet" href="styles.css"></head>
<body>
<h2>All rides cleared!</h2>
<a href="status.jsp">← Back to Status</a>
</body>
</html>