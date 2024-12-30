/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

public class AdminManagement {
    private List<CalonMahasiswa> daftarCamaba;

    public AdminManagement() {
        this.daftarCamaba = new ArrayList<>();
    }

    public void addCamaba(CalonMahasiswa camaba) {
        daftarCamaba.add(camaba);
    }

    public void removeCamaba(CalonMahasiswa camaba) {
        daftarCamaba.remove(camaba);
    }
}