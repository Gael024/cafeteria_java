<%-- 
    Document   : ejecutar_actualizar_pedido
    Created on : 29 nov 2025, 1:59:31 p.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        int id = Integer.parseInt(request.getParameter("id"));
        String estado_pedido = request.getParameter("estado_pedido");
        String estado_pago = request.getParameter("estado_pago");
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/cafeteria", "root", "");
            String sql = "UPDATE pedidos SET EstadoPago = ?, EstadoPedido = ? WHERE Id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, estado_pago);
            ps.setString(2, estado_pedido);
            ps.setInt(3, id);
            ps.executeUpdate();
            
            response.sendRedirect("gestion_pedidos.jsp");
            
            
        }catch(Exception e){
            out.println("Error" + e.getMessage());
        }finally{
            
        if(rs != null){
            rs.close();
        }
        
        if(ps != null){
            ps.close();
        }
        
        if(con != null){
            con.close();
        }
        }
        %>
    </body>
</html>
