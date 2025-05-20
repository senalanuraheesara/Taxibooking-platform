<!-- src/main/webapp/error.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav>
    <a href="index.jsp">Home</a>
</nav>

<h1>Error Occurred</h1>
<p>Sorry, an error occurred while processing your request.</p>
<p>${pageContext.exception.message}</p>
<a href="index.jsp" class="btn">Return to Home</a>
</body>
</html>