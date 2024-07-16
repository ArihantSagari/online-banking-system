<!DOCTYPE html>
<html>
<head>
    <title>Withdraw</title>
</head>
<body>
    <h2>Withdraw</h2>
    <form action="WithdrawServlet" method="post">
        Amount: <input type="number" name="amount" required><br>
        <input type="submit" value="Withdraw">
    </form>
    <p><%= request.getAttribute("message") %></p>
</body>
</html>
