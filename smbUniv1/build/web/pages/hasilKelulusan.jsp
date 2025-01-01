<%-- 
    Document   : hasilKelulusan
    Created on : Dec 27, 2024, 6:03:59 AM
    Author     : ARMAGEDON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>
<%
    // Ambil status kelulusan dari database
    model.jdbc db = new model.jdbc();
    db.connect();
    boolean isLulus = false;

    try {
        String username = (String) session.getAttribute("username");
        String query = "SELECT status FROM calon_mahasiswa WHERE username = ?";

        try (PreparedStatement ps = db.getConnection().prepareStatement(query)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    isLulus = rs.getBoolean("status");
                }
            }
        }
    } catch (SQLException e) {
        session.setAttribute("error", "Error: " + e.getMessage());
        response.sendRedirect("error.jsp");
        return;
    } finally {
        db.disconnect();
    }

    // Redirect sesuai status kelulusan
    if (isLulus) {
        response.sendRedirect("lulus.jsp");
    } else {
        response.sendRedirect("gagal.jsp");
    }
%>