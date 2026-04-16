<%@ page isErrorPage="true" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
<div class="container mt-5">
    <div class="alert alert-warning">
        <h4>Something went wrong!</h4>
        <p>Please try again later.</p>
    </div>

    <details>
        <summary>Technical Details</summary>
        <pre><%= exception %></pre>
    </details>

    <a href="login.jsp" class="btn btn-secondary mt-3">Back to Login</a>
</div>
</body>
</html>
