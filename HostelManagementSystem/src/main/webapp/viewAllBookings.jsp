<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.project.model.Booking"%>

<%
List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>All Bookings</title>

<!-- Bootstrap -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #eef2ff, #e0e7ff);
	font-family: Arial, sans-serif;
}

.container-box {
	background: white;
	padding: 30px;
	border-radius: 18px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #4f46e5;
	font-weight: bold;
}

.table thead {
	background: #4f46e5;
	color: white;
}

.status-pending {
	color: orange;
	font-weight: bold;
}

.status-approved {
	color: green;
	font-weight: bold;
}

.status-rejected {
	color: red;
	font-weight: bold;
}
</style>

</head>

<body>

	<div class="container py-5">

		<div class="container-box">

			<h2 class="text-center mb-4">All Bookings</h2>

			<%
			if (bookings == null || bookings.isEmpty()) {
			%>

			<p class="text-center text-muted fs-5">No bookings found.</p>

			<%
			} else {
			%>

			<div class="table-responsive">

				<table
					class="table table-bordered table-hover align-middle text-center">

					<thead>
						<tr>
							<th>Booking ID</th>
							<th>User Name</th>
							<th>Hostel Name</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>

					<tbody>

						<%
						for (Booking b : bookings) {
						%>

						<tr>

							<td><%=b.getBookingId()%></td>
							<td><%=b.getUserName()%></td>
							<td><%=b.getHostelName()%></td>

							<td>
								<%
								String status = b.getStatus();

								if ("CONFIRMED".equalsIgnoreCase(status)) {
								%> <span class="status-approved"><%=status%></span> <%
 } else if ("PENDING".equalsIgnoreCase(status)) {
 %>

								<span class="status-pending"><%=status%></span> <%
 } else {
 %> <span
								class="status-rejected"><%=status%></span> <%
 }
 %>

							</td>

							<td>
								<%
								if ("PENDING".equalsIgnoreCase(status)) {
								%> <a
								href="<%=request.getContextPath()%>/ApproveBookingController?bookingId=<%=b.getBookingId()%>"
								class="btn btn-success btn-sm"> Approve </a> <a
								href="<%=request.getContextPath()%>/RejectBookingController?bookingId=<%=b.getBookingId()%>"
								class="btn btn-danger btn-sm"> Reject </a> <%
 } else {
 %> <span
								class="text-muted">No Action</span> <%
 }
 %>

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

			<div class="text-center mt-4">

				<a href="admindashboard.jsp" class="btn btn-outline-dark"> ⬅
					Back to Dashboard </a>

			</div>

		</div>

	</div>

</body>
</html>
