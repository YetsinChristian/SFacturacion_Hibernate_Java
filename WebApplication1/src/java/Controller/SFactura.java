
package Controller;

import HPOJO.Articulos;
import HPOJO.Clientes;
import HPOJO.FacCabe;
import HPOJO.FacDeta;
import HPOJO.Vendedor;
import Model.MArticulo;
import Model.MCliente;
import Model.MFactura;
import Model.MVendedor;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SFactura extends HttpServlet {
    MVendedor mVendedor;
    Vendedor vendedorBean;
    MCliente mCliente;
    Clientes clienteBean;
    MArticulo mArticulo;
    Articulos articuloBean;
    MFactura mFactura;
    FacCabe facCabeBean;
    FacDeta facDetaBean;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {                
        try{
            String opc = request.getParameter("opc");
            if(!"".equals(opc))
                if(opc.equals("nuevo"))
                    nuevoFactura(request, response);                         
        }catch(NullPointerException e){
            listarFactura(request, response);
        }
    }

    //Lista que almacenara la lista del detalle de la tabla factura
    List<FacDeta> LDetalle = new ArrayList<FacDeta>();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opc = request.getParameter("opc");
        if(!"".equals(opc)){
            if(opc.equals("ver"))
                verFactura(request, response);            
            if(opc.equals("nuevo"))
                nuevoFactura(request, response);
            if(opc.equals("registrar"))
                registrarFactura(request, response);            
            if(opc.equals("LDetalle"))
                LDetalle(request, response);
        }
    }
    private void listarFactura(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        mFactura = new MFactura();
        List<FacCabe> listaFactura = mFactura.getFacturas();
        request.setAttribute("listaFactura", listaFactura);
        request.getRequestDispatcher("ListaFactura.jsp").forward(request, response);
    }

    private void verFactura(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        facCabeBean = new FacCabe();
        facCabeBean.setFacNum(Integer.parseInt(request.getParameter("codigo")));
        mFactura = new MFactura();
        FacCabe data = mFactura.findFactura(facCabeBean);
        List<FacDeta> dataDetalle = mFactura.findFacturaDetalle(facCabeBean);
        request.setAttribute("dataFactura", data);
        request.setAttribute("dataDetalle", dataDetalle);
        request.getRequestDispatcher("verFactura.jsp").forward(request, response);
    }

    private void nuevoFactura(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        mVendedor = new MVendedor();        
        List<Vendedor> listaVendedor = mVendedor.getVendedor();
        request.setAttribute("listaVendedor", listaVendedor);
        mCliente = new MCliente();        
        List<Clientes> listaCliente = mCliente.getCliente();
        request.setAttribute("listaCliente", listaCliente);
        mArticulo = new MArticulo();        
        List<Articulos> listaArticulo = mArticulo.getArticulo();
        request.setAttribute("listaArticulo", listaArticulo);
        mFactura = new MFactura();
        int ultimaFactura = mFactura.topFactura();
        request.setAttribute("ultimaFactura", ultimaFactura);
        request.getRequestDispatcher("RegistroFactura.jsp").forward(request, response);
    }

    private void registrarFactura(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                
        facCabeBean = new FacCabe();
        facCabeBean.setFacFec(request.getParameter("txtFecha"));
        clienteBean = new Clientes();
        clienteBean.setCliCod(Integer.parseInt(request.getParameter("cboCliente")));
        facCabeBean.setClientes(clienteBean);
        facCabeBean.setFacTipo('F');
        vendedorBean = new Vendedor();
        vendedorBean.setVenCod(Integer.parseInt(request.getParameter("cboVendedor")));
        facCabeBean.setVendedor(vendedorBean);
        facCabeBean.setFacSubt(BigDecimal.valueOf(Double.parseDouble(request.getParameter("txtSub"))));
        facCabeBean.setFacIgv(BigDecimal.valueOf(Double.parseDouble(request.getParameter("txtIgv"))));
        facCabeBean.setFacTot(BigDecimal.valueOf(Double.parseDouble(request.getParameter("txtTot"))));
        //
        mFactura = new MFactura();
        mFactura.saveFactura(facCabeBean);        
        if(LDetalle.size()>0)
            mFactura.saveDetalleFactura(LDetalle);
        LDetalle.clear();
        listarFactura(request,response);        
    }    

    private void LDetalle(HttpServletRequest request, HttpServletResponse response) {        
        facDetaBean = new FacDeta();
        articuloBean = new Articulos();
        articuloBean.setArtCod(Integer.parseInt(request.getParameter("cod")));
        facDetaBean.setArticulos(articuloBean);
        facDetaBean.setArtCan(Integer.parseInt(request.getParameter("can")));
        facDetaBean.setPrecioArt(BigDecimal.valueOf(Double.parseDouble(request.getParameter("pre"))));
        LDetalle.add(facDetaBean);        
    }
}
