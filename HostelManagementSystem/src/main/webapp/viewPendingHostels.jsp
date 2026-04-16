<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Hostel" %>

<%
    List<Hostel> hostels = (List<Hostel>) request.getAttribute("hostels");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pending Hostels</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #ede9fe, #f3e8ff);
        font-family: Arial, sans-serif;
    }

    .card-container {
        background: white;
        padding: 30px;
        border-radius: 18px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    h2 {
        color: #5b21b6;
        font-weight: bold;
    }

    .table thead {
        background-color: #5b21b6;
        color: white;
    }

    .status-badge {
        padding: 5px 12px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: bold;
    }

    .pending {
        background-color: #ffc107;
        color: black;
    }

    .btn-approve {
        background-color: #28a745;
        border: none;
    }

    .btn-approve:hover {
        background-color: #218838;
    }

    .btn-reject {
        background-color: #dc3545;
        border: none;
    }

    .btn-reject:hover {
        background-color: #c82333;
    }

    .back-btn {
        margin-top: 20px;
    }
</style>
</head>

<body>

<div class="container py-5">

    <div class="card-container">

        <h2 class="text-center mb-4">Pending Hostels</h2>

        <%
            if (hostels == null || hostels.isEmpty()) {
        %>
            <p class="text-center fs-5 text-muted">No pending hostels found.</p>
        <%
            } else {
        %>

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
                        <th width="180px">Actions</th>
                    </tr>
                </thead>
                <tbody>

                <%
                    for (Hostel h : hostels) {
                %>
                    <tr>
                        <td><%= h.getHostelId() %></td>
                        <td><%= h.getOwnerId() %></td>
                        <td><%= h.getHostelName() %></td>
                        <td><%= h.getLocation() %></td>
                        <td><%= h.getAddress() %></td>
                        <td><%= h.getHostelType() %></td>
                        <td>₹ <%= h.getPrice() %></td>
                        <td>
                            <span class="status-badge pending">
                                <%= h.getStatus() %>
                            </span>
                        </td>
                        <td>
                            <a class="btn btn-approve btn-sm me-2"
                               href="<%=request.getContextPath()%>/ApproveHostelController?hostelId=<%= h.getHostelId() %>">
                               Approve
                            </a>

                            <a class="btn btn-reject btn-sm"
                               href="<%=request.getContextPath()%>/RejectHostelController?hostelId=<%= h.getHostelId() %>">
                               Reject
                            </a>
                        </td>
                    </tr>
                <%
                    }
                %>

                </tbody>
            </table>
        </div>

        <%
            }
        %>

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