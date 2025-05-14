<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/14/2025
  Time: 10:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Management | Taxi Service</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }

        .welcome-message {
            text-align: center;
            font-size: 18px;
            margin-bottom: 40px;
            color: #555;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 40px;
        }

        .action-btn {
            padding: 12px 25px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            text-align: center;
            transition: background 0.3s;
        }

        .action-btn:hover {
            background: #2980b9;
        }

        .quick-links {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
        }

        .quick-link {
            color: #3498db;
            text-decoration: none;
            font-size: 14px;
        }

        .quick-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Review Management</h1>

    <div class="welcome-message">
        Welcome to the Review Management System
    </div>

    <div class="action-buttons">
        <a href="submit-review.html" class="action-btn">Submit a Review</a>
        <a href="driver-ratings.html" class="action-btn">View Driver Ratings</a>
    </div>

    <div class="quick-links">
        <a href="index.html" class="quick-link">Home</a>
        <a href="submit-review.html" class="quick-link">Submit Review</a>
        <a href="driver-ratings.html" class="quick-link">Driver Ratings</a>
    </div>
</div>
</body>
</html>