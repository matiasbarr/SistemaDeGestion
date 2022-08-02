
function getProducto() {
    var table = document.getElementById("listaProductos");
    var rows = table.getElementsByTagName("tr");

    for (i = 0; i < rows.length; i++) {
        var currentRow = table.rows[i];
        var createClickHandler = function (row) {
            return function () {
                function Producto(idProducto, nombreProducto, valor, stock, formato, cantidad) {
                    this.idProducto = idProducto;
                    this.nombreProducto = nombreProducto;
                    this.valor = valor;
                    this.stock = stock;
                    this.formato = formato;
                    this.cantidad = cantidad;
                }
                var idproducto = row.getElementsByTagName("td")[0];
                var nombreproducto = row.getElementsByTagName("td")[1];
                var valor = row.getElementsByTagName("td")[2];
                var stock = row.getElementsByTagName("td")[3];
                var formato = row.getElementsByTagName("td")[4];
                var cantidad = 1;

                nuevoProducto = new Producto(idproducto.innerHTML, nombreproducto.innerHTML, valor.innerHTML, stock.innerHTML, formato.innerHTML, cantidad);
                agregar();
            };
        };
        currentRow.onclick = createClickHandler(currentRow);
    }
}

var matriz = [];
function agregar() {
    //1. lo que hace es limpiar la matriz dentro del carrito
    document.getElementById("carrito").innerHTML = "";
    //2. es una variable auxiliar, que se activa en caso de el producto(objeto) este repetido
    var bandera = 0;
    //3. Recorre la matriz para dibujar elemento en elemento, el contenido actual del carrito 
    for (i = 0; i < matriz.length; i++) {
        //4. Si ya se encuentra el mismo proucto en el carrito, se aumenta la cantidad y marca la bandera
        if (matriz[i].idProducto === nuevoProducto.idProducto) {
            matriz[i].cantidad = matriz[i].cantidad + nuevoProducto.cantidad;
            bandera = 1;
        }
        document.getElementById("carrito").innerHTML += "<tr><td>" + matriz[i].idProducto + "</td><td>" + matriz[i].nombreProducto + "</td><td>" + matriz[i].cantidad + "</td><td>" + matriz[i].valor + "</td><td>" + (matriz[i].cantidad * matriz[i].valor) + "</td></tr>";
    }
    //5. En caso de que el producto sea nuevo, lo agregar a la matriz
    if (bandera === 0) {
        matriz.push(nuevoProducto);
        var total = nuevoProducto.valor * nuevoProducto.cantidad;
        document.getElementById("carrito").innerHTML += "<tr><td>" + nuevoProducto.idProducto + "</td><td>" + nuevoProducto.nombreProducto + "</td><td>" + nuevoProducto.cantidad + "</td><td>" + nuevoProducto.valor + "</td><td>" + total + "</td></tr>";
    }
    //6. Muestra lo que esta en la matriz actualmente
    document.getElementById("hdn_longitud").value = matriz.length;
    console.log(matriz);
    DetalleCarrito();
}
;
var Fn = {
    // Valida el rut con su cadena completa "XXXXXXXX-X"
    validaRut: function (rutCompleto) {
        rutCompleto = rutCompleto.replace("‐", "-");
        if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test(rutCompleto))
            return false;
        var tmp = rutCompleto.split('-');
        var digv = tmp[1];
        var rut = tmp[0];
        if (digv == 'K')
            digv = 'k';

        return (Fn.dv(rut) == digv);
    },
    dv: function (T) {
        var M = 0, S = 1;
        for (; T; T = Math.floor(T / 10))
            S = (S + T % 10 * (9 - M++ % 6)) % 11;
        return S ? S - 1 : 'k';
    }
}


$("#btnvalida").click(function () {
    if (Fn.validaRut($("#txt_rut").val())) {
        $("#msgerror").html("El rut ingresado es válido :D");
    } else {
        $("#msgerror").html("El Rut no es válido :'( ");
    }
});

function validarNumero(e) {
    var key = e.charCode;
    console.log(key);
    return key >= 48 && key <= 57;
}

function soloLetras(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = "áéíóúabcdefghijklmnñopqrstuvwxyz";
    especiales = "8-37-39-46";
    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        return false;
    }
}



//validacion
var Fn = {
    // Valida el rut con su cadena completa "XXXXXXXX-X"
    validaRut: function (rutCompleto) {
        rutCompleto = rutCompleto.replace("‐", "-");
        if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test(rutCompleto))
            return false;
        var tmp = rutCompleto.split('-');
        var digv = tmp[1];
        var rut = tmp[0];
        if (digv == 'K')
            digv = 'k';

        return (Fn.dv(rut) == digv);
    },
    dv: function (T) {
        var M = 0, S = 1;
        for (; T; T = Math.floor(T / 10))
            S = (S + T % 10 * (9 - M++ % 6)) % 11;
        return S ? S - 1 : 'k';
    }
}


$("#btnvalida").click(function () {
    if (Fn.validaRut($("#txt_rut").val())) {
        $("#msgerror").html("El rut ingresado es válido :D");
    } else {
        $("#msgerror").html("El Rut no es válido :'( ");
    }
});
//VALIDACION


function myFunction() {
    // Declare variables
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function validarLogin() {

    const txtLogin = document.getElementById("txtloginid");
    const passLogin = document.getElementById("txtpasslogin");

    form.addEventListener("submit", e => {
        if (txtLogin.value.length < 6) {
            alert("Nombre muy corto")
        }
    })

}


function getProductoCompra() {
    var table = document.getElementById("listaProductos");
    var rows = table.getElementsByTagName("tr");

    for (i = 0; i < rows.length; i++) {
        var currentRow = table.rows[i];
        var createClickHandler = function (row) {
                    return function () {
                        function Producto(idProducto, nombreProducto, valor, stock, formato, cantidad) {
                            this.idProducto = idProducto;
                            this.nombreProducto = nombreProducto;
                            this.valor = valor;
                            this.stock = stock;
                            this.formato = formato;
                            this.cantidad = cantidad;
                        }
                        var idproducto = row.getElementsByTagName("td")[0];
                        var nombreproducto = row.getElementsByTagName("td")[1];
                        var valor = row.getElementsByTagName("td")[2];
                        var stock = row.getElementsByTagName("td")[3];
                        var formato = row.getElementsByTagName("td")[4];
                        var cantidad = 1;

                        nuevoProducto = new Producto(idproducto.innerHTML, nombreproducto.innerHTML, valor.innerHTML, stock.innerHTML, formato.innerHTML, cantidad);
                        agregarCompra();                        
                    };                    
                };
        currentRow.onclick = createClickHandler(currentRow);       
    }
}

var matriz = [];
function agregarCompra() {
    //1. lo que hace es limpiar la matriz dentro del carrito
    document.getElementById("carrito").innerHTML = "";
    //2. es una variable auxiliar, que se activa en caso de el producto(objeto) este repetido
    var bandera = 0;
    //3. Recorre la matriz para dibujar elemento en elemento, el contenido actual del carrito 
    for(i = 0; i < matriz.length; i++){  
        //4. Si ya se encuentra el mismo proucto en el carrito, se aumenta la cantidad y marca la bandera
        if(matriz[i].idProducto === nuevoProducto.idProducto){
            matriz[i].cantidad = matriz[i].cantidad + nuevoProducto.cantidad;
            bandera = 1;
        }
        document.getElementById("carrito").innerHTML += "<tr><td>"+matriz[i].idProducto+"</td><td>"+matriz[i].nombreProducto+"</td><td>"+matriz[i].cantidad+"</td><td>"+matriz[i].valor+"</td><td>"+(matriz[i].cantidad*matriz[i].valor)+"</td></tr>";  
    }
    //5. En caso de que el producto sea nuevo, lo agregar a la matriz
    if(bandera === 0){
        matriz.push(nuevoProducto);
        var total = nuevoProducto.valor*nuevoProducto.cantidad;
        document.getElementById("carrito").innerHTML += "<tr><td>"+nuevoProducto.idProducto+"</td><td>"+nuevoProducto.nombreProducto+"</td><td>"+nuevoProducto.cantidad+"</td><td>"+nuevoProducto.valor+"</td><td>"+total+"</td></tr>";
    }
    //6. Muestra lo que esta en la matriz actualmente
    document.getElementById("hdn_longitud").value = matriz.length;
    console.log(matriz); 
    DetalleCarrito();   
};                 

function getProductoVenta() {
    var table = document.getElementById("listaProductos");
    var rows = table.getElementsByTagName("tr");

    for (i = 0; i < rows.length; i++) {
        var currentRow = table.rows[i];
        var createClickHandler = function (row) {
                    return function () {
                        function Producto(idProducto, nombreProducto, valor, stock, formato, cantidad) {
                            this.idProducto = idProducto;
                            this.nombreProducto = nombreProducto;
                            this.valor = valor;
                            this.stock = stock;
                            this.formato = formato;
                            this.cantidad = cantidad;
                        }
                        var idproducto = row.getElementsByTagName("td")[0];
                        var nombreproducto = row.getElementsByTagName("td")[1];
                        var valor = row.getElementsByTagName("td")[2];
                        var stock = row.getElementsByTagName("td")[3];
                        var formato = row.getElementsByTagName("td")[4];
                        var cantidad = 1;

                        nuevoProducto = new Producto(idproducto.innerHTML, nombreproducto.innerHTML, valor.innerHTML, stock.innerHTML, formato.innerHTML, cantidad);
                        agregarVenta();                        
                    };                    
                };
        currentRow.onclick = createClickHandler(currentRow);       
    }
}

var matriz = [];
function agregarVenta() {
    //1. lo que hace es limpiar la matriz dentro del carrito
    document.getElementById("carrito").innerHTML = "";
     //2. Es una variable auxiliar, que se activa en caso de el producto(objeto) este repetido
    var bandera = 0;
    //3. Recorre la matriz para dibujar elemento en elemento, el contenido actual del carrito 
    for(i = 0; i < matriz.length; i++){
        //4. En caso de que el producto de la matriz sea igual al nuevo producto del carrito
         if(matriz[i].idProducto === nuevoProducto.idProducto){
            matriz[i].cantidad = matriz[i].cantidad + nuevoProducto.cantidad;
            bandera = 1;
            //5. En caso de que la cantidad sea mayor que el stock
            if (matriz[i].cantidad > nuevoProducto.stock) {
                matriz[i].cantidad = matriz[i].cantidad - nuevoProducto.cantidad;
                alert("La Cantidad Excede El Stock");
            } 
        }
        document.getElementById("carrito").innerHTML += "<tr><td>"+matriz[i].idProducto+"</td><td>"+matriz[i].nombreProducto+"</td><td>"+matriz[i].cantidad+"</td><td>"+matriz[i].valor+"</td><td>"+(matriz[i].cantidad*matriz[i].valor)+"</td></tr>";  
    }
    //6. En caso de que el producto sea nuevo, lo agregar a la matriz
    if(bandera === 0){
        matriz.push(nuevoProducto);
        var total = nuevoProducto.valor*nuevoProducto.cantidad;
        document.getElementById("carrito").innerHTML += "<tr><td>"+nuevoProducto.idProducto+"</td><td>"+nuevoProducto.nombreProducto+"</td><td>"+nuevoProducto.cantidad+"</td><td>"+nuevoProducto.valor+"</td><td>"+total+"</td></tr>";
    }
    //7. Muestra lo que esta en la matriz actualmente
    document.getElementById("hdn_longitud").value = matriz.length;
    console.log(matriz); 
    DetalleCarrito();   
};                

function DetalleCarrito(){
    document.getElementById("hdn_detalle").value = "";
    for(i = 0; i < matriz.length; i++){
        //8. ve el ultimo elemento y si no es el ultimo elemento de coloca "|"
        if ((i+1)=== matriz.length) {
            document.getElementById("hdn_detalle").value += matriz[i].idProducto +";"+ matriz[i].cantidad;
        } else {
            document.getElementById("hdn_detalle").value += matriz[i].idProducto +";"+ matriz[i].cantidad + "-";
        }
    }
}






        
        