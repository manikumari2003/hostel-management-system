<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
   // <%//
//User user = (User) session.getAttribute("user");

//if(user == null || !user.getRole().equals("ADMIN")){
  //  response.sendRedirect("../login.jsp");
//}
//%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Welcome Admin</h2>

<ul>
    <li><a href="viewPendingHostels.jsp">Approve Hostels</a></li>
    <li><a href="viewUsers.jsp">View Users</a></li>
    <li><a href="../logout.jsp">Logout</a></li>
</ul>

</body>
</html>