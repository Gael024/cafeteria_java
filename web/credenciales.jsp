<%-- 
    Document   : credenciales
    Created on : 23 nov 2025, 12:54:46 p.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String nombre_usuario = (String) session.getAttribute("nombreusuario");
if(nombre_usuario == null){
    response.sendRedirect("index.html");
    return; 
}
%>

