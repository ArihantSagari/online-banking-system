package com.ars.OnlineBankingSystem.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class Database {
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebankingsystem", "root", "root");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
