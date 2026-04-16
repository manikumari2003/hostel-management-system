<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.model.User" %>

<%
    User user = (User) session.getAttribute("loggedUser");
    if (user == null || !"OWNER".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Hostel</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #ede9fe, #f5f3ff);
        min-height: 100vh;
    }

    .card {
        border-radius: 18px;
        transition: 0.3s;
    }

    .card:hover {
        transform: translateY(-4px);
        box-shadow: 0 15px 35px rgba(88,28,135,0.25);
    }

    .card-header {
        background: linear-gradient(135deg, #7c3aed, #5b21b6);
        border-radius: 18px 18px 0 0;
    }

    .input-group-text {
        background-color: #ede9fe;
        color: #6d28d9;
        border-right: 0;
    }

    .form-control {
        border-left: 0;
    }

    .form-control:focus {
        box-shadow: none;
        border-color: #7c3aed;
    }

    .btn-purple {
        background: linear-gradient(135deg, #7c3aed, #5b21b6);
        border: none;
        color: white;
        font-size: 1.05rem;
        transition: 0.3s;
    }

    .btn-purple:hover {
        transform: scale(1.03);
        background: linear-gradient(135deg, #6d28d9, #4c1d95);
    }

    .card-footer a {
        color: #6d28d9;
        text-decoration: none;
        font-weight: 500;
    }

    .card-footer a:hover {
        text-decoration: underline;
    }
</style>
</head>

<body>

<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-7">

<div class="card shadow-lg">
<div class="card-header text-white text-center">
    <h4><i class="bi bi-building-add me-2"></i>Add Hostel</h4>
    <small>Register your hostel for approval</small>
</div>

<div class="card-body p-4">

<form action="<%=request.getContextPath()%>/AddHostelController" method="post">

    <!-- Hostel Name -->
    <label class="form-label">Hostel Name</label>
    <div class="input-group mb-3">
        <span class="input-group-text"><i class="bi bi-building"></i></span>
        <input type="text" name="hostelName" class="form-control" required>
    </div>

    <!-- Location -->
    <label class="form-label">Location</label>
    <div class="input-group mb-3">
        <span class="input-group-text"><i class="bi bi-geo-alt-fill"></i></span>
        <input type="text" name="location" class="form-control" required>
    </div>

    <!-- Address -->
    <label class="form-label">Address</label>
    <div class="input-group mb-3">
        <span class="input-group-text"><i class="bi bi-map-fill"></i></span>
        <textarea name="address" class="form-control" rows="2"></textarea>
    </div>

    <!-- Hostel Type -->
    <label class="form-label">Hostel Type</label>
    <div class="input-group mb-3">
        <span class="input-group-text"><i class="bi bi-gender-ambiguous"></i></span>
        <select name="hostelType" class="form-select" required>
            <option value="">Select</option>
            <option value="BOYS">Boys</option>
            <option value="GIRLS">Girls</option>
        </select>
    </div>

    <!-- Price -->
    <label class="form-label">Monthly Price</label>
    <div class="input-group mb-4">
        <span class="input-group-text"><i class="bi bi-currency-rupee"></i></span>
        <input type="number" step="0.01" name="price" class="form-control" required>
    </div>

    <div class="d-grid">
        <button class="btn btn-purple py-2">
            <i class="bi bi-check-circle-fill me-2"></i>
            Submit for Approval
        </button>
    </div>

</form>

</div>

<div class="card-footer text-center bg-light">
    <i class="bi bi-arrow-left-circle me-1"></i>
    <a href="<%=request.getContextPath()%>/ownerdashboard.jsp">Back to Dashboard</a>
</div>

</div>
</div>
</div>
</div>

</body>
</html>