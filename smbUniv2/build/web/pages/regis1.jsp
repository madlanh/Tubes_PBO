<%-- 
    Document   : regis1
    Created on : Dec 24, 2024, 7:48:46?PM
    Author     : ARMAGEDON
--%>

<!DOCTYPE html>
<% if (request.getAttribute("error") != null) { %>
    <p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Pendaftaran</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #54655E; /* Warna latar luar */
        }
        .container-custom {
            background-color: #EAF4F4; /* Warna latar dalam container */
            border-radius: 20px;
            padding: 30px;
        }
        .form-control {
            background-color: #fff;
            border-radius: 10px;
        }
        .btn-custom {
            background-color: #6B8F79; /* Warna hijau untuk tombol */
            color: #fff;
            font-weight: bold;
            border-radius: 10px;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #5A7E6C; /* Warna lebih gelap saat hover */
        }
        .nav-link {
            color: #333 !important;
            font-weight: bold;
        }
        .student-img {
            width: 100%;
            height: auto;
        }
        .student-section {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container mt-5 mb-5">
        <!-- Header -->
        <div class="row justify-content-center">
            <div class="col-md-10 container-custom shadow-lg">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-light">
                    <span class="navbar-brand font-weight-bold">SMB | Seleksi Mahasiswa </span>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="dashMaba.jsp">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="hubKami.jsp">Hubungi Kami</a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <hr>
                <!-- Content -->
                <div class="row">
                    <!-- Image Section -->
                    <div class="col-md-6 student-section">
                        <img src="images/jurusan.png" alt="Student Illustration" class="student-img mb-4">
                    </div>
                    <!-- Form Section -->
                    <div class="col-md-6">
                        <form action="regis1" method="post">
                            <div class="form-group">
                                <label for="pilihan1">Pilihan Jurusan 1*</label>
                                <select class="form-control" id="pilihan1" name="jurusan" required>
                                    <option value="" disabled selected>-- Pilih Jurusan --</option>
                                    <option value="Rekayasa Kedokteran">Rekayasa Kedokteran</option>
                                    <option value="Teknik Informatika">Teknik Informatika</option>
                                    <option value="Sistem Informasi">Sistem Informasi</option>
                                    <option value="Manajemen">Manajemen</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pilihan2">Pilihan Jurusan 2</label>
                                <select class="form-control" id="pilihan2" name="jurusan" >
                                    <option value="" disabled selected>-- Pilih Jurusan --</option>
                                    <option value="Rekayasa Kedokteran">Rekayasa Kedokteran</option>
                                    <option value="Teknik Informatika">Teknik Informatika</option>
                                    <option value="Sistem Informasi">Sistem Informasi</option>
                                    <option value="Manajemen">Manajemen</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pilihan3">Pilihan Jurusan 3</label>
                                <select class="form-control" id="pilihan3" name="jurusan">
                                    <option value="" disabled selected>-- Pilih Jurusan --</option>
                                    <option value="Rekayasa Kedokteran">Rekayasa Kedokteran</option>
                                    <option value="Teknik Informatika">Teknik Informatika</option>
                                    <option value="Sistem Informasi">Sistem Informasi</option>
                                    <option value="Manajemen">Manajemen</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pilihan4">Pilihan Jurusan 4</label>
                                <select class="form-control" id="pilihan4" name="jurusan">
                                    <option value="" disabled selected>-- Pilih Jurusan --</option>
                                    <option value="Rekayasa Kedokteran">Rekayasa Kedokteran</option>
                                    <option value="Teknik Informatika">Teknik Informatika</option>
                                    <option value="Sistem Informasi">Sistem Informasi</option>
                                    <option value="Manajemen">Manajemen</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-custom">Daftar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>