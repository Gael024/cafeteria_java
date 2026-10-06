<%-- 
    Document   : registro
    Created on : 20 nov 2025, 6:03:15 p.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/registro.css">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <!--HEADER-->    
    <header class='cabeza'>
        <img  class='logo' src="Image/LogoSF.png" alt="Logo de la cafetería">
    </header>    
        
        
        <!--MAIN-->   
        
<div class="login_container">

    <h1 class="login_title">Registro de Usuario</h1>

    <form action="registro.jsp" method="post">

        <input 
            type="text" 
            name="nombre"
            class="login_input" 
            placeholder="Nombre Completo"
        >

        <input 
            type="text" 
            name="matricula"
            class="login_input"
            placeholder="Matricula/Numero de trabajador"
        >
        
        <input 
            type="text" 
            name="contrasena"
            class="login_input"
            placeholder="Contraseña"
        >
        
        <input 
            type="text" 
            name="confirmar"
            class="login_input"
            placeholder="Confirmar Contraseña"
        >
        
         <p id="error_pass" style="color:red; font-weight:bold; margin-top:5px; display:none;">
            Las contraseñas no coinciden.
        </p>
        
        <!-- BOTONES -->
        <div class="buttons_row">
            
            
            <a href="index.html">
                <button type="reset" class="login_button btn_cancelar">
                    Cancelar
                </button>
            </a> 
            
            


            <button type="submit" class="login_button btn_registrar">
                Registrarse
            </button>

        </div>

    </form>

</div>

     
        
        
<!--        REAL 
        
        <form action="registro.jsp" method="post">
            
            <label>Nombre</label>
            <input type="text" name="nombre" placeholder="maximo 50 caracteres">
            
            <label>Matricula</label>
            <input type="text" name="matricula" placeholder="maximo 50 caracteres">
            
            <label>Contraseña</label>
            <input type="text" name="contrasena" placeholder="maximo 50 caracteres">
            
            <input type="submit" value="Registrar datos">
            <input type="reset" value="Cancelar">
            
        </form>-->
        
        
        
 
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
        
        
 
        

        <!--CONTRASENAS CONINCIDEN--> 
        
        <script>
document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
    const pass1 = document.querySelector("input[name='contrasena']");
    const pass2 = document.querySelector("input[name='confirmar']");
    const errorMsg = document.getElementById("error_pass");

    form.addEventListener("submit", function (e) {
        if (pass1.value !== pass2.value) {
            e.preventDefault(); // Detiene el envío del formulario
            errorMsg.style.display = "block"; // Muestra error
        } else {
            errorMsg.style.display = "none"; // Oculta error
        }
    });
});
</script>
        
        
        
    </body>
</html>

<%

String nombre = request.getParameter("nombre"); 
String matricula = request.getParameter("matricula");
String contrasena = request.getParameter("contrasena");

 
Connection con = null;
PreparedStatement ps =  null;

try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/cafeteria", "root", "");

        String sql = "INSERT INTO registroestudiante (Matricula, Contrasena, Nombre) VALUES (?, ?, ?)";
        ps = con.prepareStatement(sql);
        ps.setString(1, matricula);
        ps.setString(2, contrasena);
        ps.setString(3, nombre);
        ps.executeUpdate();

        response.sendRedirect("index.html");
}catch(Exception e){
    //out.println("ERROR: " + e.getMessage());
}finally{
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
}
%>