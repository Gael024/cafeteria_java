
document.querySelectorAll(".producto").forEach(form => {

    form.addEventListener("submit", function(event) {
        event.preventDefault(); 

        const nombre = form.querySelector("input[name='nombre']").value;
        const precio = form.querySelector("input[name='precio']").value;
        const cantidad = form.querySelector("input[name='cantidad']").value;
        const tabla = form.querySelector("input[name='tabla']").value;
        
        const datos = new URLSearchParams();
        datos.append("nombre", nombre);
        datos.append("precio", precio);
        datos.append("cantidad", cantidad);
        datos.append("tabla", tabla);

        fetch("agregar_producto.jsp", {
            method: "POST",
            body: datos,
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            credentials: "include"
        })
        .then(res => res.text())
        .then(respuesta => {
            alert("SE HA AGREGADO EL PRODUCTO A TU CARRITO DE COMPRA"); 
        })
        .catch(error => {
            alert("INTENTE DE NUEVO");
        });
    });

});



