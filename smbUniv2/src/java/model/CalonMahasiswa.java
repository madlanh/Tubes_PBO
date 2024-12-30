/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ARMAGEDON
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CalonMahasiswa {
    private int id;
    private String nama;
    private String nisn;
    private double nilai;
    private String status;

    // Constructor
    public CalonMahasiswa(int id, String nama, String nisn, double nilai, String status) {
        this.id = id;
        this.nama = nama;
        this.nisn = nisn;
        this.nilai = nilai;
        this.status = status;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getNisn() {
        return nisn;
    }

    public void setNisn(String nisn) {
        this.nisn = nisn;
    }

    public double getNilai() {
        return nilai;
    }

    public void setNilai(double nilai) {
        this.nilai = nilai;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Method untuk menyimpan data calon mahasiswa ke database
    public boolean saveToDatabase(Connection conn) throws SQLException {
        String query = "INSERT INTO calon_mahasiswa (nama, nisn, nilai, status) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, this.nama);
            ps.setString(2, this.nisn);
            ps.setDouble(3, this.nilai);
            ps.setString(4, this.status);
            return ps.executeUpdate() > 0;
        }
    }

    // Method untuk mengambil data calon mahasiswa berdasarkan ID
    public static CalonMahasiswa findById(Connection conn, int id) throws SQLException {
        String query = "SELECT * FROM calon_mahasiswa WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new CalonMahasiswa(
                        rs.getInt("id"),
                        rs.getString("nama"),
                        rs.getString("nisn"),
                        rs.getDouble("nilai"),
                        rs.getString("status")
                    );
                }
            }
        }
        return null;
    }

    // Method untuk mengambil semua data calon mahasiswa
    public static List<CalonMahasiswa> getAll(Connection conn) throws SQLException {
        List<CalonMahasiswa> list = new ArrayList<>();
        String query = "SELECT * FROM calon_mahasiswa";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                list.add(new CalonMahasiswa(
                    rs.getInt("id"),
                    rs.getString("nama"),
                    rs.getString("nisn"),
                    rs.getDouble("nilai"),
                    rs.getString("status")
                ));
            }
        }
        return list;
    }
}