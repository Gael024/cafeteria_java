<%-- 
    Document   : seguimiento_dos
    Created on : 25 nov 2025, 11:02:44 p.m.
    Author     : 824ga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/seguimientodos.css">
        
        <!--GOOGLE FONT-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Momo+Trust+Display&family=Special+Elite&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Science+Gothic:wght@100..900&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&display=swap" rel="stylesheet">
    </head>
    <body>
        
                             <!--HEADER-->  
        
    <header class='cabeza'>
        
        <div class='left'>
            <img  class='logo' src="Image/LogoSF.png" alt="Logo de la cafetería">
        </div>
        
        <div class='right'>
            <nav class='navegacion'>
                <a class='navegacion__enlace' href="homepage.jsp">Home</a>
                <a class='navegacion__enlace' href="carro_compra.jsp">Carrito</a>
                <a class='navegacion__enlace' href="seguimiento.jsp">Seguimiento</a>
                <a class='navegacion__enlace' href="index.html">Cerrar Sesión</a>
            </nav>
        </div>
        
    </header>   
        
        <!--MAIN-->
        
       <div class='titulo'>
            <h1>Seguimiento de tu Pedido</h1>
        </div>
        
        
        <!--REAL-->
        
        
 <!-- CONTENEDOR GENERAL -->
<div class="seguimiento-container">

    <!-- TARJETA -->
    <div class="seguimiento-card">

        <% 
        String fecha = request.getParameter("fecha");
        String nombreUsuario = (String) session.getAttribute("nombreusuario");
        List<Map<String,Object>> carrito = (List<Map<String,Object>>) session.getAttribute("carrito"); 
        int total = 0;
        %>

        <h3 class="seguimiento-titulo">Nombre del cliente: <%=nombreUsuario%></h3>

        <% 
        for(Map<String,Object> producto : carrito){
             String nombreProducto = (String) producto.get("nombre");
             int precio = (Integer) producto.get("precio");
             int cantidad = (Integer) producto.get("cantidad");
             int subtotal = precio * cantidad;
             total += subtotal;
        %>

            <p class="seguimiento-item"><%=nombreProducto%></p>

        <% } %>

        <p class="seguimiento-total">Total = <%=total%></p>

        <%
        Connection con = null;
        PreparedStatement ps =  null;
        ResultSet rs = null; 
            
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/cafeteria", "root", "");
            
            String estado_pedido = "Hola";
            String sql = "SELECT * FROM pedidos WHERE Fecha = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1,fecha);
            rs = ps.executeQuery();
            
            if(rs.next()){
                estado_pedido = rs.getString("EstadoPedido");
            }
        %>

        <p class="seguimiento-estado">Estado del pedido: <%=estado_pedido%></p>

        <% 
        }catch(Exception e){
            out.println("Error" + e.getMessage());
        }finally{
            if(rs != null){ rs.close(); }
            if(ps != null){ ps.close(); }
            if(con != null){ con.close(); }
        }
        %>

        <p class="seguimiento-fecha"><%= "Fecha recibida: " + fecha %></p>

        <!-- BOTÓN CENTRADO -->
        <form action="seguimiento_dos.jsp" method="post" class="seguimiento-form">
            <input type="hidden" value="<%=fecha%>" name="fecha">
            <input type="submit" value="Actualizar estado" class="btn-actualizar">
        </form>

    </div>
</div>
            
            
                <!--FOOTER-->
        
    <footer class="footer">
        


        <div class="footer_left">
            <p class="text-up">© 2025 Cafeterìa Universitaria BUAP -Todos los derechos reservados</p>
            <p class="text-down">Desarrollado por estudiantes de la Facultad Ciencias de la Computación</p>
        </div>
        

        <div class="footer_right">
            
            <div class="social_icons">
                <p class="fab fa-facebook-f">
                    <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-brand-facebook"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M7 10v4h3v7h4v-7h3l1 -4h-4v-2a1 1 0 0 1 1 -1h3v-4h-3a5 5 0 0 0 -5 5v2h-3" /></svg>
                </p>

                <p  class="fab fa-instagram">
                    <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-brand-instagram"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 8a4 4 0 0 1 4 -4h8a4 4 0 0 1 4 4v8a4 4 0 0 1 -4 4h-8a4 4 0 0 1 -4 -4z" /><path d="M9 12a3 3 0 1 0 6 0a3 3 0 0 0 -6 0" /><path d="M16.5 7.5v.01" /></svg>
                </p>
            </div>

        </div>


    </footer>    
            
    </body>
</html>
