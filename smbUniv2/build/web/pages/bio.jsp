<%-- 
    Document   : bio
    Created on : Dec 24, 2024, 8:08:55?PM
    Author     : ARMAGEDON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SMB - Seleksi Mahasiswa Baru</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #54655E;
                color: #fff;
                font-family: Arial, sans-serif;
            }
            .container {
                background-color: #EAF4F4;
                border-radius: 10px;
                padding: 30px;
                margin-top: 80px;
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
                background-color: #CCE3DE;
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
            form{
                margin-top:-150px;
                margin-bottom: 180px;
            }
            /* Perbaikan Form */
            form .profile-img {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                background-color: #ccc; /* Placeholder warna */
                display: block;
                margin: 0 auto 80px !important; 
            }


            form .form-control {
                background-color: #F8F9FA; /* Warna input seperti gambar */
                border: 1px solid #D1D1D1; /* Border tipis */
                box-shadow: none;
                border-radius: 80px; /* Membulat */
                padding: 20px 15px; /* Padding input */
                font-size: 14px;
                color: #333;
                margin-bottom: 30px;
                
            }

            form .form-control::placeholder {
                color: #A5A5A5; /* Warna placeholder */
            }

            form .btn-success {
                background-color: #6B9080; /* Warna tombol hijau sesuai gambar */
                color: #fff;
                border: none;
                border-radius: 15px;
                font-weight: bold;
                transition: background-color 0.3s ease;
                margin-top: 20px;
            }

            form .btn-success:hover {
                background-color: #4E5E55; /* Warna hover lebih gelap */
            }

            form .row {
                margin-bottom: 15px; /* Jarak antar baris input */
            }


        </style>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <a class="navbar-brand" href="dashMaba.jsp">Seleksi Mahasiswa Baru | SMB</a>
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
            <!-- Form -->
            <form action="../BioUpdateServlet" method="post" class="text-center">
                <img src="images/profile.png" alt="Profile Picture" class="profile-img mb-4">
                <div class="row justify-content-center mb-3">
                    <div class="col-md-5">
                        <input type="text" class="form-control rounded-3 py-2" id="nama" name="nama" placeholder="Nama Lengkap" required>
                    </div>
                    <div class="col-md-5">
                        <input type="text" class="form-control rounded-3 py-2" id="nisn" name="nisn" placeholder="NISN" required>
                    </div>
                </div>
                <div class="row justify-content-center mb-3">
                    <div class="col-md-5">
                        <input type="password" class="form-control rounded-3 py-2" id="password" name="password" placeholder="Password Baru" required>
                    </div>
                </div>
                <div class="d-grid justify-content-center mt-4">
                    <button type="submit" class="btn btn-success px-4 py-2 rounded-3">Simpan Perubahan</button>
                </div>
            </form>
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