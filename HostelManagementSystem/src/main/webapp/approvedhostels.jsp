<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.project.model.Hostel"%>

<%
    List<Hostel> hostels = (List<Hostel>) request.getAttribute("hostels");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Approved Hostels</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #f0fdf4, #dcfce7);
        font-family: Arial, sans-serif;
    }

    .card-container {
        background: white;
        padding: 30px;
        border-radius: 18px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    h2 {
        color: #15803d;
        font-weight: bold;
    }

    .table thead {
        background-color: #15803d;
        color: white;
    }

    .status-approved {
        background-color: #22c55e;
        color: white;
        padding: 5px 12px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: bold;
    }

    .back-btn {
        margin-top: 20px;
    }
</style>
</head>

<body>

<div class="container py-5">

    <div class="card-container">

        <h2 class="text-center mb-4">Approved Hostels</h2>

        <% if (hostels == null || hostels.isEmpty()) { %>

            <p class="text-center fs-5 text-muted">
                No approved hostels found.
            </p>

        <% } else { %>

            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Owner ID</th>
                            <th>Name</th>
                            <th>Location</th>
                            <th>Address</th>
                            <th>Type</th>
                            <th>Price</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>

                    <% for (Hostel h : hostels) { %>
                        <tr>
                            <td><%= h.getHostelId() %></td>
                            <td><%= h.getOwnerId() %></td>
                            <td><%= h.getHostelName() %></td>
                            <td><%= h.getLocation() %></td>
                            <td><%= h.getAddress() %></td>
                            <td><%= h.getHostelType() %></td>
                            <td>₹ <%= h.getPrice() %></td>
                            <td>
                                <span class="status-approved">
                                    <%= h.getStatus() %>
                                </span>
                            </td>
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