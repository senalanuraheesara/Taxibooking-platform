<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>🚖 Do Payment</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="login-wrapper">
    <div class="login-container">
        <h2>Payment</h2>
        <form action="booking" method="get">
            <div class="form-group">
                <label>Passenger Name</label>
                <input type="text" name="passengerName" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Pickup Location</label>
                <input type="text" name="pickupLocation" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Drop Location</label>
                <input type="text" name="dropLocation" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Estimated Distance</label>
                <input type="text" name="distance" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Total</label>
                <input type="text" name="total" class="form-control" required>
            </div>
            <button type="submit" class="btn">Do Payment</button>
        </form>
        <div class="form-footer mt-2">
            <a href="status.jsp">View Ride History</a>
        </div>
    </div>
</div>
</body>
</html>