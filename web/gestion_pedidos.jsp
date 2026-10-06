<%-- 
    Document   : gestion_pedidos
    Created on : 25 nov 2025, 9:35:54 p.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos</title>
        <link rel="stylesheet" type="text/css" href="css/gestionpedidos.css">
        
        <!--GOOGLE FONT-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Momo+Trust+Display&family=Special+Elite&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200..900&display=swap" rel="stylesheet">
    </head>
    <body>
        
    <!--HEADER-->
    
    <header class='cabeza'>
        
        <div class='left'>
            <img  class='logo' src="Image/LogoSF.png" alt="Logo de la cafetería">
        </div>
        
        <div class='right'>
            <nav class='navegacion'>
                <a class='navegacion__enlace' href="homepage_personal.jsp">Home</a>
                <a class='navegacion__enlace' href="index.html">Cerrar Sesión</a>
            </nav>
        </div>
        
    </header>  
   
           <!--MAIN-->
        
        <div class='titulo'>
            <h1>Gestión de Pedidos</h1>
        </div>
           
           
           
           <div class="tabla-contenedor">
               <table class="tabla-productos">
                   
                               <thead>
                <tr>
                    <th>No. Orden</th>
                    <th>Cliente</th>
                    <th>Total</th>
                    <th>Estado del pago</th>
                    <th>Estado del pedido</th>
                    <th>Fecha</th>
                    <th>Actualizar</th>

                </tr>
                
            </thead>
            <tbody>
                
                
            
            
       
        <%
        
        Connection con = null;
        PreparedStatement ps =  null;
        ResultSet rs = null;
        
        try{
        
         Class.forName("com.mysql.cj.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/cafeteria", "root", "");
         String sql = "SELECT * FROM pedidos WHERE EstadoPedido IN ('pendiente', 'En preparacion') OR "
                 + "EstadoPago = 'pendiente'";
         ps = con.prepareStatement(sql);
         rs = ps.executeQuery();
         
         while(rs.next()){
             
             int id = rs.getInt("id"); 
             String cliente = rs.getString("Cliente");
             int total = rs.getInt("Total");
             String estado_pago = rs.getString("EstadoPago");
             String estado_pedido = rs.getString("EstadoPedido");
             Date fecha_pedido = rs.getDate("Fecha");
         
         
         
         %>
         
         <tr>
             <td><%=id%></td>
             <td><%=cliente%></td>
             <td><%=total%></td>
             <td><%=estado_pago%></td>
             <td><%=estado_pedido%></td>
             <td><%=fecha_pedido%></td>
             <td> 
             <form action="actualizar_pedido.jsp" method="post">  
            <input type="hidden" name="id" value="<%=id%>">
            <input type="hidden" name="cliente" value="<%=cliente%>">
            <input type="hidden" name="total" value="<%=total%>">
            <input type="hidden" name="estado_pago" value="<%=estado_pago%>">
            <input type="hidden" name="estado_pedido" value="<%=estado_pedido%>">
            <input type="hidden" name="fecha" value="<%=fecha_pedido%>">
            <input type="submit" value="Actualizar" class="btn-editar">
            </form>  
             </td>
         </tr>
         
         
        <% 
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
        
        
        </tbody>
                   
               </table>
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
