/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.CalonMahasiswa;
import model.PilihanJurusan;
import java.sql.*;
import java.util.List;

public class PendaftaranController {

    private Connection conn;

    public PendaftaranController(Connection conn) {
        this.conn = conn;
    }

    // Method untuk mendaftarkan calon mahasiswa
    public boolean registerCalonMahasiswa(String nama, String nisn, double nilai, String status) throws SQLException {
        CalonMahasiswa cm = new CalonMahasiswa(0, nama, nisn, nilai, status);
        return cm.saveToDatabase(conn);
    }

    // Method untuk memilih jurusan
    public boolean pilihJurusan(int calonMahasiswaId, List<String> jurusanList) throws SQLException {
        for (String jurusan : jurusanList) {
            PilihanJurusan pj = new PilihanJurusan(0, calonMahasiswaId, jurusan);
            if (!pj.saveToDatabase(conn)) {
                return false;
            }
        }
        return true;
    }

    // Method untuk mendapatkan daftar calon mahasiswa
    public List<CalonMahasiswa> getAllCalonMahasiswa() throws SQLException {
        return CalonMahasiswa.getAll(conn);
    }

    // Method untuk mendapatkan pilihan jurusan calon mahasiswa
    public List<PilihanJurusan> getPilihanJurusanByCalonMahasiswaId(int calonMahasiswaId) throws SQLException {
        return PilihanJurusan.findByCalonMahasiswaId(conn, calonMahasiswaId);
    }
}