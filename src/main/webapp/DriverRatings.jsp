<!-- src/main/webapp/driverRatings.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Driver Ratings</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav>
    <a href="entrance.jsp">Home</a>
</nav>

<h1>Driver Reviews</h1>

<form method="get" action="driver-ratings">
    <input type="text" name="driverName" placeholder="Search by driver name">
    <button type="submit">Search</button>
</form>

<c:if test="${not empty error}">
    <div class="error">${error}</div>
</c:if>

<c:if test="${not empty driver}">
    <div class="driver-info">
        <h2>${driver.name}</h2>
        <p>Average Rating: <fmt:formatNumber value="${avgRating}" pattern="0.0"/></p>
        <p>Total Reviews: ${reviews.size()}</p>
    </div>

    <div class="reviews">
        <h3>Recent Comments</h3>
        <c:forEach items="${reviews}" var="review">
            <div class="review">
                <div class="rating">${review.rating} stars</div>
                <div class="comment">${review.comment}</div>
                <div class="date"><fmt:formatDate value="${review.dateTime}" pattern="yyyy-MM-dd HH:mm"/></div>
            </div>
        </c:forEach>
    </div>
</c:if>
</body>
</html>