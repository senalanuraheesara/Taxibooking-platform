<%--
  Created by IntelliJ IDEA.
  User: pcadmin
  Date: 5/13/2025
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.sliit.taxibooking.taxibooking.service.RideManager" %>
<%
    RideManager manager = new RideManager();
    manager.clearAllBookings();
%>
<html>
<head>
    <title>🧹 Clear All Rides</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="login-wrapper">
    <div class="login-container">
        <h2>Clear Ride History</h2>

        <%
            manager = new RideManager();
            manager.clearAllBookings();
        %>

        <div class="alert">
            All Rides have been cleared.
        </div>

        <a class="btn mt-2" href="status.jsp">← Back to Status</a>
    </div>
</div>
</body>
</html>