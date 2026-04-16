<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.project.model.User"%>

<%
    List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registered Users</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg,#eef2ff,#e0e7ff);
        font-family: Arial, sans-serif;
    }

    .card-container {
        background: white;
        padding: 30px;
        border-radius: 18px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    h2 {
        color: #4f46e5;
        font-weight: bold;
    }

    .table thead {
        background-color: #4f46e5;
        color: white;
    }

    .back-btn {
        margin-top: 20px;
    }
</style>
</head>

<body>

<div class="container py-5">

    <div class="card-container">

        <h2 class="text-center mb-4">Registered Users</h2>

        <% if (users == null || users.isEmpty()) { %>

            <p class="text-center fs-5 text-muted">
                No users found.
            </p>

        <% } else { %>

            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle text-center">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Name</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>

                    <% for (User u : users) { %>
                        <tr>
                            <td><%= u.getUserId() %></td>
                            <td><%= u.getName() %></td>
                            <td><%= u.getEmail() %></td>
                        </tr>
                    <% } %>

                    </tbody>
                </table>
            </div>

        <% } %>

        <div class="text-center back-btn">
            <a href="admindashboard.jsp" class="btn btn-outline-dark">
                ⬅ Back to Dashboard
            </a>
        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>