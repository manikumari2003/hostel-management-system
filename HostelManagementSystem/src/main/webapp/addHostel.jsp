<%@ page import="com.project.model.User" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%
User user = (User) session.getAttribute("loggedUser");
if (user == null || !"OWNER".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect("../login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Hostel</title>
</head>
<body>

<h2>Add Hostel</h2>

<form action="<%=request.getContextPath()%>/AddHostelController" method="post">


    Hostel Name:
    <input type="text" name="hostelName" required>
    <br><br>

    Location:
    <input type="text" name="location" required>
    <br><br>

    Total Rooms:
    <input type="number" name="rooms" required>
    <br><br>

    <input type="submit" value="Add Hostel">

</form>

<br>
<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>
