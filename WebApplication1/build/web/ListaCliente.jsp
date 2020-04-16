
<%@page import="java.util.List"%>
<%@page import="HPOJO.Clientes"%>
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
        <h1>Lista de Clientes</h1>
        </center>
   
        <div class="container">
            <div class="form-group col-md-6">                
                <form method="post" action="SCliente">                    
                    <button class="btn btn-success" type="submit" name="opc" value="nuevo">Nuevo Cliente</button>
                    <a class="btn btn-link" href="index.jsp">Menú Principal</a>
                </form>                
            </div>
            <table class="table">
                <thead class ="thead-dark">
                    <tr>
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Telefono</th>
                        <th>Correo</th>
                        <th>Dirección</th>
                        <th>Credito</th>                   
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody>   
                    <%
                    List<Clientes> lista = (List<Clientes>)request.getAttribute("listaCliente");
                    for(Clientes list:lista){
                        %>
                        <tr>
                            <td><%=list.getCliCod()%></td>
                            <td><%=list.getCliNom()%></td>
                            <td><%=list.getCliTel()%></td>
                            <td><%=list.getCliCor()%></td>
                            <td><%=list.getCliDir()%></td>
                            <td><%=list.getCliCre()%></td>                        
                            <td>
                                <form method="post" action="SCliente">                                    
                                    <button class="btn btn-primary" type="submit" name="opc" value="editar">Editar</button>
                                    <button class="btn btn-danger" type="submit" name="opc" value="eliminar">Eliminar</button>                                    
                                    <input type="hidden" name="codigo" value="<%=list.getCliCod()%>">
                                </form>
                            </td>
                        </tr>
                        <%}%>
                </tbody>
            </table>        
        </div>
    </body>
</html>
