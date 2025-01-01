<%-- 
    Document   : login
    Created on : Dec 24, 2024, 2:49:01 PM
    Author     : ARMAGEDON
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Masuk Akun | Seleksi Mahasiswa Baru</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
        body {
            background-color: #3C4A45;
        }
        .card {
            border-radius: 25px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .left-panel {
            background-color: #D4E1D8;
            padding: 40px;
            border-top-left-radius: 25px;
            border-bottom-left-radius: 25px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .right-panel {
            padding: 40px;
        }
        .welcome-text {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .form-control {
            border-radius: 10px;
        }
        .btn-register {
            border-radius: 10px;
            background-color: #5A7666;
            color: white;
        }
        .btn-register:hover {
            background-color: #4C6658;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card w-75">
            <div class="row g-0">
                <div class="col-md-6 left-panel">
                    <img src="images/login.png"
                         alt="UniStudent" class="img-fluid">
                </div>
                <div class="col-md-6 right-panel">
                    <h2 class="welcome-text">Selamat datang!</h2>
                    <p>Masukkan data diri anda</p>
                    <form method="post" action="login">
                        <div class="mb-3">
                            <input type="text" class="form-control" placeholder="Username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" placeholder="Password" name="password" required>
                        </div>
                        <label>Jenis Pengguna:</label>
                        <select name="role" class="form-control mb-3" required>
                            <option value="admin">Admin</option>
                            <option value="mahasiswa">Calon Mahasiswa</option>
                        </select>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-register">Masuk</button>
                        </div>
                        <div class="mt-3 text-center">
                            <span>Belum punya akun? <a href="signup.jsp" class="text-primary">Daftar</a></span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>