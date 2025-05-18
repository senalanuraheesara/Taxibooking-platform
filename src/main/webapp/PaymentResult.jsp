
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.taxi.booking.model.Booking" %>

<%
    Booking booking = (Booking) request.getAttribute("booking");
    double fare = (double) request.getAttribute("fare");
%>

<h2>Payment Summary</h2>
<p><strong>User:</strong> <%= booking.getUser() %></p>
<p><strong>Fare:</strong> Rs. <%= fare %></p>
<p><strong>Status:</strong> <%= booking.isAssigned() ? "Driver Assigned" : "Pending" %></p>
