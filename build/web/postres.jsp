<%-- 
    Document   : postres
    Created on : 22 nov 2025, 9:56:05 p.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="credenciales.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Postres</title>
        <link rel="stylesheet" type="text/css" href="css/postre.css">
        
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
            <h1>Lista de Productos</h1>
        </div>
        
        <div class='carrito'>
            <a href="carro_compra.jsp">
                <img  class='carrito_imagen' src="Image/carrito.png" alt="carrito">
            </a>
        </div>
        
       
        
        
        
        <!--MAIN-->
<div class="productos">

<%
Connection con = null;
PreparedStatement ps =  null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/cafeteria", "root", "");

    String sql = "SELECT Nombre, Descripcion, Precio, Stock FROM postres WHERE estado = 1";
    ps = con.prepareStatement(sql);
    rs = ps.executeQuery();

    while (rs.next()){
        String nombre = rs.getString("Nombre");
        String descripcion = rs.getString("Descripcion");
        int precio = rs.getInt("Precio");
        int stock = rs.getInt("Stock");
%>

    <form action="agregar_producto.jsp" method="post" class="producto_card">

        <!-- IMAGEN -->
        <div class="producto_imagen">
            <img src="Image/postre.jpg" alt="producto">
        </div>

        <!-- INFORMACIÓN DEL PRODUCTO -->
        <div class="producto_info">
            <h4 class="producto_titulo"><%=nombre%></h4>
            <p class="producto_texto"><%=descripcion%></p>
            <p class="producto_texto">Precio unitario: <%=precio%></p>
            <p class="producto_texto">Cantidad de stock: <%=stock%></p>

            <label class="producto_label">Seleccione la cantidad:</label>
            <input class="producto_cantidad" type="number" 
                   name="cantidad" min="1" max="<%=stock%>">

            <!-- CAMPOS OCULTOS -->
            <input type="hidden" name="nombre" value="<%=nombre%>">
            <input type="hidden" name="precio" value="<%=precio%>">
            <input type="hidden" name="tabla" value="bebidas">

            <input class="producto_btn" type="submit" value="AÑADIR">
        </div>

    </form>

<%
    }
}catch(Exception e){
    out.println("Error" + e.getMessage());
}finally{
    if(rs != null){ rs.close(); }
    if(ps != null){ ps.close(); }
    if(con != null){ con.close(); }
}
%>

</div>

<a href="homepage.jsp" class="regresar_btn">REGRESAR</a>



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
        
        
        
    <!-- JS DEL MENÚ -->
    <script src="menu.js"></script>

    </body>
</html>