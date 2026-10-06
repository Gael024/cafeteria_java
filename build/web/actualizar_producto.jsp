<%-- 
    Document   : actualizar_producto
    Created on : 25 nov 2025, 4:25:09 p.m.
    Author     : 824ga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/actualizarproducto.css">
        
        <!--GOOGLE FONT-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Momo+Trust+Display&family=Special+Elite&display=swap" rel="stylesheet">
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
            <h1>Actualizar Producto</h1>
        </div>
        
        
        
        
        
        
        
        <!--REAL-->
        <%
        String nombre_tabla = request.getParameter("tabla");
        String nombre_producto = request.getParameter("nombre");
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/cafeteria", "root", "");
            
            String sql = "SELECT * FROM " + nombre_tabla + " WHERE Nombre = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre_producto);
            rs = ps.executeQuery();
            
            if(rs.next()){
                
            int id = rs.getInt("Id");
            String nombre = rs.getString("Nombre");
            int precio = rs.getInt("Precio");
            int cantidad = rs.getInt("Stock");
            String descripcion = rs.getString("Descripcion");
            int valor_estado = rs.getInt("Estado");
            String estado_producto;
            
            if(valor_estado == 1){
                estado_producto = "Disponible";
            }else{
                estado_producto = "Desactivado";            
            }
            
        %>
        
        
<div class="login_container">
    
         <form id="formRegistro" action="ejecutar_actualizacion.jsp" method="post">
             
             <!--NOMBRE-->
             <input type="text" name="nombre" class="login_input"  value="<%=nombre%>" placeholder="Nombre del producto"> 
             
             <!--PRECIO-->
             <input type="number" name="precio" class="login_input" value="<%=precio%>" placeholder="Precio de producto" min="0"> 
             
             <!--STOCK-->
             <input type="number" name="stock" class="login_input" value="<%=cantidad%>" placeholder="Cantidad de stock" min="0"> 
             
             <!--ESTADO-->
             <select name="estado" class="login_input">
                 <option value="1" <%= valor_estado == 1 ? "selected" : ""%> >Disponible</option>
                 <option value="0" <%= valor_estado == 0 ? "selected" : ""%> >Desactivado</option>
             </select>
             
             <!--DESCRIPCION-->
             <textarea name="descripcion" class="login_input" rows="4" cols="40" placeholder="Descripcion del producto"><%=descripcion%></textarea>
             
             <input type="hidden" name="tabla" value="<%=nombre_tabla%>">
             <input type="hidden" name="id" value="<%=id%>">
             
             <div class="buttons_row">
           
                 <button type="submit" class="login_button btn_registrar">Actualizar</button>
                 

                 <button type="button" class="login_button btn_cancelar" onclick="window.location.href='gestion_productos.jsp'">
                    Cancelar
                 </button>
             </div>
             
         </form>
               
            
</div>
        

                 
        
        
        <%
            }else{
              out.println("producto no encontrado");
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
        
        
        
        <!--MODAL-->
        
        <!-- MODAL ACTUALIZACIÓN EXITOSA -->
<div id="modalActualizado" class="modal">
    <div class="modal_contenido">
        <h2>Producto actualizado</h2>
        <p>Se ha actualizado el producto correctamente.</p>

        <div class="modal_botones">
            <button id="btnAceptarActualizar" class="btn_modal">Aceptar</button>
        </div>
    </div>
</div>
        
<script>
// FORMULARIO
const formActualizacion = document.getElementById("formRegistro");

// MODAL
const modalActualizado = document.getElementById("modalActualizado");
const btnAceptarActualizar = document.getElementById("btnAceptarActualizar");

// Mostrar modal al intentar enviar
formActualizacion.addEventListener("submit", function(event) {
    event.preventDefault(); 
    modalActualizado.style.display = "flex";
});

// Botón ACEPTAR → enviar formulario REAL
btnAceptarActualizar.addEventListener("click", function() {
    modalActualizado.style.display = "none";
    formActualizacion.submit();  // 🔥 AQUÍ SE ACTUALIZA
});

// Cerrar clic fuera del modal → enviar también
window.addEventListener("click", function(event){
    if(event.target === modalActualizado){
        modalActualizado.style.display = "none";
        formActualizacion.submit();  // También envía
    }
});
</script>


       
        
    </body>
</html>
