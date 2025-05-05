<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Cab Service</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/styles.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5 fade-in">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center py-3">
                    <h3 class="mb-0">Join Our Cab Service</h3>
                    <p class="mb-0 small">Create your account in just a few steps</p>
                </div>
                <div class="card-body p-4">
                    <form action="UserServlet" method="post" class="needs-validation" novalidate>
                        <input type="hidden" name="action" value="register">

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="userType" class="form-label">Account Type</label>
                                <select class="form-select" id="userType" name="userType" required>
                                    <option value="" selected disabled>Select account type</option>
                                    <option value="passenger">Passenger</option>
                                    <option value="driver">Driver</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please select an account type.
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="fullName" class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="fullName" required>
                                <div class="invalid-feedback">
                                    Please provide your full name.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                            <div class="invalid-feedback">
                                Please provide a valid email.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone Number</label>
                            <div class="input-group">
                                <span class="input-group-text">+94</span>
                                <input type="tel" class="form-control" id="phone" name="phone" pattern="[0-9]{9}" required>
                            </div>
                            <div class="invalid-feedback">
                                Please provide a valid phone number (9 digits).
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" minlength="8" required>
                                <div class="invalid-feedback">
                                    Password must be at least 8 characters.
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="confirmPassword" class="form-label">Confirm Password</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                <div class="invalid-feedback">
                                    Passwords must match.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="terms" required>
                            <label class="form-check-label" for="terms">I agree to the <a href="#">Terms and Conditions</a></label>
                            <div class="invalid-feedback">
                                You must agree before submitting.
                            </div>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-lg">Create Account</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center py-3">
                    <p class="mb-0">Already have an account? <a href="login.jsp" class="text-primary">Sign in</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Form validation
    (function () {
        'use strict'

        const forms = document.querySelectorAll('.needs-validation')

        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                // Check if passwords match
                const password = document.getElementById('password')
                const confirmPassword = document.getElementById('confirmPassword')
                if (password.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity("Passwords don't match")
                } else {
                    confirmPassword.setCustomValidity('')
                }

                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>
</body>
</html>