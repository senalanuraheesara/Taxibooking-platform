<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register | City Cab Service</title>
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
<div class="auth-right">
    <div class="form-card">
        <h2 class="form-title text-center">Join Our Cab Service</h2>
        <p class="text-center text-muted">Create your account in just a few steps</p>

        <form method="post" action="register" class="form">
            <div class="form-row">
                <div class="form-group">
                    <label for="role">Account Type</label>
                    <select id="role" name="role" class="form-control select-control" required>
                        <option disabled selected>Select account type</option>
                        <option value="passenger">Passenger</option>
                        <option value="driver">Driver</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" class="form-control" placeholder="+94" required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="confirm">Confirm Password</label>
                    <input type="password" id="confirm" name="confirm" class="form-control" required>
                </div>
            </div>

            <div class="form-group form-check">
                <input type="checkbox" id="terms" class="form-check-input" required>
                <label for="terms" class="form-check-label">
                    I agree to the <a href="#">Terms and Conditions</a>
                </label>
            </div>

            <button type="submit" class="btn primary btn-block">
                Create Account
            </button>
        </form>

        <div class="form-footer text-center mt-2">
            Already have an account? <a href="login.jsp" class="text-primary">Sign in</a>
        </div>
    </div>
</div>
</body>
</html>
