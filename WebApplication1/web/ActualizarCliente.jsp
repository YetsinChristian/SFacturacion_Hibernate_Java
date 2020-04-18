<%@page import="HPOJO.Clientes"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">            
            <h3>Editar Cliente</h3>
            <hr />

            <form action="SCliente" method="post"
                <%
                    Clientes obj = (Clientes)request.getAttribute("objCliente");
                %>
                <div class="form-group col-md-6">
                    Nombres y Apellidos:
                    <input type="text" name="txtNombre" class="form-control" placeholder="Ingrese Nombre completo"  value="<%=obj.getCliNom() %>"/>
                </div>
                <div class="form-group col-md-6">
                    Telefono:
                    <input type="text" name="txtTelefono" class="form-control" placeholder="Ingrese teléfono" value="<%=obj.getCliTel() %>"/>
                </div>
                <div class="form-group col-md-6">
                    Email:
                    <input type="text" name="txtCorreo" class="form-control" placeholder="Ingrese Email" value="<%=obj.getCliCor() %>"/>
                </div>
                <div class="form-group col-md-6">
                    Dirección:
                    <input type="text" name="txtDireccion" class="form-control" placeholder="Ingrese dirección" value="<%=obj.getCliDir() %>"/>
                </div>
                <div class="form-group col-md-6">
                    Credito:
                    <input type="text" name="txtCredito" class="form-control" placeholder="Ingrese credito" value="<%=obj.getCliCre() %>"/>
                </div>
                <div class="form-group col-md-6">   
                    <input type="hidden" name="codigo" value="<%=obj.getCliCod() %>"/>
                    <button class="btn btn-success" name="opc" value="actualizar">Actualizar</button>
                </div>
            </form>            
        </div>
    </body>
</html>

