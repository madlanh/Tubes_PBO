/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ARMAGEDON
 */
import java.util.List;

public class camaba extends User implements Loginable {
    private String nisn;
    private double nilai;
    private List<PilihanJurusan> pilihanJurusan;

    public camaba(int id, String nama, String nisn, double nilai) {
        super(id, nama);
        this.nisn = nisn;
        this.nilai = nilai;
        this.pilihanJurusan = pilihanJurusan;
    }

    // Getters and Setters
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

    public List<PilihanJurusan> getPilihanJurusan() {
        return pilihanJurusan;
    }

    public void setPilihanJurusan(List<PilihanJurusan> pilihanJurusan) {
        this.pilihanJurusan = pilihanJurusan;
    }

    @Override
    public void displayInfo() {
        System.out.println("Nama: " + nama + ", NISN: " + nisn + ", Nilai: " + nilai);
        if (pilihanJurusan != null) {
            for (PilihanJurusan jurusan : pilihanJurusan) {
                jurusan.displayInfo();
            }
        }
    }

    @Override
    public boolean login(String username, String password) {
        return username.equals("camaba") && password.equals("password");
    }
}