<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login | City Cab Service</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="icon" href="images/favicon.png" type="image/png">
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="navbar-logo">
        <i class="fas fa-taxi"></i> City Cab Service
    </div>
    <div>
        <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
    </div>
</div>

<!-- Login Form -->
<div class="login-wrapper">
    <div class="login-container">
        <img src="images/logo.png" alt="Cab Service Logo">
        <h2>Welcome Back</h2>
        <p>Sign in to your account</p>

        <form method="post" action="login">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="name@example.com" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="••••••••" required>
            </div>

            <div class="form-group-bottom">
                <label><input type="checkbox" name="remember"> Remember me</label>
            </div>

            <button type="submit" class="btn mt-2"><i class="fas fa-sign-in-alt"></i> Sign In</button>
        </form>

        <div class="form-footer">
            Don't have an account? <a href="register.jsp">Sign up</a>
        </div>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
        <div class="alert">
            <i class="fas fa-exclamation-circle"></i> <%= error %>
        </div>
        <% } %>
    </div>
</div>

</body>
</html>
