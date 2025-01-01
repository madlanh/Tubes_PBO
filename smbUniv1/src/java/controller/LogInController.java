/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.jdbc;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ARMAGEDON
 */
@WebServlet("/pages/login")
public class LogInController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            jdbc db = new jdbc();  // Membuat objek jdbc
            db.connect();  // Menghubungkan ke database
            Connection conn = db.getConnection();  // Mendapatkan koneksi
            
            String query = "";
            
            // Menyesuaikan query untuk login berdasarkan role
            if ("admin".equals(role)) {
                query = "SELECT * FROM admin WHERE username = ? AND password = ?";
            } else if ("mahasiswa".equals(role)) {
                query = "SELECT username, nama FROM calon_mahasiswa WHERE username = ? AND password = ?";
            } else {
                response.sendRedirect("login.jsp?error=1");
                return;
            }

            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password); // Password untuk kedua role
            
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                // Menambahkan nama ke session
                String nama = rs.getString("nama");
                session.setAttribute("nama", nama);
                session.setAttribute("role", role);

                if (role.equals("admin")) {
                    response.sendRedirect("adminDash.jsp");
                } else {
                    response.sendRedirect("dashMaba.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?error=1");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
