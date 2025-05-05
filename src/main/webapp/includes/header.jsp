<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="bi bi-car-front-fill me-2"></i>City Cab Service
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link ${param.activePage == 'home' ? 'active' : ''}" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.activePage == 'about' ? 'active' : ''}" href="about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.activePage == 'services' ? 'active' : ''}" href="services.jsp">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.activePage == 'contact' ? 'active' : ''}" href="contact.jsp">Contact</a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <% if (session.getAttribute("user") != null) { %>
                <li class="nav-item">
                    <a class="nav-link ${param.activePage == 'profile' ? 'active' : ''}" href="profile.jsp">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserServlet?action=logout">Logout</a>
                </li>
                <% } else { %>
                <li class="nav-item">
                    <a class="nav-link ${param.activePage == 'login' ? 'active' : ''}" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.activePage == 'register' ? 'active' : ''}" href="register.jsp">Register</a>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>