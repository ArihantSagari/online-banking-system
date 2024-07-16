<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Banking System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container mt-5">
        <div class="jumbotron">
            <h1 class="display-4">Welcome to Online Banking System</h1>
            <p class="lead">This is a prototype of a real-world online banking application. You can register, log in, and manage your banking operations seamlessly.</p>
            <hr class="my-4">
            <p>Get started by registering an account or logging in.</p>
            <a class="btn btn-primary btn-lg" href="register.jsp" role="button">Register</a>
            <a class="btn btn-secondary btn-lg" href="login.jsp" role="button">Login</a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
