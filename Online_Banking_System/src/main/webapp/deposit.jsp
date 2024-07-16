<!DOCTYPE html>
<html>
<head>
    <title>Deposit</title>
</head>
<body>
    <h2>Deposit</h2>
    <form action="DepositServlet" method="post">
        Amount: <input type="number" name="amount" required><br>
        <input type="submit" value="Deposit">
    </form>
    <p><%= request.getAttribute("message") %></p>
</body>
</html>
