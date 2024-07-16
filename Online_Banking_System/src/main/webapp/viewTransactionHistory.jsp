<%@ include file="header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ars.OnlineBankingSystem.Model.*" %>
<%@ page import="com.ars.OnlineBankingSystem.Dao.*" %>
<%
    int userId = (int) session.getAttribute("userId");
    Account account = AccountDAO.getAccountByUserId(userId);
    List<Transaction> transactions = TransactionDAO.getTransactionsByAccountId(account.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= account.getAccountNumber() %></h2>
    <p>Balance: $<%= account.getBalance() %></p>
    <h3>Transactions</h3>
   <table border="1">
        <tr>
            <th>ID</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Timestamp</th>
        </tr>
        <%
            for (Transaction transaction : transactions) {
        %>
            <tr>
                <td><%= transaction.getId() %></td>
                <td><%= transaction.getType() %></td>
                <td><%= transaction.getAmount() %></td>
                <td><%= transaction.getTimestamp() %></td>
            </tr>
        <%
            }
        %>
    </table>

    <h3>Deposit</h3>
    <form action="DepositServlet" method="post">
        Amount: <input type="number" name="amount" required><br>
        <input type="submit" value="Deposit">
    </form>
    <h3>Withdraw</h3>
    <form action="WithdrawServlet" method="post">
        Amount: <input type="number" name="amount" required><br>
        <input type="submit" value="Withdraw">
    </form>
</body>
</html>
