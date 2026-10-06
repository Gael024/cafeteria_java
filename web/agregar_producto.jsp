<%-- 
    Document   : agregar_producto
    Created on : 21 nov 2025, 12:30:50 p.m.
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
        request.setCharacterEncoding("UTF-8");
    }

String nombre = request.getParameter("nombre");
int precio = Integer.parseInt(request.getParameter("precio"));
int cantidad = Integer.parseInt(request.getParameter("cantidad"));
String tabla = request.getParameter("tabla");

  List<Map<String,Object>> carrito = (List<Map<String,Object>>) session.getAttribute("carrito");
  
if(carrito == null){
    carrito = new ArrayList<>();
}

Map<String,Object> producto = new HashMap<>();
producto.put("nombre", nombre);
producto.put("precio", precio);
producto.put("cantidad", cantidad);
producto.put("tabla", tabla);

carrito.add(producto);

session.setAttribute("carrito", carrito);

out.print("OK");
%>
                