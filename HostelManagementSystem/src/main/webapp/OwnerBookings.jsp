<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Booking" %>
<%@ page import="com.project.model.User" %>

<%
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Bookings</title>
    <meta charset="UTF-8">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #e8f5e9);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2e7d32;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #2e7d32;
            color: white;
            padding: 12px;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .status-approved {
            color: white;
            background-color: #28a745;
            padding: 5px 10px;
            border-radius: 20px;
        }

        .status-pending {
            color: black;
            background-color: #ffc107;
            padding: 5px 10px;
            border-radius: 20px;
        }

        .status-rejected {
            color: white;
            background-color: #dc3545;
            padding: 5px 10px;
            border-radius: 20px;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            font-size: 18px;
            color: #555;
        }

        .back-btn {
            display: block;
            width: 200px;
            margin: 30px auto 0;
            text-align: center;
            padding: 10px;
            background-color: #2e7d32;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }

        .back-btn:hover {
            background-color: #1b5e20;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>My Bookings</h2>

    <%
        if (bookings == null || bookings.isEmpty()) {
    %>
        <div class="no-data">No bookings found.</div>
    <%
        } else {
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Hostel Name</th>
            <th>Booking Date</th>
            <th>Status</th>
        </tr>

        <%
            for (Booking b : bookings) {
                String status = b.getStatus();
        %>
        <tr>
            <td><%= b.getBookingId() %></td>
            <td><%= b.getHostelName() %></td>
            <td><%= b.getBookingDate() %></td>
            <td>
                <%
                    if ("APPROVED".equalsIgnoreCase(status)) {
                %>
                    <span class="status-approved">Approved</span>
                <%
                    } else if ("PENDING".equalsIgnoreCase(status)) {
                %>
                    <span class="status-pending">Pending</span>
                <%
                    } else {
                %>
                    <span class="status-rejected">Rejected</span>
                <%
                    }
                %>
            </td>
        </tr>
        <%
            }
        %>

    </table>

    <%
        }
    %>

    <a href="ownerdashboard.jsp" class="back-btn">⬅ Back to Dashboard</a>

</div>

</body>
</html>