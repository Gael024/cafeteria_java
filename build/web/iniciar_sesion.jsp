<%-- 
    Document   : iniciar_sesion
    Created on : 20 nov 2025, 4:50:36 p.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>

<%
 String matricula = request.getParameter("matricula");
 String contrasena = request.getParameter("contrasena");
 
Connection con = null;
PreparedStatement ps =  null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/cafeteria", "root", "");
    
    String sqlestudiante = "SELECT * FROM registroestudiante WHERE Matricula = ? AND Contrasena = ?";
    ps = con.prepareStatement(sqlestudiante);
    ps.setString(1, matricula);
    ps.setString(2, contrasena);
    
    rs = ps.executeQuery();
    
    if(rs.next()){
        
        String nombre = rs.getString("nombre");
        session.setAttribute("nombreusuario", nombre);
        response.sendRedirect("homepage.jsp");
    }else {
        rs.close();
        ps.close();
        
        String sqlpersonal = "SELECT * FROM registropersonal WHERE Matricula = ? AND Contrasena = ?";
        ps = con.prepareStatement(sqlpersonal);
        ps.setString(1, matricula);
        ps.setString(2, contrasena);
        rs = ps.executeQuery();
        
        if(rs.next()){
            
            response.sendRedirect("homepage_personal.jsp");
        }else{
               out.println("<h3>Datos incorrectos</h3>");
        }
     
    }
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