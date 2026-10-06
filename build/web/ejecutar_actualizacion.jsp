<%-- 
    Document   : ejecutar_actualizacion
    Created on : 25 nov 2025, 5:46:43 p.m.
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
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        int precio = Integer.parseInt(request.getParameter("precio"));
        int estado = Integer.parseInt(request.getParameter("estado"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String nombre_tabla = request.getParameter("tabla");
        int id = Integer.parseInt(request.getParameter("id"));
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/cafeteria", "root", "");
            
            String sql = "UPDATE " + nombre_tabla + " SET Nombre = ?, Descripcion = ?, Precio = ?, Estado = ?, "
                    + "Stock = ? WHERE Id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setInt(3, precio);
            ps.setInt(4, estado);
            ps.setInt(5, stock);
            ps.setInt(6, id);

            ps.executeUpdate();
            
            response.sendRedirect("gestion_productos.jsp");
        }catch(Exception e){
            out.println("Error:" + e.getMessage());
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
        
        <h1>Hello World!</h1>
    </body>
</html>
