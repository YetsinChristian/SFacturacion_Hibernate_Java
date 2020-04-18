<%@page import="HPOJO.FacDeta"%>
<%@page import="HPOJO.Articulos"%>
<%@page import="HPOJO.Vendedor"%>
<%@page import="HPOJO.Clientes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <div>
            <center><h1>Registrar Factura</h1></center>
        </div>        
        <div class="row">
            <div class="container">        
                <form action="SFactura" method="post" id="FormFact" >
                    <table>
                        <tr>
                            <td>
                                <label>Fecha</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="fecha" class="form-control" type="date" name="txtFecha" readonly=""/>
                            </td>
                        </tr>
                    </table>           

                    <table>                
                        <tr>
                            <td>
                                <label>TIPO DE DOCUMENTO</label>
                            </td>
                            <td>
                                <label>NUMERO</label>
                            </td>
                            <td>
                                <label>VENDEDOR</label>
                            </td>
                            <td>
                                <label>CLIENTE</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="form-control" type="text" value="Factura" readonly=""/>
                            </td>
                            <td>
                                <input id="nFactura" class="form-control" type="text" value="<%=request.getAttribute("ultimaFactura") %>" readonly="" />
                            </td>
                            <td>
                                <select id="cboVendedor" class="form-control" style="width:300px;" name="cboVendedor">
                                    <%
                                        List<Vendedor> lista1 = (List<Vendedor>)request.getAttribute("listaVendedor");
                                        for(Vendedor list:lista1){
                                            %>
                                            <option value="<%=list.getVenCod()%>"><%=list.getVenNom()+" "+list.getVenApe() %></option>
                                            <%
                                        }
                                    %>                                    
                                </select>
                            </td>
                            <td>
                                <select id="cboCliente" class="form-control" style="width:300px;" name="cboCliente">                                    
                                    <%
                                        List<Clientes> lista2 = (List<Clientes>)request.getAttribute("listaCliente");
                                        for(Clientes list:lista2){
                                            %>
                                            <option value="<%=list.getCliCod()%>"><%=list.getCliNom()%></option>
                                            <%
                                        }
                                    %>                                    
                                </select>
                            </td>
                        </tr>                
                    </table>
                    <br />
                    <table>                
                        <tr>
                            <td>
                                <label>ARTICULO</label>
                            </td>
                            <td>
                                <label>PRECIO</label>
                            </td>
                            <td>
                                <label>CANTIDAD</label>
                            </td>
                            <td>
                                <label>OPCIONES</label>
                            </td>
                        </tr>    
                        <tr>
                            <td>
                                <select id="cboArticulo" class="form-control" style="width:300px;" onchange="validar()">                            
                                    <%
                                        List<Articulos> lista3 = (List<Articulos>)request.getAttribute("listaArticulo");
                                        for(Articulos list:lista3){
                                            %>
                                            <option value="<%=list.getArtCod() %>"><%=list.getArtNom() %></option>
                                            <%
                                        }
                                    %>                                    
                                </select>
                            </td>      
                            <td>
                                <div id="resultado">
                                    <input class="form-control" id="precio" type="text" value="0" readonly=""/>
                                </div>                        
                            </td>     
                            <td>
                                <input id="cantidad" class="form-control" type="number" value="1" min="1"/>
                            </td>     
                            <td>                                
                                <input class="form-control btn-primary" style="width:300px;" type="button" value="Agregar" onclick="{Add();}">                                
                            </td>    
                        </tr>
                    </table>                
                    <br />
                    <table class="table" id="tablaDetalle">
                        <thead class="thead-dark">
                            <tr>                        
                                <th scope="col" >Articulo</th>
                                <th scope="col" style="text-align: center">Precio</th>
                                <th scope="col" style="text-align: center">Cantidad</th>
                                <th scope="col" style="text-align: center">Importe</th>
                                <th scope="col" style="text-align: center">Opciones</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">                    
                        </tbody>
                    </table>
                    <div style="float:right">
                        <table>
                            <tr>
                                <td>
                                    <label>SUBTOTAL</label>
                                </td>
                                <td>
                                    <label>IGV</label>
                                </td>
                                <td>
                                    <label>TOTAL</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input id="txtSub" class="form-control" type="text" name="txtSub" value="0.00" readonly=""/>
                                </td>
                                <td>
                                    <input id="txtIgv" class="form-control" type="text" name="txtIgv" value="0.00" readonly=""/>
                                </td>
                                <td>
                                    <input id="txtTot" class="form-control" type="text" name="txtTot" value="0.00" readonly=""/>
                                </td>
                            </tr>
                        </table>
                        <br />

                    </div>
                    <br /><br /><br /><br />
                    <div style="float:left">                                   
                        <input type="hidden" name="opc" value="registrar"/>
                        <button class="form-control btn-primary" type="button" onclick="cargarTablaDetalle()" >Registrar Factura</button>
                        <a class="btn btn-link" href="index.jsp">Menú Principal</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <script>        
        var fecha = new Date(); //Fecha actual
        var mes = fecha.getMonth() + 1; //obteniendo mes
        var dia = fecha.getDate(); //obteniendo dia
        var ano = fecha.getFullYear(); //obteniendo año
        if (dia < 10)
            dia = '0' + dia; //agrega cero si el menor de 10
        if (mes < 10)
            mes = '0' + mes; //agrega cero si el menor de 10
        var fechaActual = ano + "-" + mes + "-" + dia;
        document.getElementById("fecha").value = fechaActual;

    </script>
    <script>
        function obtenerPrecio(){         
            var codArt = parseInt(document.getElementById("cboArticulo").value);               
            <%
                for(Articulos lista : lista3){
                    %>
                    var codigo = <%=lista.getArtCod()%>                            
                    if (codArt===codigo) {
                        document.getElementById("precio").value ="<%=lista.getArtPre() %>";                                                
                    }
                    <%
                }
            %>                
        }
        //Dar el precio ni bien se carga la pagina               
        obtenerPrecio();    
        //Validar el precio cuando se realice un cambio en el select
        function validar(){
            obtenerPrecio();
        }
        //Funcion para agregar datos a la tabla detalle        
        function Add(){            
            var art = document.getElementById("cboArticulo");
            var codigo = art.value;
            var descrip = art.options[art.selectedIndex].text;
            var cant = document.getElementById("cantidad").value;           
            var precio = (parseFloat(document.getElementById("precio").value)).toFixed(2);
            var importe = (parseFloat(precio * cant)).toFixed(2);
            if (cant >= 0 || cant !== '') {
                var cantFilas = document.getElementById("tablaDetalle").rows.length;
                if (cantFilas >1) {
                    for (var i = 1, max = cantFilas; i < max; i++) {
                        var codigoFila = document.getElementById("tablaDetalle").rows[i].cells[0].innerText;
                        if (codigoFila  === codigo) {                            
                            document.getElementById("tablaDetalle").rows[i].cells[3].innerHTML = cant;                                                        
                            document.getElementById("tablaDetalle").rows[i].cells[4].innerHTML = importe;
                            actualizarfinales();
                            break;
                        }
                        if (i === max - 1) {
                            agregarItem();
                        }
                    }
                } else {
                    agregarItem();                    
                }
            }
            //Funcion para agregar un nuevo registro a la tabla detalle
            function agregarItem(){                
                var nuevaFila = document.createElement("tr");
                nuevaFila.setAttribute("id", codigo);
                document.getElementById("tbody").appendChild(nuevaFila);

                var col = document.createElement("td");
                col.innerHTML = codigo;
                col.setAttribute("hidden", "hidden");
                document.getElementById(codigo).appendChild(col);

                var col1 = document.createElement("td");
                col1.innerHTML = descrip;
                document.getElementById(codigo).appendChild(col1);

                var col2 = document.createElement("td");
                col2.innerHTML = precio;
                col2.setAttribute("Style","text-align: center");
                document.getElementById(codigo).appendChild(col2);

                var col3 = document.createElement("td");
                col3.innerHTML = cant;
                col3.setAttribute("Style","text-align: center");
                document.getElementById(codigo).appendChild(col3);

                var col4 = document.createElement("td");
                col4.innerHTML = importe;
                col4.setAttribute("Style","text-align: center");
                document.getElementById(codigo).appendChild(col4);

                var col5 = document.createElement("td");
                col5.setAttribute("Style","text-align: center");
                col5.innerHTML = "<input type=button value=+ onclick=aumentar(\'" + codigo + "\') class='btn btn-success btn-xs' />"+
                                 "<input type=button value=- onclick=disminuir(\'" + codigo + "\') class='btn btn-warning btn-xs' />"+
                                 "<input type=button value=Quitar onclick=eliminar(\'" + codigo + "\') class='btn btn-danger btn-xs' />";
                document.getElementById(codigo).appendChild(col5);
                actualizarfinales();
            }                    
        }
        //funcion para actualizar los importes finales
        function actualizarfinales() {
            var total = 0;
            var cantFilas = document.getElementById("tablaDetalle").rows.length;
            if (cantFilas >1) {
                for (var i = 1, max = cantFilas; i < max; i++) {
                    total = total + parseFloat(document.getElementById("tablaDetalle").rows[i].cells[4].innerText);
                }
                document.getElementById("txtTot").value = (total).toFixed(2);
                document.getElementById("txtIgv").value = (total * 0.18).toFixed(2);
                document.getElementById("txtSub").value = (total - (total * 0.18)).toFixed(2);
            } else {
                document.getElementById("txtSub").value = 0.00;
                document.getElementById("txtIgv").value = 0.00;
                document.getElementById("txtTot").value = 0.00;
            }
        }
        //Funcion para eliminar un item de la tabla detalle
        function eliminar(number) {
            var parent = document.getElementById(number).parentNode;
            parent.removeChild(document.getElementById(number));
            actualizarfinales();
        }                
        //Funcion para disminuir la cantidad de un item de la tabla detalle        
        function disminuir(number) {
            var cantidadNueva=0;
            var cantFilas = document.getElementById("tablaDetalle").rows.length;            
            for (var i = 1, max = cantFilas; i < max; i++) {
                var codigoFila = document.getElementById("tablaDetalle").rows[i].cells[0].innerText;
                if(codigoFila === number){
                    cantidadNueva = parseInt(document.getElementById("tablaDetalle").rows[i].cells[3].innerText)-1;
                    var precio= parseFloat(document.getElementById("tablaDetalle").rows[i].cells[2].innerText);
                    document.getElementById("tablaDetalle").rows[i].cells[3].innerHTML = cantidadNueva;
                    document.getElementById("tablaDetalle").rows[i].cells[4].innerHTML = (precio*cantidadNueva).toFixed(2);
                    break;
                }
            }
            if(cantidadNueva<=0){
                eliminar(number);
            }            
            actualizarfinales();
        }
        //Funcion para aumentar la cantidad de un item de la tabla detalle
        function aumentar(number) {
            var cantidadNueva=0;
            var cantFilas = document.getElementById("tablaDetalle").rows.length;            
            for (var i = 1, max = cantFilas; i < max; i++) {
                var codigoFila = document.getElementById("tablaDetalle").rows[i].cells[0].innerText;
                if(codigoFila === number){
                    cantidadNueva = parseInt(document.getElementById("tablaDetalle").rows[i].cells[3].innerText)+1;
                    var precio= parseFloat(document.getElementById("tablaDetalle").rows[i].cells[2].innerText);
                    document.getElementById("tablaDetalle").rows[i].cells[3].innerHTML = cantidadNueva;
                    document.getElementById("tablaDetalle").rows[i].cells[4].innerHTML = (precio*cantidadNueva).toFixed(2);
                    document.getElementById("tablaDetalle").rows[i].cells[3].innerHTML = cantidadNueva;
                    break;
                }
            }            
            actualizarfinales();
        }
        //funcion de prueba
        function mensaje(){            
            alert("hola");                                    
        }                
    </script>
    <!---//Libreria para el funcionamiento de ajax-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
    <script>
        //Funcion para enviar los datos de la tabla detalle al servlet
        function cargarTablaDetalle(){                
            var cantFilas = document.getElementById("tablaDetalle").rows.length;   
            if(cantFilas>1){
                for (var i = 1, max = cantFilas; i < max; i++) {                          
                    var codigo = document.getElementById("tablaDetalle").rows[i].cells[0].innerText;
                    var precio = document.getElementById("tablaDetalle").rows[i].cells[2].innerText;  
                    var cantidad = document.getElementById("tablaDetalle").rows[i].cells[3].innerText;
                    $.ajax({                        
                        type: 'POST',
                        data: {opc : 'LDetalle', cod : codigo, pre : precio, can : cantidad},
                        url:'SFactura',
                        success: function(){                            
                        }
                    });
                }
                document.forms["FormFact"].submit();                             
            } 
        }
    </script>
</html>
