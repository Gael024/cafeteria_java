<%-- 
    Document   : actualizar_pedido
    Created on : 29 nov 2025, 1:33:43 p.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actializar pedido</title>
        <link rel="stylesheet" type="text/css" href="css/actuallzarpedido.css">
        
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
            <h1>Actualizar Pedido</h1>
        </div>
        
        <!--REAL-->
        
        
        
        
        <%
        
         int id_pedido = Integer.parseInt(request.getParameter("id"));
         String nombre_cliente = request.getParameter("cliente");
         int total = Integer.parseInt(request.getParameter("total"));
         String estado_pago = request.getParameter("estado_pago");
         String estado_pedido = request.getParameter("estado_pedido");
         String fecha = request.getParameter("fecha");

        %>
        
<div class="login_container">
    
        <form id="formRegistro" action="ejecutar_actualizar_pedido.jsp" method="post">
            
            <!--ID-->
            <input type="number" name="id" class="login_input" value="<%=id_pedido%>" readonly> 
            
            <!--NOMBRE-->
            <input type="text" name="cliente" class="login_input" value="<%=nombre_cliente%>" readonly> 
            
            <!--TOTAL-->
            <input type="number" name="total" class="login_input" value="<%=total%>" readonly> 
            
            <!--ESTADO PAGO-->
            <select name="estado_pago" class="login_input">
                <option value="Pendiente">Pendiente</option>
                <option value="Pagado">Pagado</option>
            </select> 
            
            <!--ESTADO PEDIDO-->
            <select name="estado_pedido" class="login_input">
                <option value="Pendiente">Pendiente</option>
                <option value="En preparacion">En preparacion</option>
                <option value="Listo">Listo</option>
            </select> 
            
            <!--FECHA-->
            <input type="text" name="fecha" class="login_input" value="<%=fecha%>" readonly>
            
            
            <div class="buttons_row">
                <a href="gestion_pedidos.jsp"><input type="button" value="cancelar" class="login_button btn_cancelar"></a> 
                <input type="submit" value="Actualizar" class="login_button btn_registrar">
            </div>

            
        </form>
            
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
        
        
        
        <!--MODAL-->
        
        <!-- MODAL ACTUALIZACIÓN EXITOSA -->
<div id="modalActualizado" class="modal">
    <div class="modal_contenido">
        <h2>Pedido actualizado</h2>
        <p>Se ha actualizado el pedido correctamente.</p>

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
    formActualizacion.submit();  //  AQUÍ SE ACTUALIZA
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
