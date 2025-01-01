/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.jdbc;

/**
 *
 * @author ARMAGEDON
 */
@WebServlet("/pages/regis1")
public class RegisJurusanController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        // Validasi login
        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Ambil jurusan yang dipilih
        String[] jurusanDipilih = request.getParameterValues("jurusan");

        // Validasi jumlah jurusan
        if (jurusanDipilih == null || jurusanDipilih.length == 0) {
            request.setAttribute("error", "Anda harus memilih minimal satu jurusan.");
            request.getRequestDispatcher("regis1.jsp").forward(request, response);
            return;
        } else if (jurusanDipilih.length > 4) {
            request.setAttribute("error", "Anda hanya boleh memilih maksimal 4 jurusan.");
            request.getRequestDispatcher("regis1.jsp").forward(request, response);
            return;
        }

        // Menyimpan jurusan yang dipilih ke dalam kolom piljurusan1, piljurusan2, dst.
        String jurusan1 = (jurusanDipilih.length > 0) ? jurusanDipilih[0] : null;
        String jurusan2 = (jurusanDipilih.length > 1) ? jurusanDipilih[1] : null;
        String jurusan3 = (jurusanDipilih.length > 2) ? jurusanDipilih[2] : null;
        String jurusan4 = (jurusanDipilih.length > 3) ? jurusanDipilih[3] : null;

        // Simpan ke database
        jdbc db = new jdbc();
        db.connect();
        if (db.isConnected) {
            try {
                // Ambil id calon mahasiswa berdasarkan username
                String query = "SELECT id FROM calon_mahasiswa WHERE username = ?";
                try (PreparedStatement ps = db.getConnection().prepareStatement(query)) {
                    ps.setString(1, username);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        int calonMahasiswaId = rs.getInt("id");

                        // Insert data pilihan jurusan
                        String insertQuery = "INSERT INTO pilihan_jurusan (calon_mahasiswa_id, piljurusan1, piljurusan2, piljurusan3, piljurusan4) "
                                + "VALUES (?, ?, ?, ?, ?)";
                        try (PreparedStatement psInsert = db.getConnection().prepareStatement(insertQuery)) {
                            psInsert.setInt(1, calonMahasiswaId);
                            psInsert.setString(2, jurusan1); // Pilihan jurusan pertama
                            psInsert.setString(3, jurusan2); // Pilihan jurusan kedua
                            psInsert.setString(4, jurusan3); // Pilihan jurusan ketiga
                            psInsert.setString(5, jurusan4); // Pilihan jurusan keempat

                            int rowsAffected = psInsert.executeUpdate();
                            if (rowsAffected > 0) {
                                response.sendRedirect("regis2.jsp");
                            } else {
                                request.setAttribute("error", "Gagal menyimpan pilihan jurusan. Silakan coba lagi.");
                                request.getRequestDispatcher("regis1.jsp").forward(request, response);
                            }
                        } catch (SQLException e) {
                            request.setAttribute("error", "Kesalahan saat menyimpan pilihan jurusan: " + e.getMessage());
                            request.getRequestDispatcher("regis1.jsp").forward(request, response);
                        }
                    } else {
                        request.setAttribute("error", "Username tidak ditemukan.");
                        request.getRequestDispatcher("regis1.jsp").forward(request, response);
                    }
                }
            } catch (SQLException e) {
                request.setAttribute("error", "Kesalahan database: " + e.getMessage());
                request.getRequestDispatcher("regis1.jsp").forward(request, response);
            } finally {
                db.disconnect();
            }
        } else {
            request.setAttribute("error", "Koneksi database gagal: " + db.message);
            request.getRequestDispatcher("regis1.jsp").forward(request, response);
        }
    }
}