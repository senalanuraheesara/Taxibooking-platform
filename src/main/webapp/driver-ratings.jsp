<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="icon" href="images/favicon.png" type="image/png">
    <title>Driver Ratings | Taxi Service</title>

</head>
<body>
<div class="navbar">
    <div class="navbar-logo">
        <i class="fas fa-taxi"></i> City Cab Service
    </div>
    <div>
        <a href="review-entrance.jsp"><i class="fas fa-home"></i> Home</a>
    </div>

</div>
<div class="profile-container">
    <div class="container">
        <h1>Driver Ratings</h1>

        <form action="DriverRatingsServlet" method="GET" class="search-bar">
            <input type="text" name="searchQuery" placeholder="Search drivers by name ..."
                   value="${param.searchQuery}">
            <button type="submit">Search</button>
        </form>
        <table class="drivers-table">
            <thead>
            <tr>
                <th>Driver Name</th>
                <th>Average Rating</th>
                <th>Total Reviews</th>
                <th>Recent Comments</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${drivers}" var="driver">
                <tr>
                    <td>${driver.name}</td>
                    <td>
          <span class="rating-stars">
            <c:forEach begin="1" end="${driver.averageRating}">★</c:forEach>
            <c:if test="${driver.averageRating % 1 > 0.4 && driver.averageRating % 1 < 0.6}">
                ½
            </c:if>
          </span>
                        (${String.format("%.1f", driver.averageRating)})
                    </td>
                    <td>${driver.totalReviews}</td>
                    <td>
                        <c:if test="${not empty driver.reviews}">
                            <div style="max-height: 100px; overflow-y: auto;">
                                <c:forEach items="${driver.reviews}" var="review" end="2">
                                    <div style="margin-bottom: 5px;">
                                        <small>${review.getFormattedDate()}</small><br>
                                        "${review.comment}"
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <c:if test="${not empty param.searchQuery}">
            <h2>Search Results for "<span class="search-query">${param.searchQuery}</span>"</h2>
        </c:if>

        <c:choose>
            <c:when test="${not empty drivers}">
                <div class="result-count">
                    Found ${drivers.size()} driver(s)
                </div>

            </c:when>
            <c:otherwise>
                <div class="no-results">
                    <c:choose>
                        <c:when test="${empty param.searchQuery}">
                            Please enter a driver name to search
                        </c:when>
                        <c:otherwise>
                            No drivers found matching "<span class="search-query">${param.searchQuery}</span>"
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>