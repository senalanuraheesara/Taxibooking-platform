<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>🚖 Thank You!</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="login-wrapper">
    <div class="login-container">
        <h2>Thank You for Your Booking!</h2>
        <div class="confirmation-details">
            <p><strong>Passenger Name:</strong> ${passengerName}</p>
            <p><strong>Booking Reference:</strong> ${bookingRef}</p>
            <p><strong>Pickup Location:</strong> ${pickupLocation}</p>
            <p><strong>Total Paid:</strong> ${total}</p>
        </div>
        <div class="instructions">
            <p>Your driver will arrive shortly. Please be ready at your pickup location.</p>
        </div>
        <div class="form-footer mt-2">
            <a href="index.jsp">Make Another Booking</a> |
            <a href="RideHistory">View Ride History</a>
        </div>
    </div>
</div>
</body>
</html>