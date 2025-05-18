<%@ page import="java.util.*,java.io.*" %>
<%@ page import="lk.sliit.taxibooking.taxibooking.DriverReviewUtil" %>
<%
    String driverName = (String) session.getAttribute("username");
    if (driverName == null) {
        driverName = ""; // fallback for testing
    }

    String filePath = "C:\\Users\\Udama\\Documents\\Taxibooking-udama[1]\\Taxibooking-udama\\Taxibooking\\Taxibooking\\src\\main\\webapp\\WEB-INF\\reviews.txt";
    List<String[]> reviews = DriverReviewUtil.getReviewsByName(driverName, filePath);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Driver Ratings</title>
    <link rel="stylesheet" href="css/style1.css">
    <link rel="stylesheet" href="css/ratingscss.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>
<body>
<div class="navbar">
    <div class="logo"><i class="fas fa-taxi"></i> City Cab Service</div>
    <div class="nav-links">
        <a href="driverDashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="rides.jsp"><i class="fas fa-car-side"></i> Rides</a>
        <a href="rating.jsp"><i class="fas fa-star"></i> My Ratings</a>
        <a href="DriverProfile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="logout" class="btn secondary-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</div>
<h2>Ratings for <%= driverName %></h2>

<%
    if (reviews.isEmpty()) {
%>
<p>No reviews found.</p>
<%
} else {
    for (String[] r : reviews) {
        String rating = r[1];
        String comment = r[2];
        String date = r[3];
%>
<div class="review-box">
    <p><strong>Rating:</strong> <%= rating %>/5
        <span class="stars">
        <%
            int fullStars = (int) Float.parseFloat(rating);
            boolean halfStar = (Float.parseFloat(rating) - fullStars) >= 0.5;
            for (int i = 0; i < fullStars; i++) {
        %>
            <i class="fas fa-star" style="color: #ffc107;"></i>
        <%
            }
            if (halfStar) {
        %>
            <i class="fas fa-star-half-alt" style="color: #ffc107;"></i>
        <%
            }
            for (int i = fullStars + (halfStar ? 1 : 0); i < 5; i++) {
        %>
            <i class="far fa-star" style="color: #ffc107;"></i>
        <%
            }
        %>
    </span>
    </p>

    <p><strong>Comment:</strong> <%= comment %></p>
    <p><strong>Date:</strong> <%= date %></p>
</div>
<%
        }
    }
%>
</body>
</html>
