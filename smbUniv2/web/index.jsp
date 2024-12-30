<%-- 
    Document   : index
    Created on : Dec 24, 2024, 2:47:49 PM
    Author     : ARMAGEDON
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seleksi Mahasiswa Baru</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #3C4A45;
            color: #fff;
        }
        .landing-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        .card-custom {
            background-color: #F5FAF7;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            max-width: 500px;
        }
        .btn-custom {
            background-color: #4C6658;
            color: #fff;
            border: none;
        }
        .btn-custom:hover {
            background-color: #2C3B34;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="landing-container">
        <div class="card-custom">
            <h1 class="fw-bold mb-4" style="color: #4C6658;">Seleksi Mahasiswa Baru</h1>
            <p style="color: #000000;">Selamat datang di platform Seleksi Mahasiswa Baru. Silakan mendaftar untuk melanjutkan proses seleksi.</p>
            <a href="pages/signup.jsp" class="btn btn-custom btn-lg mt-3">Daftar Sekarang</a>
        </div>
    </div>
    </body>
</html>