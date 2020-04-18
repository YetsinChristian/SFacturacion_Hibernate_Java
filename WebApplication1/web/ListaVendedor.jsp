
<%@page import="java.util.List"%>
<%@page import="HPOJO.Vendedor"%>
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
        <h1>Lista de Vendedores</h1>
        </center>
   
        <div class="container">
            <div class="form-group col-md-6">                
                <form method="post" action="SVendedor">                    
                    <button class="btn btn-success" type="submit" name="opc" value="nuevo">Nuevo Vendedor</button>
                    <a class="btn btn-link" href="index.jsp">Menú Principal</a>
                </form>                
            </div>
            <table class="table">
                <thead class ="thead-dark">
                    <tr>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>F. Nacimiento</th>
                        <th>Celular</th>
                        <th>F. Ingreso</th>
                        <th>Login</th>                                           
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody>   
                    <%
                    List<Vendedor> lista = (List<Vendedor>)request.getAttribute("listaVendedor");
                    for(Vendedor list:lista){
                        %>
                        <tr>
                            <td><%=list.getVenNom() %></td>
                            <td><%=list.getVenApe() %></td>
                            <td><%=list.getVenFnac() %></td>
                            <td><%=list.getVenCel() %></td>
                            <td><%=list.getVenFing() %></td>
                            <td><%=list.getVenLogin() %></td>                        
                            <td>
                                <form method="post" action="SVendedor">                                    
                                    <button class="btn btn-primary" type="submit" name="opc" value="editar">Editar</button>
                                    <button class="btn btn-danger" type="submit" name="opc" value="eliminar">Eliminar</button>                                    
                                    <input type="hidden" name="codigo" value="<%=list.getVenCod() %>">
                                </form>
                            </td>
                        </tr>
                        <%}%>
                </tbody>
            </table>        
        </div>
    </body>
</html>
