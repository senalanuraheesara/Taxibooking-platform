<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="icon" href="images/favicon.png" type="image/png">
    <title>Review Management | Taxi Service</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="navbar">
    <div class="navbar-logo">
        <i class="fas fa-taxi"></i> City Cab Service
    </div>
    <div>
        <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
    </div>
</div>
<div class="profile-container">
    <div class="profile-container"
    <div class="profile-container">
        <div class="container">
            <h1>Review Management</h1>

            <%-- Display success/error messages if they exist --%>
            <c:if test="${not empty message}">
                <div class="alert alert-${messageType}">${message}</div>
            </c:if>

            <div class="welcome-message">
                Welcome to the Review Management System
            </div>

            <div class="action-buttons">
                <a href="submit-review.jsp" class="action-btn">Submit a Review</a>
                <a href="driver-ratings.jsp" class="action-btn">View Driver Ratings</a>
            </div>

            <%-- Recent reviews section --%>
            <c:if test="${not empty recentReviews}">
                <h2 style="text-align: center; margin-top: 40px;">Recent Reviews</h2>
                <div style="margin: 20px 0;">
                    <c:forEach items="${recentReviews}" var="review">
                        <div style="background: #f9f9f9; padding: 15px; margin-bottom: 10px; border-radius: 4px;">
                            <strong>Driver:</strong> ${review.driverName} |
                            <strong>Rating:</strong> ${review.rating}/5 |
                            <strong>Date:</strong> ${review.reviewDate}
                            <p>${review.comments}</p>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <div class="quick-links">
                <a href="index.jsp" class="quick-link">Home</a>
                <a href="submit-review.jsp" class="quick-link">Submit Review</a>
                <a href="driver-ratings.jsp" class="quick-link">Driver Ratings</a>
            </div>
        </div>
</body>
</html>