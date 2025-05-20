<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.sliit.taxibooking.taxibooking.service.DriverService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Driver Review</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="icon" href="images/favicon.png" type="image/png">
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
<div class="container">
    <h1>Submit Driver Review</h1>

    <% if (request.getSession().getAttribute("message") != null) { %>
    <div class="<%= "success".equals(request.getSession().getAttribute("messageType")) ? "success" : "error" %> message">
        <%= request.getSession().getAttribute("message") %>
    </div>
    <% request.getSession().removeAttribute("message"); %>
    <% request.getSession().removeAttribute("messageType"); %>
    <% } %>

    <form action="SubmitReviewServlet" method="post">
        <div class="form-group">
            <label for="driverName">Driver Name:</label>
            <input list="drivers" name="driverName" id="driverName" required
                   placeholder="Select or type driver name">
            <datalist id="drivers">
                <%
                    DriverService driverService = new DriverService(application);
                    try {
                        List<String> drivers = driverService.getAllDriverNames();
                        for (String driver : drivers) {
                %>
                <option value="<%= driver %>">
                        <%
            }
          } catch (IOException e) {
            out.println("<!-- Error loading drivers: " + e.getMessage() + " -->");
          }
        %>
            </datalist>
        </div>

        <div class="form-group">
            <label>Rating:</label>
            <div class="rating">
                <input type="radio" id="star5" name="rating" value="5" required>
                <label for="star5" title="Excellent">★</label>
                <input type="radio" id="star4" name="rating" value="4">
                <label for="star4" title="Good">★</label>
                <input type="radio" id="star3" name="rating" value="3">
                <label for="star3" title="Average">★</label>
                <input type="radio" id="star2" name="rating" value="2">
                <label for="star2" title="Poor">★</label>
                <input type="radio" id="star1" name="rating" value="1">
                <label for="star1" title="Terrible">★</label>
            </div>
        </div>

        <div class="form-group">
            <label for="comment">Comments:</label>
            <textarea name="comment" id="comment" rows="4"
                      placeholder="Please share your experience with this driver..."
                      required></textarea>
        </div>

        <button type="submit">Submit Review</button>
    </form>
</div>
</body>
</html>