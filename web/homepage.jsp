<%-- 
    Document   : homepage
    Created on : 20 nov 2025, 5:41:18 p.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="credenciales.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario</title>
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
        
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
                <a class='navegacion__enlace' href="homepage.jsp">Home</a>
                <a class='navegacion__enlace' href="carro_compra.jsp">Carrito</a>
                <a class='navegacion__enlace' href="seguimiento.jsp">Seguimiento</a>
                <a class='navegacion__enlace' href="index.html">Cerrar Sesión</a>
            </nav>
        </div>
        
    </header>   
        
        <!--MAIN-->
        
        <div class='titulo'>
            <h1>Elige una Categoria</h1>
        </div>

        
        <div class="menu">
            
            <a class='imagen1' href='bebidas.jsp'>
                <img src='Image/bebida.jpg' alt='bebida'>
            </a>
            
            <a class='imagen2' href='comidas.jsp'>
                <img src='Image/comida.jpeg' alt='comida'>
            </a>
            
            <a class='imagen3' href='snacks.jsp'>
                <img src='Image/snack.jpg' alt='postre'>
            </a>
            
            <a class='imagen4' href='postres.jsp'>
                <img src='Image/postre.jpg' alt='snack'>
            </a>
            
        </div>
        
        
        <!--REAL-->
<!--        
                    <div class="bebidas">
                <a href="bebidas.jsp"><button>BEBIDAS</button></a>
            </div>
            
            <div class="comidas">
                <a href="comidas.jsp"><button>COMIDAS</button></a>
            </div>
            
            <div class="snacks">
                <a href="snacks.jsp"><button>SNACKS</button></a>
            </div>
            
            <div class="postres">
                <a href="postres.jsp"><button>POSTRES</button></a>
                
            </div>-->
        
        
        
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
