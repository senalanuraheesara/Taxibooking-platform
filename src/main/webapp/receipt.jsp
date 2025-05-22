<%@ page import="lk.sliit.taxibooking.taxibooking.Booking" %>
<%
    Booking booking = (Booking) session.getAttribute("currentBooking");
    if (booking == null) {
        response.sendRedirect("booking.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f7f7f7;
            padding: 40px;
        }

        .receipt-box {
            background: white;
            padding: 30px;
            max-width: 600px;
            margin: auto;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2563eb;
        }

        .receipt-detail {
            margin: 15px 0;
            font-size: 16px;
        }

        .receipt-detail strong {
            width: 150px;
            display: inline-block;
        }

        .btn-back {
            display: block;
            text-align: center;
            margin-top: 30px;
        }

        .btn-back a {
            background: #2563eb;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn-back a:hover {
            background: #1e40af;
        }
    </style>
</head>
<body>

<div class="receipt-box">
    <h2>Payment Receipt</h2>

    <div class="receipt-detail"><strong>Passenger Name:</strong> <%= booking.getPassengerName() %></div>
    <div class="receipt-detail"><strong>Driver Name:</strong> <%= booking.getAssignedDriverName() %></div>
    <div class="receipt-detail"><strong>Pickup Location:</strong> <%= booking.getPickupLocation() %></div>
    <div class="receipt-detail"><strong>Drop Location:</strong> <%= booking.getDropLocation() %></div>
    <div class="receipt-detail"><strong>Time:</strong> <%= booking.getTime() %></div>
    <div class="receipt-detail"><strong>Distance:</strong> <%= booking.getDistance() %> km</div>
    <div class="receipt-detail"><strong>Fare Paid:</strong> Rs. <%= booking.getFare() %></div>

    <div class="btn-back">
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
    <div class="btn-back">
        <a href="reviewentrance.jsp">Submit A review</a>
    </div>
</div>

</body>
</html>