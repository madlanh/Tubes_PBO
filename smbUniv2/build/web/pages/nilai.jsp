<%-- 
    Document   : nilai
    Created on : Dec 26, 2024, 4:56:33 AM
    Author     : ARMAGEDON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, model.jdbc" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nilai Mahasiswa</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #3C4A45;
            color: #ffffff;
        }
        .table {
            background-color: #D4E1D8;
            color: #000000;
            border-color: white;
        }
        .table thead {
            background-color: #171D20;
            color: #ffffff;
            border-color: white;
        }
        .form-control {
            background-color: #e9ecef;
            color: #000000;
        }
        .form-check-label {
            color: #ffffff;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="text-center">Data Mahasiswa</h1>
            <a href="adminDash.jsp" class="btn btn-dark">Kembali ke Dashboard</a>
        </div>
        <%
            jdbc db = new jdbc();
            db.connect();
            String message = "";

            if (request.getMethod().equalsIgnoreCase("POST")) {
                int calonMahasiswaId = Integer.parseInt(request.getParameter("calon_mahasiswa_id"));
                double nilai = Double.parseDouble(request.getParameter("nilai"));
                boolean status = request.getParameter("status") != null;

                try {
                    String updateCalonMahasiswa = "UPDATE calon_mahasiswa SET nilai = ?, status = ? WHERE id = ?";
                    try (PreparedStatement ps = db.getConnection().prepareStatement(updateCalonMahasiswa)) {
                        ps.setDouble(1, nilai);
                        ps.setBoolean(2, status);
                        ps.setInt(3, calonMahasiswaId);
                        ps.executeUpdate();
                    }
                    message = "Data berhasil diperbarui.";
                } catch (SQLException e) {
                    message = "Error: " + e.getMessage();
                }
            }

            String query = "SELECT cm.id, cm.nama, cm.NISN, cm.nilai, cm.status, pj.piljurusan1, pj.piljurusan2, pj.piljurusan3, pj.piljurusan4 " +
                           "FROM calon_mahasiswa cm " +
                           "JOIN pilihan_jurusan pj ON cm.id = pj.calon_mahasiswa_id";
            ResultSet rs = db.getData(query);
        %>

        <% if (!message.isEmpty()) { %>
            <div class="alert alert-success" role="alert"><%= message %></div>
        <% } %>

        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Nama</th>
                    <th>NISN</th>
                    <th>Nilai</th>
                    <th>Pilihan Jurusan</th>
                    <th>Status</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                    <form method="post">
                        <tr>
                            <td><%= rs.getString("nama") %></td>
                            <td><%= rs.getString("NISN") %></td>
                            <td>
                                <input type="number" step="0.01" name="nilai" class="form-control" value="<%= rs.getDouble("nilai") %>" required>
                            </td>
                            <td>
                                1: <%= rs.getString("piljurusan1") %><br>
                                2: <%= rs.getString("piljurusan2") %><br>
                                3: <%= rs.getString("piljurusan3") %><br>
                                4: <%= rs.getString("piljurusan4") %>
                            </td>
                            <td>
                                <div class="form-check">
                                    <input type="checkbox" name="status" class="form-check-input" <%= rs.getBoolean("status") ? "checked" : "" %>>
                                    <label class="form-check-label">Lolos</label>
                                </div>
                            </td>
                            <td>
                                <input type="hidden" name="calon_mahasiswa_id" value="<%= rs.getInt("id") %>">
                                <button type="submit" class="btn btn-dark">Simpan</button>
                            </td>
                        </tr>
                    </form>
                <% } %>
            </tbody>
        </table>

        <% db.disconnect(); %>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>