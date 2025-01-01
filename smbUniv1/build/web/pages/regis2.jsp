<%-- 
    Document   : regis2
    Created on : Dec 24, 2024, 7:48:53?PM
    Author     : ARMAGEDON
--%>

<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Registrasi</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #54655E; /* Warna abu tua untuk background luar */
            margin: 0;
            padding: 0;
        }
        .main-container {
            max-width: 1100px;
            background-color: #EAF4F4; /* Warna hijau muda untuk container dalam */
            margin: 50px auto;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            padding: 40px;
        }
        .navbar {
            font-size: 14px;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 16px;
        }
        .nav-link {
            font-weight: 500;
            color: #333 !important;
        }
        .thank-you-section h4 {
            font-weight: bold;
            color: #333;
            font-size: 24px;
        }
        .thank-you-section p {
            color: #666;
            font-size: 16px;
            margin-top: 10px;
            line-height: 1.5;
        }
        .btn-selesai {
            background-color: #758d7e; /* Warna hijau */
            color: white;
            font-size: 16px;
            border-radius: 8px;
            padding: 10px 30px;
            transition: background 0.3s ease;
            border: none;
        }
        .btn-selesai:hover {
            background-color: #5d7267;
        }
        .illustration img {
            width: 100%;
            max-width: 350px;
            display: block;
            margin: auto;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="#">Registrasi | Seleksi Mahasiswa Baru</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="dashMaba.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="hubKami.jsp">Hubungi Kami</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-container">
        <div class="row align-items-center">
            <!-- Illustration Section -->
            <div class="col-md-6 text-center illustration">
                <img src="images/jurusan.png" alt="Illustration">
            </div>
            <!-- Thank You Section -->
            <div class="col-md-6">
                <div class="thank-you-section text-center">
                    <h4>TERIMA KASIH</h4>
                    <p>Anda telah sukses melakukan pendaftaran.<br>Silakan untuk segera mengerjakan tes asesmen!</p>
                    <button class="btn btn-selesai mt-3">
                        <a href="dashMaba.jsp" style="text-decoration:none; color:white;">Kembali ke Dashboard</a>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>