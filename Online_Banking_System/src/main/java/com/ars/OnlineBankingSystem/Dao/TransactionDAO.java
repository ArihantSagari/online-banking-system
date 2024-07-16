package com.ars.OnlineBankingSystem.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ars.OnlineBankingSystem.Model.Transaction;

public class TransactionDAO {
    
    public static boolean recordTransaction(Transaction transaction) {
        try (Connection connection = Database.getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO transactions (account_id, type, amount, timestamp) VALUES (?, ?, ?, ?)")) {
            statement.setInt(1, transaction.getAccountId());
            statement.setString(2, transaction.getType());
            statement.setDouble(3, transaction.getAmount());
            statement.setString(4, transaction.getTimestamp());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Transaction> getTransactionsByAccountId(int accountId) {
        List<Transaction> transactions = new ArrayList<>();
        try (Connection connection = Database.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM transactions WHERE account_id = ? ORDER BY timestamp DESC")) {
            statement.setInt(1, accountId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Transaction transaction = new Transaction();
                transaction.setId(resultSet.getInt("id"));
                transaction.setAccountId(resultSet.getInt("account_id"));
                transaction.setType(resultSet.getString("type"));
                transaction.setAmount(resultSet.getDouble("amount"));
                transaction.setTimestamp(resultSet.getString("timestamp"));
                transactions.add(transaction);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }
}
