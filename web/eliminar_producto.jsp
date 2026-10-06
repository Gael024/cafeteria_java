<%-- 
    Document   : eliminar_producto
    Created on : 29 nov 2025, 8:58:22 p.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        String nombre_producto = request.getParameter("nombre");
        
        List<Map<String,Object>> carrito = (List<Map<String,Object>>) session.getAttribute("carrito");
        
        if (carrito != null && nombre_producto != null) {
        Iterator<Map<String,Object>> it = carrito.iterator();

        while (it.hasNext()) {
            Map<String,Object> p = it.next();
            if (nombre_producto.equals((String)p.get("nombre"))) {
                it.remove(); 
                break;
            }
        }

        session.setAttribute("carrito", carrito);
    }
        
        response.sendRedirect("carro_compra.jsp");
        %>
    </body>
</html>
