<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">            
            <h3>Nuevo Cliente</h3>
            <hr />

            <form action="SCliente" method="post">
                <div class="form-group col-md-6">
                    Nombres y Apellidos:
                    <input type="text" name="txtNombre" class="form-control" placeholder="Ingrese Nombre completo" />
                </div>
                <div class="form-group col-md-6">
                    Telefono:
                    <input type="text" name="txtTelefono" class="form-control" placeholder="Ingrese teléfono" />
                </div>
                <div class="form-group col-md-6">
                    Email:
                    <input type="text" name="txtCorreo" class="form-control" placeholder="Ingrese Email" />
                </div>
                <div class="form-group col-md-6">
                    Dirección:
                    <input type="text" name="txtDireccion" class="form-control" placeholder="Ingrese dirección" />
                </div>
                <div class="form-group col-md-6">
                    Credito:
                    <input type="text" name="txtCredito" class="form-control" placeholder="Ingrese credito" />
                </div>
                <div class="form-group col-md-6">                                   
                    <button class="btn btn-success" name="opc" value="registrar">Registrar</button>
                </div>
            </form>
            <a href="index.jsp" class="btn btn-link">Atras</a>
        </div>
    </body>
</html>

