<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - Hostel Management System</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #ede9fe, #f3e8ff);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .register-card {
        width: 100%;
        max-width: 480px;
        border-radius: 20px;
        box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        padding: 40px;
        background: white;
    }

    .register-title {
        font-weight: 700;
        color: #5b21b6;
    }

    .btn-purple {
        background: linear-gradient(135deg,#7c3aed,#5b21b6);
        border: none;
        color: white;
        font-weight: 600;
    }

    .btn-purple:hover {
        background: linear-gradient(135deg,#6d28d9,#4c1d95);
        color: white;
    }

    .form-control:focus,
    .form-select:focus {
        box-shadow: 0 0 0 0.25rem rgba(124,58,237,0.25);
        border-color: #7c3aed;
    }

    .login-link {
        text-decoration: none;
        font-weight: 500;
        color: #5b21b6;
    }

    .login-link:hover {
        text-decoration: underline;
    }
</style>

</head>

<body>

<div class="register-card">

    <div class="text-center mb-4">
        <h3 class="register-title">Create Account</h3>
        <p class="text-muted">Register to use Hostel Management System</p>
    </div>

    <form action="<%=request.getContextPath()%>/RegisterController" method="post">

        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="form-control"
                   placeholder="Enter your full name" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email Address</label>
            <input type="email" name="email" class="form-control"
                   placeholder="Enter your email" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control"
                   placeholder="Create a password" required>
        </div>

        <div class="mb-4">
            <label class="form-label">Select Role</label>
            <select name="role" class="form-select" required>
                <option value="">-- Select Role --</option>
                <option value="USER">User</option>
                <option value="ADMIN">Admin</option>
                <option value="OWNER">Owner</option>
            </select>
        </div>

        <button type="submit" class="btn btn-purple w-100">
            Register
        </button>

    </form>

    <div class="text-center mt-4">
        <a href="<%=request.getContextPath()%>/login.jsp" class="login-link">
            Already have an account? Login
        </a>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
