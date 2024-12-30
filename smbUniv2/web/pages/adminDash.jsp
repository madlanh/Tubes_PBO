<%-- 
    Document   : adminDash
    Created on : Dec 24, 2024, 2:50:47 PM
    Author     : ARMAGEDON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.jdbc, java.sql.ResultSet" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    jdbc db = new jdbc();
    db.connect();
    String errorMessage = "";
    ResultSet rs = null;

    if (db.isConnected) {
        rs = db.getData("SELECT calon_mahasiswa.nama, calon_mahasiswa.nisn, calon_mahasiswa.nilai, "
                      + "pilihan_jurusan.piljurusan1, pilihan_jurusan.piljurusan2, "
                      + "pilihan_jurusan.piljurusan3, pilihan_jurusan.piljurusan4 "
                      + "FROM calon_mahasiswa "
                      + "LEFT JOIN pilihan_jurusan ON calon_mahasiswa.id = pilihan_jurusan.calon_mahasiswa_id");
    } else {
        errorMessage = db.message;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #3C4A45;
        }
        .container-custom {
            background-color: #D4E1D8; 
            border-radius: 20px;
            padding: 30px;
        }
        .btn-custom {
            background-color: #6B8F79;
            color: #fff;
            font-weight: bold;
            border-radius: 10px;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #5A7E6C;
        }
    </style>
</head>
<body>
    <div class="container mt-5 mb-5">
        <!-- Header -->
        <div class="row justify-content-center">
            <div class="col-md-10 container-custom shadow-lg">
                <h2 class="text-center">Dashboard Admin</h2>
                <p>Selamat datang, <strong><%= username %></strong>!</p>
                
                <!-- Error Message -->
                <% if (!errorMessage.isEmpty()) { %>
                    <p class="text-danger"><%= errorMessage %></p>
                <% } %>
                
                <!-- Table -->
                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>Nama</th>
                            <th>NISN</th>
                            <th>Nilai</th>
                            <th>Jurusan 1</th>
                            <th>Jurusan 2</th>
                            <th>Jurusan 3</th>
                            <th>Jurusan 4</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (rs != null) {
                            while (rs.next()) { %>
                                <tr>
                                    <td><%= rs.getString("nama") %></td>
                                    <td><%= rs.getString("nisn") %></td>
                                    <td><%= rs.getDouble("nilai") %></td>
                                    <td><%= rs.getString("piljurusan1") %></td>
                                    <td><%= rs.getString("piljurusan2") %></td>
                                    <td><%= rs.getString("piljurusan3") %></td>
                                    <td><%= rs.getString("piljurusan4") %></td>
                                    <td>
                                        <a href="nilai.jsp?nisn=<%= rs.getString("nisn")%>" class="btn btn-dark btn-sm">Edit</a>
                                    </td>
                                </tr>
                        <% } } %>
                    </tbody>
                </table>
                <a href="logout.jsp" class="btn btn-dark">Logout</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
<%
    if (db.isConnected) {
        db.disconnect();
    }
%>