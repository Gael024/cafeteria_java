<%-- 
    Document   : finalizar_compra
    Created on : 23 nov 2025, 12:01:09 a.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>


<%
    

List<Map<String,Object>> carrito = (List<Map<String,Object>>) session.getAttribute("carrito");

if (carrito == null || carrito.isEmpty()) {
    out.println("No hay productos en el carrito.");
    return;
}

Connection con = null;
PreparedStatement psSelect = null;
PreparedStatement psUpdate = null;

try {
     Class.forName("com.mysql.cj.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost/cafeteria", "root", "");

    for (Map<String,Object> p : carrito) {

        String nombre = (String) p.get("nombre");
        int cantidad = (Integer) p.get("cantidad");
        String tabla = (String) p.get("tabla"); 

        
        String sqlSelect = "SELECT Stock FROM " + tabla + " WHERE Nombre = ?";
        String sqlUpdate = "UPDATE " + tabla + " SET Stock = ?, Estado = ? WHERE Nombre = ?";

        psSelect = con.prepareStatement(sqlSelect);
        psUpdate = con.prepareStatement(sqlUpdate);

        
        psSelect.setString(1, nombre);
        ResultSet rs = psSelect.executeQuery();

        if (rs.next()) {
            int stockActual = rs.getInt("Stock");

           
            int stockFinal = stockActual - cantidad;
            if (stockFinal <= 0) stockFinal = 0;

            int nuevoEstado = (stockFinal > 0) ? 1 : 0;

           
            psUpdate.setInt(1, stockFinal);
            psUpdate.setInt(2, nuevoEstado);
            psUpdate.setString(3, nombre);
            psUpdate.executeUpdate();
        }
        rs.close();
    }

    //session.removeAttribute("carrito");

    response.sendRedirect("seguimiento.jsp");

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (psSelect != null) psSelect.close();
    if (psUpdate != null) psUpdate.close();
    if (con != null) con.close();
}
%>