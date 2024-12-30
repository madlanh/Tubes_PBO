/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.jdbc;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ARMAGEDON
 */
@WebServlet("/pages/signup")
public class SignUpController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String nama = request.getParameter("nama");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        if (!role.equals("admin") && !role.equals("mahasiswa")) {
            response.sendRedirect("signup.jsp?error=invalid_role");
            return;
        }

        try {
            jdbc db = new jdbc();
            db.connect();

            String query;
            if (role.equals("admin")) {
                query = "INSERT INTO admin (username, password, nama) VALUES (?, ?, ?)";
            } else { // role.equals("mahasiswa")
                query = "INSERT INTO calon_mahasiswa (email, username, password, nama) VALUES (?, ?, ?, ?)";
            }

            PreparedStatement stmt = db.getConnection().prepareStatement(query);

            if (role.equals("admin")) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                stmt.setString(3, nama);
            } else if (role.equals("mahasiswa")) {
                stmt.setString(1, email);
                stmt.setString(2, username);
                stmt.setString(3, password);
                stmt.setString(4, nama);
            }

            stmt.executeUpdate();
            stmt.close();
            db.disconnect();

            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=database_error");
        }
    }
}