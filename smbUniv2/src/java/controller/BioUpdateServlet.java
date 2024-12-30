/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.jdbc;
import java.io.IOException;
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
@WebServlet("/BioUpdateServlet")
public class BioUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null || username.isEmpty()) {
            request.setAttribute("message", "Anda belum login.");
            request.getRequestDispatcher("pages/bio.jsp").forward(request, response);
            return;
        }

        String nama = request.getParameter("nama");
        String nisn = request.getParameter("nisn");
        String password = request.getParameter("password");

        if (nama == null || nisn == null || password == null || 
            nama.trim().isEmpty() || nisn.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("message", "Semua field harus diisi!");
            request.getRequestDispatcher("pages/bio.jsp").forward(request, response);
            return;
        }

        jdbc db = new jdbc();
        db.connect();
        if (db.isConnected) {
            String query = "UPDATE calon_mahasiswa SET nama = ?, nisn = ?, password = ? WHERE username = ?";
            try {
                var ps = db.getConnection().prepareStatement(query);
                ps.setString(1, nama);
                ps.setString(2, nisn);
                ps.setString(3, password);
                ps.setString(4, username);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    // Redirect to dashboard after successful update
                    response.sendRedirect("pages/dashMaba.jsp");
                    return; // Exit the method to avoid further processing
                } else {
                    request.setAttribute("message", "Gagal memperbarui data. Username tidak ditemukan.");
                }
            } catch (Exception e) {
                request.setAttribute("message", "Error: " + e.getMessage());
            } finally {
                db.disconnect();
            }
        } else {
            request.setAttribute("message", "Koneksi ke database gagal: " + db.message);
        }

        // If there's an error, stay on bio.jsp
        request.getRequestDispatcher("pages/bio.jsp").forward(request, response);
    }
}
