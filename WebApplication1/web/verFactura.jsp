<%@page import="java.math.BigDecimal"%>
<%@page import="HPOJO.FacDeta"%>
<%@page import="java.util.List"%>
<%@page import="HPOJO.FacCabe"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <%
        FacCabe data = (FacCabe)request.getAttribute("dataFactura");
        List<FacDeta> lista = (List<FacDeta>)request.getAttribute("dataDetalle");
        System.out.println("web: " + lista.size() );
    %>
    <body>
        <div>
            <center><h1>Detalle de Factura</h1></center>
        </div>
        
        <div class="row">
            <div class="container">                        
                <table>
                    <tr>
                        <td>
                            <label>Fecha</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input id="fecha" class="form-control" type="date" readonly="" value="<%=data.getFacFec() %>"/>
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
                            <input id="nFactura" class="form-control" type="text" value="<%=data.getFacNum() %>" readonly="" />
                        </td>
                        <td>
                            <select id="cboVendedor" class="form-control" style="width:300px;" disabled="disabled" >
                                <option><%=data.getVendedor().getVenNom() +" " + data.getVendedor().getVenApe() %> </option>                                 
                            </select>
                        </td>
                        <td>
                            <select id="cboCliente" class="form-control" style="width:300px;" disabled="disabled">                                    
                                <option> <%=data.getClientes().getCliNom() %> </option>
                            </select>
                        </td>
                    </tr>                
                </table>                                                
                <br />
                <table class="table" id="tablaDetalle">
                    <thead class="thead-dark">
                        <tr>                        
                            <th scope="col">Articulo</th>
                            <th scope="col" style="text-align: center">Precio</th>
                            <th scope="col" style="text-align: center">Cantidad</th>
                            <th scope="col" style="text-align: center">Importe</th>                            
                        </tr>
                    </thead>
                    <tbody id="tbody">                    
                        <%
                        for(FacDeta list : lista){
                            int can = list.getArtCan();                            
                            double precio = list.getPrecioArt().doubleValue() ;
                            double importe = (double)(can * precio)  ;
                            %>
                            <tr>
                                <td><%=list.getArticulos().getArtNom() %></td>
                                <td style="text-align: center"><%=list.getPrecioArt() %></td>
                                <td style="text-align: center"><%=list.getArtCan() %></td>
                                <td style="text-align: center"><%=importe %></td>
                            </tr>    
                            <%
                        }
                        %>
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
                                <input id="txtSub" class="form-control" type="text" name="txtSub" value="<%=data.getFacSubt() %>" readonly=""/>
                            </td>
                            <td>
                                <input id="txtIgv" class="form-control" type="text" name="txtIgv" value="<%=data.getFacIgv() %>" readonly=""/>
                            </td>
                            <td>
                                <input id="txtTot" class="form-control" type="text" name="txtTot" value="<%=data.getFacTot() %>" readonly=""/>
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>
                <br /><br /><br /><br />
                <div style="float:left">                                                                                   
                    <a class="btn btn-link" href="SFactura">Lista de Facturas</a>
                </div>                
            </div>
        </div>
    </body>    
</html>