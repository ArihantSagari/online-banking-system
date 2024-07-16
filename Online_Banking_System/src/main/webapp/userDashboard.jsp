<%@ include file="header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ars.OnlineBankingSystem.Model.Account" %>
<%@ page import="com.ars.OnlineBankingSystem.Model.Transaction" %>
<%@ page import="com.ars.OnlineBankingSystem.Model.User" %>
<%@ page import="com.ars.OnlineBankingSystem.Dao.AccountDAO" %>
<%@ page import="com.ars.OnlineBankingSystem.Dao.TransactionDAO" %>
<%@ page import="com.ars.OnlineBankingSystem.Dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <style>
        .dashboard-container {
            margin-top: 50px;
        }
        .card {
            margin-top: 20px;
        }
        .btn-group {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container dashboard-container">
        <%
            int userId = (int) session.getAttribute("userId");
            Account account = AccountDAO.getAccountByUserId(userId);
            List<Transaction> transactions = TransactionDAO.getTransactionsByAccountId(account.getId());
            User user = (User) session.getAttribute("user");
        %>
        <h2 class="text-center">Welcome, <%= user.getUsername() %></h2>
        <div class="card">
            <div class="card-header">
                Account Information
            </div>
            <div class="card-body">
                <p class="card-text"><strong>Account Number:</strong> <%= account.getAccountNumber() %></p>
                <p class="card-text"><strong>Balance:</strong> $<%= account.getBalance() %></p>
            </div>
        </div>
        <div class="btn-group d-flex justify-content-center" role="group">
            <a href="performTransaction.jsp" class="btn btn-primary mr-2">Perform Transaction</a>
        </div>
        <div class="mt-5">
            <h4>Transaction History</h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Date</th>
                        <th>Type</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Transaction transaction : transactions) { %>
                        <tr>
                            <td><%= transaction.getId() %></td>
                            <td><%= transaction.getType() %></td>
                            <td>$<%= transaction.getAmount() %></td>
                            
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
