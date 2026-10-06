<%-- 
    Document   : registrar_producto
    Created on : 25 nov 2025, 7:00:29 p.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/RegistrarProducto.css">
        
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
            <h1>Registrar Producto</h1>
        </div>
        
        
                <!--MAIN-->   
        
<div class="login_container">

    <form  id="formRegistro" action="ejecutar_registro_producto.jsp" method="post">

        <!--NOMBRE-->
        <input 
            type="text" 
            name="nombre"
            class="login_input" 
            placeholder="Nombre"
        >
        
        <!--CATEGORIA-->
        <select name="tabla" class="login_input">
                <option value="comidas">Comida</option> 
                <option value="bebidas">Bebida</option>
                <option value="postres">Postre</option>
                <option value="snacks">Snack</option>

        </select> 

        <!--PRECIO-->
        <input 
            type="number" 
            name="precio"
            class="login_input"
            placeholder="Precio"
            min="0"
        >
        
        <!--STOCK-->
        <input 
            type="number" 
            name="stock"
            class="login_input"
            placeholder="unidades disponibles"
             min="0"
        >
        
        <!--ESTADO-->
        <select name="estado" class="login_input">
            <option value="1">Disponible</option>
            <option value="0">Desactivado</option>
        </select>
        
        <!--DESCRICION-->
        <textarea 
            name="descripcion"
            cols="40" 
            rows="4"
            class="login_input"
            placeholder="Descripcion del producto"
        ></textarea>
        
      
        
        <!-- BOTONES -->
        <div class="buttons_row">

            <a href="gestion_productos.jsp">
                <button type="reset" class="login_button btn_cancelar">
                    Cancelar
                </button> 
            </a>

            <button class="login_button btn_registrar" type="submit" value="REGISTRAR">
                Registrarse
            </button>

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
        
       
        
<!-- MODAL DE CONFIRMACIÓN -->
<div id="modalConfirmacion" class="modal">
    <div class="modal_contenido">
        <h2>Producto registrado</h2>
        <p>Se ha registrado tu producto correctamente.</p>

        <div class="modal_botones">
            <button id="btnAceptar" class="btn_modal">Aceptar</button>
        </div>
    </div>
</div>

<script>
    const form = document.getElementById("formRegistro");
    const modal = document.getElementById("modalConfirmacion");
    const btnAceptar = document.getElementById("btnAceptar");
    const btnCancelar = document.getElementById("btnCancelar");

    // Cuando se intenta enviar el formulario → mostrar modal
    form.addEventListener("submit", function(event) {
        event.preventDefault();   // Bloquea el envío
        modal.style.display = "flex";  // Mostrar modal
    });

    // Botón ACEPTAR
    btnAceptar.addEventListener("click", function() {
        modal.style.display = "none";
        form.submit();  // Ahora sí envía el formulario
    });

    // Botón CANCELAR
    btnCancelar.addEventListener("click", function() {
        modal.style.display = "none";  // Solo cerrar
    });

    // Cerrar si dan click fuera del modal
    window.addEventListener("click", function(event){
        if(event.target === modal){
            modal.style.display = "none";
        }
    });
</script>


    </body>
</html>
