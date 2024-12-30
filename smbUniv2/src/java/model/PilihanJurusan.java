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

public class PilihanJurusan {
    private int id;
    private int calonMahasiswaId;
    private String jurusan;

    // Constructor
    public PilihanJurusan(int id, int calonMahasiswaId, String jurusan) {
        this.id = id;
        this.calonMahasiswaId = calonMahasiswaId;
        this.jurusan = jurusan;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCalonMahasiswaId() {
        return calonMahasiswaId;
    }

    public void setCalonMahasiswaId(int calonMahasiswaId) {
        this.calonMahasiswaId = calonMahasiswaId;
    }

    public String getJurusan() {
        return jurusan;
    }

    public void setJurusan(String jurusan) {
        this.jurusan = jurusan;
    }

    // Method untuk menyimpan pilihan jurusan ke database
    public boolean saveToDatabase(Connection conn) throws SQLException {
        String query = "INSERT INTO pilihan_jurusan (calon_mahasiswa_id, jurusan) VALUES (?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, this.calonMahasiswaId);
            ps.setString(2, this.jurusan);
            return ps.executeUpdate() > 0;
        }
    }

    // Method untuk mengambil pilihan jurusan berdasarkan calon mahasiswa ID
    public static List<PilihanJurusan> findByCalonMahasiswaId(Connection conn, int calonMahasiswaId) throws SQLException {
        List<PilihanJurusan> list = new ArrayList<>();
        String query = "SELECT * FROM pilihan_jurusan WHERE calon_mahasiswa_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, calonMahasiswaId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new PilihanJurusan(
                        rs.getInt("id"),
                        rs.getInt("calon_mahasiswa_id"),
                        rs.getString("jurusan")
                    ));
                }
            }
        }
        return list;
    }
}