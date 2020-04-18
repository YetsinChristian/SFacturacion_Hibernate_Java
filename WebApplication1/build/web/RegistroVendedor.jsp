<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">            
            <h3>Nuevo Vendedor</h3>
            <hr />

            <form action="SVendedor" method="post">
                <div class="form-group col-md-6">
                    Nombres:
                    <input type="text" name="txtNombre" class="form-control" placeholder="Ingrese Nombres completos" />
                </div>
                <div class="form-group col-md-6">
                    Apellidos:
                    <input type="text" name="txtApellido" class="form-control" placeholder="Ingrese Apellidos completos" />
                </div>
                <div class="form-group col-md-6">
                    Fecha de Nacimiento:
                    <input type="date" name="txtFNacimiento" class="form-control" placeholder="F. Nacimiento" />
                </div>
                <div class="form-group col-md-6">
                    Celular:
                    <input type="text" name="txtCelular" class="form-control" placeholder="Ingrese numero celular" />
                </div>
                <div class="form-group col-md-6">
                    Login(Usuario):
                    <input type="text" name="txtLogin" class="form-control" placeholder="Ingrese un nombre de usuario" />
                </div>
                <div class="form-group col-md-6">
                    Contraseña:
                    <input type="password" name="txtClave" class="form-control" placeholder="Ingrese contraseña" />
                </div>
                <div class="form-group col-md-6">                                   
                    <button class="btn btn-success" name="opc" value="registrar">Registrar</button>
                </div>
            </form>
            <a href="index.jsp" class="btn btn-link">Atras</a>
        </div>
    </body>
</html>

