/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

public class AdminManagement {
    private List<camaba> daftarCamaba;

    public AdminManagement() {
        this.daftarCamaba = new ArrayList<>();
    }

    public void addCamaba(camaba camaba) {
        daftarCamaba.add(camaba);
    }

    public void removeCamaba(camaba camaba) {
        daftarCamaba.remove(camaba);
    }

    public void showAllCamaba() {
        for (camaba camaba : daftarCamaba) {
            camaba.displayInfo();
        }
    }
}