<%-- 
    Document   : logout
    Created on : Dec 24, 2024, 6:58:20?PM
    Author     : ARMAGEDON
--%>

<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>