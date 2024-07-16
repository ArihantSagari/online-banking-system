package com.ars.OnlineBankingSystem.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ars.OnlineBankingSystem.Dao.AccountDAO;
import com.ars.OnlineBankingSystem.Model.Account;

@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        double amount = Double.parseDouble(request.getParameter("amount"));

        Account account = AccountDAO.getAccountByUserId(userId);

        if (AccountDAO.deposit(account.getId(), amount)) {
            response.sendRedirect("userDashboard.jsp");
        } else {
            request.setAttribute("message", "Deposit failed. Please try again.");
            request.getRequestDispatcher("deposit.jsp").forward(request, response);
        }
    }
}
