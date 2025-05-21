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
    <title>🚖 Book a Ride</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="login-wrapper">
    <div class="login-container">
        <h2>Book a Ride</h2>

        <form action="booking" method="post">
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
            <div class="form-row">
                <div class="form-group">
                    <label>Time</label>
                    <input type="text" name="time" class="form-control" placeholder="5:30" required>
                </div>
                <div class="form-group">
                    <label>AM/PM</label>
                    <select name="ampm" class="form-control" required>
                        <option value="AM">AM</option>
                        <option value="PM">PM</option>
                    </select>
                </div>
            </div>
            <button type="submit" class="btn">Assign Driver</button>
        </form>
    </div>
</div>
</body>
</html>
