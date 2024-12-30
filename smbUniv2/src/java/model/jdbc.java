/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ARMAGEDON
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class jdbc {
    Connection con;
    Statement stmt;
    public boolean isConnected;
    public String message;
    
    public jdbc() {
        this.isConnected = false;
        this.message = "Not connected";
    }
    
    public void connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seleksimaba", "root", "");
            stmt = con.createStatement();
            isConnected = true;
            message = "DB connected";
        } catch (ClassNotFoundException e) {
            isConnected = false;
            message = "Driver not found: " + e.getMessage();
        } catch (SQLException e) {
            isConnected = false;
            message = "Database connection failed: " + e.getMessage();
        }
    }

    public void disconnect() {
        try {
            if (stmt != null) stmt.close();
            if (con != null) con.close();
            isConnected = false;
            message = "DB disconnected";
        } catch (SQLException e) {
            message = "Failed to disconnect: " + e.getMessage();
        }
    }

    public int runUpdate(String query) {
        try (Statement stmt = con.createStatement()) {
            int result = stmt.executeUpdate(query);
            message = result + " rows affected.";
            return result;
        } catch (SQLException e) {
            message = "Update failed: " + e.getMessage();
            return -1;
        }
    }

    public ResultSet getData(String query) {
        try {
            if (stmt == null || con == null || con.isClosed()) {
                message = "Connection is not active.";
                return null;
            }
            return stmt.executeQuery(query);
        } catch (SQLException e) {
            message = "Failed to execute query: " + e.getMessage();
            return null;
        }
    }
    
    public Connection getConnection() {
        return con;
    }
    
    public boolean isUsernameExists(String username) {
        try {
            String query = "SELECT COUNT(*) AS count FROM admin WHERE username = ? UNION SELECT COUNT(*) FROM calon_mahasiswa WHERE username = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, username);

            ResultSet rs = stmt.executeQuery();
            if (rs.next() && rs.getInt("count") > 0) {
                return true; // Username exists
            }
        } catch (SQLException e) {
            message = "Error checking username: " + e.getMessage();
        }
        return false; // Username does not exist
    }

    
}