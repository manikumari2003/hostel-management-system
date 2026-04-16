<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Hostel" %>
<%@ page import="com.project.model.User" %>

<%
    User user = (User) session.getAttribute("loggedUser");
    if (user == null || !"USER".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    List<Hostel> hostels = (List<Hostel>) request.getAttribute("hostels");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Hostels</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg,#f3e8ff,#ede9fe);
    min-height: 100vh;
}

.card {
    border-radius: 18px;
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-6px);
    box-shadow: 0 15px 30px rgba(88,28,135,0.25);
}

.btn-purple {
    background: linear-gradient(135deg,#7c3aed,#5b21b6);
    border: none;
    color: white;
}

.btn-purple:hover {
    background: linear-gradient(135deg,#6d28d9,#4c1d95);
}
</style>

</head>
<body>

<div class="container py-5">

    <h2 class="text-center mb-4 fw-bold text-dark">
        Available Hostels
    </h2>

    <div class="row g-4">

        <% if (hostels != null && !hostels.isEmpty()) { %>
            <% for (Hostel h : hostels) { %>

                <div class="col-md-4">
                    <div class="card p-4 h-100 text-center">

                        <h5 class="fw-bold">
                            <%= h.getHostelName() %>
                        </h5>

                        <p class="text-muted mb-1">
                            <%= h.getLocation() %>
                        </p>

                        <p class="mb-1">
                            <b>Type:</b> <%= h.getHostelType() %>
                        </p>

                        <p class="fw-bold text-success">
                            ₹ <%= h.getPrice() %> / month
                        </p>

                        <a href="<%=request.getContextPath()%>/BookHostelController?hostelId=<%=h.getHostelId()%>"
                           class="btn btn-purple w-100">
                           Book Now
                        </a>

                    </div>
                </div>

            <% } %>
        <% } else { %>

            <div class="col-12 text-center">
                <p class="fs-5 text-muted">
                    No approved hostels available.
                </p>
            </div>

        <% } %>

    </div>

    <div class="text-center mt-4">
        <a href="<%=request.getContextPath()%>/userdashboard.jsp"
           class="btn btn-outline-secondary">
           ⬅ Back to Dashboard
        </a>
    </div>

</div>

</body>
</html>
