<%-- 
    Document   : carro_compra
    Created on : 21 nov 2025, 11:58:34 a.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="credenciales.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CARRO</title>
        <link rel="stylesheet" type="text/css" href="css/carro_compra.css">
        
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
            <h1>Tu Carro de Compras</h1>
        </div>
        
        <!--REAL-->
<%
List<Map<String,Object>> carrito = (List<Map<String,Object>>) session.getAttribute("carrito");
int total = 0;
%>

<!--<h1>TU CARRO DE COMPRA</h1>-->

<div class="carrito-container">

    <!-- LISTA DE PRODUCTOS -->
    <div class="productos-lista">

        <%
        if(carrito == null || carrito.isEmpty()){
        %>
            <p>Sin productos para mostrar</p>
        <%
        } else {

            for(Map<String,Object> p : carrito){
                
                String nombre = (String) p.get("nombre");
                int precio = (Integer) p.get("precio");
                int cantidad = (Integer) p.get("cantidad");
                int subtotal = precio * cantidad;
                
                total += subtotal;
        %>

        <div class="producto-card">

            <img src="Image/carrito1.png" class="producto-img" alt="Producto">

            <div class="producto-info">
                <p><strong><%=nombre%></strong></p>
                <p>Precio unitario: $<%=precio%></p>
                <p>Cantidad: <%=cantidad%></p>
                <p>Subtotal: $<%=subtotal%></p>
            </div>

            <form action="eliminar_producto.jsp" method="post">
                <input type="hidden" name="nombre" value="<%=nombre%>">
                <input class="btn-eliminar" type="submit" value="Eliminar">
            </form>

        </div>

        <%
            } // fin for
        } // fin else
        %>
        
        
        
    </div>

    <!-- PANEL DERECHA -->
    <div class="panel-total">
        <h2 class="panel-total_texto">Total a Pagar</h2>
        <p class="panel-total_texto">$<%=total%> MXN</p>

        <form action="finalizar_compra.jsp">
            <button class="btn-finalizar">Finalizar compra</button>
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
        
        <!--MODALES-->
        
<!--FINALIZAR COMPRA-->

<div id="modalEliminar" class="modal">
    <div class="modal-content">

        <!-- Botón X -->
        <span class="close-modal" id="closeEliminar">&times;</span>

        <h2>Producto Eliminado</h2>
        <p>Tu producto se ha eliminado correctamente.</p>
        <button id="btnAceptarEliminar" class="btn-modal">Aceptar</button>
    </div>
</div>


<!--FINALIZAR COMPRA-->

<div id="modalFinalizar" class="modal">
    <div class="modal-content">

        <!-- Botón X -->
        <span class="close-modal" id="closeFinalizar">&times;</span>

        <h2>Gracias por su compra</h2>
        <p>Tu pedido ha sido registrado exitosamente.</p>
        <button id="btnAceptarFinalizar" class="btn-modal">Aceptar</button>
    </div>
</div>




<script>

    //      MODAL ELIMINAR
 
    const modalEliminar = document.getElementById("modalEliminar");
    const closeEliminar = document.getElementById("closeEliminar");
    let formEliminarActual = null; // Guardará el form que desencadena el modal

    // Abrir modal al querer eliminar
    document.querySelectorAll("form[action='eliminar_producto.jsp']").forEach(form => {
        form.addEventListener("submit", function(e) {
            e.preventDefault();
            formEliminarActual = form;
            modalEliminar.style.display = "block";
        });
    });

    // Botón "Aceptar" elimina definitivamente
    document.getElementById("btnAceptarEliminar").addEventListener("click", function(){
        modalEliminar.style.display = "none";
        formEliminarActual.submit();
    });

    // Cerrar con la X en eliminar
    closeEliminar.addEventListener("click", function () {
        modalEliminar.style.display = "none";
    });

    // Cerrar al hacer clic fuera del modal eliminar
    window.addEventListener("click", function(e) {
        if (e.target === modalEliminar) {
            modalEliminar.style.display = "none";
        }
    });


    //   MODAL FINALIZAR COMPRA

    const modalFinalizar = document.getElementById("modalFinalizar");
    const closeFinalizar = document.getElementById("closeFinalizar");
    const btnAceptarFinalizar = document.getElementById("btnAceptarFinalizar");
    const btnFinalizar = document.querySelector(".btn-finalizar");

    // Abrir modal de finalizar
    btnFinalizar.addEventListener("click", function(e){
        e.preventDefault();
        modalFinalizar.style.display = "block";
    });

    // Botón aceptar redirige a finalizar_compra.jsp
    btnAceptarFinalizar.addEventListener("click", function(){
        window.location.href = "finalizar_compra.jsp";
    });

    // Cerrar con X en finalizar compra
    closeFinalizar.addEventListener("click", function () {
        modalFinalizar.style.display = "none";
    });

    // Cerrar al hacer clic fuera del modal finalizar
    window.addEventListener("click", function(e) {
        if (e.target === modalFinalizar) {
            modalFinalizar.style.display = "none";
        }
    });
</script>


    
        
        
    </body>
</html>
