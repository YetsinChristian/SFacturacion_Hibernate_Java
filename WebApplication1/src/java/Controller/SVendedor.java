
package Controller;

import HPOJO.Vendedor;
import Model.MVendedor;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SVendedor extends HttpServlet {
    MVendedor mVendedor;
    Vendedor vendedorBean;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        listaVendedor(request, response);    
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opc = request.getParameter("opc");
        if(!"".equals(opc)){
            if(opc.equals("editar"))
                editarVendedor(request, response);
            if(opc.equals("eliminar"))
                eliminarVendedor(request, response);
            if(opc.equals("nuevo"))
                nuevoVendedor(request, response);
            if(opc.equals("registrar"))
                registrarVendedor(request, response);
            if(opc.equals("actualizar"))
                actualizarVendedor(request, response);
        }
    }

    private void listaVendedor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        mVendedor = new MVendedor();        
        List<Vendedor> listaVendedor = mVendedor.getVendedor();
        request.setAttribute("listaVendedor", listaVendedor);
        request.getRequestDispatcher("ListaVendedor.jsp").forward(request, response);
    }

    private void editarVendedor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        vendedorBean = new Vendedor();
        vendedorBean.setVenCod(Integer.parseInt(request.getParameter("codigo")));
        mVendedor = new MVendedor();
        Vendedor obj = mVendedor.findVendedor(vendedorBean);
        request.setAttribute("objVendedor", obj);
        request.getRequestDispatcher("ActualizarVendedor.jsp").forward(request, response);
    }

    private void eliminarVendedor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        vendedorBean = new Vendedor();
        vendedorBean.setVenCod(Integer.parseInt(request.getParameter("codigo")));
        mVendedor = new MVendedor();
        mVendedor.deleteVendedor(vendedorBean);
        listaVendedor(request, response);
    }

    private void nuevoVendedor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.getRequestDispatcher("RegistroVendedor.jsp").forward(request, response);
    }

    private void registrarVendedor(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
        //Obteniendo fecha
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy");
        //
        vendedorBean = new Vendedor();
        vendedorBean.setVenNom(request.getParameter("txtNombre"));
        vendedorBean.setVenApe(request.getParameter("txtApellido"));
        vendedorBean.setVenFnac(request.getParameter("txtFNacimiento"));
        vendedorBean.setVenCel(request.getParameter("txtCelular"));
        vendedorBean.setVenFing(dateFormat.format(date));
        vendedorBean.setVenLogin(request.getParameter("txtLogin"));
        vendedorBean.setVenClave(request.getParameter("txtClave"));
        mVendedor = new MVendedor();
        mVendedor.saveVendedor(vendedorBean);
        listaVendedor(request, response);
    }

    private void actualizarVendedor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        vendedorBean = new Vendedor();
        vendedorBean.setVenCod(Integer.parseInt(request.getParameter("codigo")));
        vendedorBean.setVenNom(request.getParameter("txtNombre"));
        vendedorBean.setVenApe(request.getParameter("txtApellido"));
        vendedorBean.setVenFnac(request.getParameter("txtFNacimiento"));
        vendedorBean.setVenCel(request.getParameter("txtCelular"));
        vendedorBean.setVenLogin(request.getParameter("txtLogin"));
        vendedorBean.setVenClave(request.getParameter("txtClave"));
        mVendedor = new MVendedor();
        mVendedor.updateCliente(vendedorBean);
        listaVendedor(request, response);                                
    }
}
