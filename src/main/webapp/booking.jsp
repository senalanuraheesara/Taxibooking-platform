<%--
  Created by IntelliJ IDEA.
  User: pcadmin
  Date: 5/9/2025
  Time: 7:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book a Ride</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h2>Book a Ride</h2>
<form method="post" action="booking">
    <input type="text" name="passengerName" placeholder="Passenger Name" required />
    <input type="text" name="pickupLocation" placeholder="Pickup Location" required />
    <input type="text" name="dropLocation" placeholder="Drop Location" required />
    <input type="text" name="time" placeholder="Time (e.g., 5:30 PM)" pattern="^(1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm])$" title="Enter time in format: 5:30 PM" required />
    <input type="submit" value="Book Ride" />
</form>
<a href="status.jsp">View Ride Status</a>
</body>
</html>
