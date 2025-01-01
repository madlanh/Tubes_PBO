/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ARMAGEDON
 */
public class PilihanJurusan {
    private int id;
    private int calonMahasiswaId;
    private String piljurusan1;
    private String piljurusan2;
    private String piljurusan3;
    private String piljurusan4;

    // Constructor
    public PilihanJurusan(int id, int calonMahasiswaId, String piljurusan1, String piljurusan2, String piljurusan3, String piljurusan4) {
        this.id = id;
        this.calonMahasiswaId = calonMahasiswaId;
        this.piljurusan1 = piljurusan1;
        this.piljurusan2 = piljurusan2;
        this.piljurusan3 = piljurusan3;
        this.piljurusan4 = piljurusan4;
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

    public String getPiljurusan1() {
        return piljurusan1;
    }

    public void setPiljurusan1(String piljurusan1) {
        this.piljurusan1 = piljurusan1;
    }

    public String getPiljurusan2() {
        return piljurusan2;
    }

    public void setPiljurusan2(String piljurusan2) {
        this.piljurusan2 = piljurusan2;
    }

    public String getPiljurusan3() {
        return piljurusan3;
    }

    public void setPiljurusan3(String piljurusan3) {
        this.piljurusan3 = piljurusan3;
    }

    public String getPiljurusan4() {
        return piljurusan4;
    }

    public void setPiljurusan4(String piljurusan4) {
        this.piljurusan4 = piljurusan4;
    }

    public void displayInfo() {
        System.out.println("Pilihan Jurusan 1: " + piljurusan1 + ", Pilihan Jurusan 2: " + piljurusan2 +
                           ", Pilihan Jurusan 3: " + piljurusan3 + ", Pilihan Jurusan 4: " + piljurusan4);
    }
}