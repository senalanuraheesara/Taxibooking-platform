<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Error | Taxi Service</title>

</head>
<body>
<div class="error-container">
    <h1>Oops! Something went wrong</h1>

    <div class="error-code">
        <c:choose>
            <c:when test="${not empty requestScope['jakarta.servlet.error.status_code']}">
                Error ${requestScope['jakarta.servlet.error.status_code']}
            </c:when>
            <c:otherwise>
                Application Error
            </c:otherwise>
        </c:choose>
    </div>

    <div class="error-message">
        <c:choose>
            <c:when test="${not empty requestScope['jakarta.servlet.error.message']}">
                ${requestScope['jakarta.servlet.error.message']}
            </c:when>
            <c:when test="${not empty pageContext.exception}">
                ${pageContext.exception.message}
            </c:when>
            <c:otherwise>
                An unexpected error occurred while processing your request.
            </c:otherwise>
        </c:choose>
    </div>

    <c:if test="${not empty pageContext.exception}">
        <div class="error-details">
            <strong>Exception:</strong> ${pageContext.exception}<br><br>
            <c:forEach items="${pageContext.exception.stackTrace}" var="trace">
                ${trace}<br>
            </c:forEach>
        </div>
    </c:if>

    <a href="index.jsp" class="home-link">Return to Home</a>
</div>
</body>
</html>