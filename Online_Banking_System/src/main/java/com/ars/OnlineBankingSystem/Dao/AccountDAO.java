package com.ars.OnlineBankingSystem.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ars.OnlineBankingSystem.Model.Account;

public class AccountDAO {

    public static Account getAccountByUserId(int userId) {
        Account account = null;
        try (Connection connection = Database.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM accounts WHERE user_id = ?")) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                account = new Account();
                account.setId(resultSet.getInt("id"));
                account.setUserId(resultSet.getInt("user_id"));
                account.setBalance(resultSet.getDouble("balance"));
                account.setAccountNumber(resultSet.getString("account_number"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public static boolean createAccountForUser(int userId) {
        try (Connection connection = Database.getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO accounts (user_id, balance, account_number) VALUES (?, 0, ?)")) {
            statement.setInt(1, userId);
            statement.setString(2, generateAccountNumber());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean withdraw(int accountId, double amount) {
        try (Connection connection = Database.getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE accounts SET balance = balance - ? WHERE id = ? AND balance >= ?")) {
            statement.setDouble(1, amount);
            statement.setInt(2, accountId);
            statement.setDouble(3, amount);
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                recordTransaction(accountId, "withdrawal", amount);
                return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean deposit(int accountId, double amount) {
        try (Connection connection = Database.getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE accounts SET balance = balance + ? WHERE id = ?")) {
            statement.setDouble(1, amount);
            statement.setInt(2, accountId);
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                recordTransaction(accountId, "deposit", amount);
                return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static boolean recordTransaction(int accountId, String type, double amount) {
        try (Connection connection = Database.getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO transactions (account_id, type, amount) VALUES (?, ?, ?)")) {
            statement.setInt(1, accountId);
            statement.setString(2, type);
            statement.setDouble(3, amount);
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static String generateAccountNumber() {
        String accountNumber = "";
        for (int i = 0; i < 10; i++) {
            int digit = (int) (Math.random() * 10);
            accountNumber += digit;
        }
        return accountNumber;
    }
}
