<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perform Transaction</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Perform Transaction</h2>
        <c:if test="${not empty message}">
            <div class="alert alert-danger">${message}</div>
        </c:if>
        <form action="DepositServlet" method="post" class="mb-3">
            <div class="form-group">
                <label for="depositAmount">Deposit Amount</label>
                <input type="number" class="form-control" id="depositAmount" name="amount" required>
            </div>
            <button type="submit" class="btn btn-primary">Deposit</button>
        </form>
        <form action="DebitServlet" method="post">
            <div class="form-group">
                <label for="debitAmount">Debit Amount</label>
                <input type="number" class="form-control" id="debitAmount" name="amount" required>
            </div>
            <button type="submit" class="btn btn-danger">Debit</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
