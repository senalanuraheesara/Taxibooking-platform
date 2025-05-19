<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment</title>
</head>
<body>
<h1>Payment</h1>
<form action="ProcessPayment" method="post">
    Passenger Name: <input type="text" name="passengerName" required><br><br>
    Pickup Location: <input type="text" name="pickupLocation" required><br><br>
    Drop Location: <input type="text" name="dropLocation" required><br><br>
    Estimated Distance: <input type="text" name="distance" required><br><br>
    Total: <input type="text" name="total" required><br><br>
    <input type="submit" value="Do Payment">
</form>
<br>
<a href="ViewRideHistory">View Ride History</a>
</body>
</html>