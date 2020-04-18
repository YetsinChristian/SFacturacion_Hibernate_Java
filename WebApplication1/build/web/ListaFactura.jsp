
<%@page import="HPOJO.FacCabe"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <center>
        <h1>Lista de Facturas</h1>
        </center>
   
        <div class="container">
            <div class="form-group col-md-6">                
                <form method="post" action="SFactura">                    
                    <button class="btn btn-success" type="submit" name="opc" value="nuevo">Nuevo Factura</button>
                    <a class="btn btn-link" href="index.jsp">Menú Principal</a>
                </form>                
            </div>
            <table class="table">
                <thead class ="thead-dark">
                    <tr>
                        <th>N. Factura</th>
                        <th>Fecha</th>
                        <th>Cliente</th>
                        <th>Vendedor</th>
                        <th>Importe Total</th>                                          
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody>   
                    <%
                    List<FacCabe> lista = (List<FacCabe>)request.getAttribute("listaFactura");
                    for(FacCabe list:lista){
                        %>
                        <tr>
                            <td><%=list.getFacNum()%></td>
                            <td><%=list.getFacFec() %></td>
                            <td><%=list.getClientes().getCliNom() %></td>
                            <td><%=list.getVendedor().getVenNom() + " " + list.getVendedor().getVenApe() %></td>
                            <td><%=list.getFacTot() %></td>                            
                            <td>
                                <form method="post" action="SFactura">                                    
                                    <button class="btn btn-primary" type="submit" name="opc" value="ver">Ver</button>                                    
                                    <input type="hidden" name="codigo" value="<%=list.getFacNum()%>">
                                </form>
                            </td>
                        </tr>
                        <%}%>
                </tbody>
            </table>        
        </div>
    </body>
</html>
