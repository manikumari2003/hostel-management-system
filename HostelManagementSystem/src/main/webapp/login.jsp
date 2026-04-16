<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Hostel Management System</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #c7d2fe, #e0e7ff);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-card {
        width: 100%;
        max-width: 420px;
        padding: 40px;
        border-radius: 20px;
        background: white;
        box-shadow: 0 20px 40px rgba(0,0,0,0.15);
    }

    .login-title {
        font-weight: 700;
        color: #4f46e5;
    }

    .btn-indigo {
        background: linear-gradient(135deg,#6366f1,#4f46e5);
        border: none;
        color: white;
        font-weight: 600;
    }

    .btn-indigo:hover {
        background: linear-gradient(135deg,#4f46e5,#4338ca);
        color: white;
    }

    .form-control:focus {
        border-color: #6366f1;
        box-shadow: 0 0 0 0.25rem rgba(99,102,241,0.25);
    }

    .register-link {
        text-decoration: none;
        font-weight: 500;
        color: #4f46e5;
    }

    .register-link:hover {
        text-decoration: underline;
    }
</style>

</head>

<body>

<div class="login-card">

    <div class="text-center mb-4">
        <h3 class="login-title">Welcome Back</h3>
        <p class="text-muted">Login to your account</p>
    </div>

    <!-- Optional error message -->
    <%
    String error = request.getParameter("error");
    if ("true".equals(error)) {
    %>
        <div class="alert alert-danger">
            Invalid Email or Password!
        </div>
    <%
    }
    %>

    <form action="<%=request.getContextPath()%>/LoginController" method="post">

        <div class="mb-3">
            <label class="form-label">Email Address</label>
            <input type="email" name="email" class="form-control"
                   placeholder="Enter your email" required>
        </div>

        <div class="mb-4">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control"
                   placeholder="Enter your password" required>
        </div>

        <button type="submit" class="btn btn-indigo w-100">
            Login
        </button>

    </form>

    <div class="text-center mt-4">
        <a href="<%=request.getContextPath()%>/Register.jsp" class="register-link">
            Don’t have an account? Register
        </a>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
