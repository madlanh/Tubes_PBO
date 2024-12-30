<%-- 
    Document   : dashMaba
    Created on : Dec 24, 2024, 2:50:25 PM
    Author     : ARMAGEDON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Seleksi Mahasiswa Baru</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #3C4A45;
            color: #fff;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: #EAF4F4;
            border-radius: 10px;
            padding: 30px;
            margin-top: 80px;
        }
        .card {
            background-color: #A4C3B2;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            height: 250px;
            margin-bottom: 180px;
        }
        .card img {
            max-width: 100px;
            margin: 20px auto;
        }
        .card-title {
            font-size: 20px;
            font-weight: bold;
        }
        .navbar {
            background-color: #EAF4F4;
            margin-bottom: 220px;
            font-weight: bold;
        }
        .navbar-brand, .nav-link {
            color: #000;
        }
        .btn-icon {
            background: none;
            border: none;
            margin-left: 10px;
        }
        .btn-icon img {
            width: 20px;
            height: 20px;
        }
        .sidebar {
            position: fixed;
            top: 0;
            right: -300px;
            width: 300px;
            height: 100%;
            background-color: #D4E1D8;
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.5);
            overflow-y: auto;
            transition: 0.3s;
            z-index: 1000;
            padding: 20px;
        }
        .sidebar.active {
            right: 0;
        }
        .sidebar .close-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 20px;
            cursor: pointer;
            color: #000;
        }
        .sidebar .menu-header {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .sidebar .profile-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin: 0 auto 15px;
            display: block;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            margin: 15px 0;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #000;
            font-weight: bold;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .sidebar ul li a:hover {
            background-color: #A4C3B2;
        }
    </style>
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Seleksi Mahasiswa Baru | SMB</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="dashMaba.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item d-flex align-items-center">
                            <a class="nav-link" href="hubKami.jsp">Hubungi Kami</a>
                            <button class="btn-icon" onclick="toggleSidebar()">
                                <img src="images/right-align.png" alt="sidebar">
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="images/bio.png" class="card-img-top" alt="Biodata">
                    <div class="card-body">
                        <h5 class="card-title"><a href="bio.jsp" style="text-decoration:none; color:white;">Biodata</a></h5>
                        <p class="card-text">Segera lengkapi biodata Anda agar dapat melakukan registrasi!</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="images/regis.png" class="card-img-top" alt="Registrasi">
                    <div class="card-body">
                        <h5 class="card-title"><a href="regis1.jsp" style="text-decoration:none; color:white;">Registrasi</a></h5>
                        <p class="card-text">Pilih jurusan impianmu! Anda dapat memilih hingga 4 jurusan.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="images/lulus.png" class="card-img-top" alt="Hasil Kelulusan">
                    <div class="card-body">
                        <h5 class="card-title"><a href="hasilKelulusan.jsp" style="text-decoration:none; color:white;">Hasil Kelulusan</a></h5>
                        <p class="card-text">Lihat hasil seleksi Anda. Semoga beruntung!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Sidebar -->
    <div id="sideMenu" class="sidebar">
        <span class="close-btn" onclick="toggleSidebar()">&times;</span>
        <img src="images/profile.png" alt="Profile Picture" class="profile-img">
        <div class="menu-header">
            <%= session.getAttribute("nama") != null ? session.getAttribute("nama") : "Nama Calon Mahasiswa"%>
            <br>
            <small>
                <%= session.getAttribute("username") != null ? session.getAttribute("username") : "Username"%>
            </small>
        </div>
        <ul>
            <li><a href="bio.jsp">Biodata</a></li>
            <li><a href="logout.jsp">Keluar</a></li>
        </ul>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function toggleSidebar() {
            const sideMenu = document.getElementById('sideMenu');
            sideMenu.classList.toggle('active');
        }
    </script>
</body>
</html>