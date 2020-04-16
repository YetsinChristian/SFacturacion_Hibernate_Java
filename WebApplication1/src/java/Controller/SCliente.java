
package Controller;

import HPOJO.Clientes;
import Model.MCliente;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SCliente extends HttpServlet {
    MCliente mCliente;
    Clientes clienteBean;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {                          
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {                        
        listaCliente(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opc = request.getParameter("opc");
        if(!"".equals(opc)){
            if(opc.equals("editar"))
                editarCliente(request, response);
            if(opc.equals("eliminar"))
                eliminarCliente(request, response);
            if(opc.equals("nuevo"))
                nuevoCliente(request, response);
            if(opc.equals("registrar"))
                registrarCliente(request, response);
            if(opc.equals("actualizar"))
                actualizarCliente(request, response);
        }
    }

    private void listaCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        mCliente = new MCliente();        
        List<Clientes> listaCliente = mCliente.getCliente();
        request.setAttribute("listaCliente", listaCliente);
        request.getRequestDispatcher("ListaCliente.jsp").forward(request, response);
    }

    private void editarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        clienteBean = new Clientes();
        clienteBean.setCliCod(Integer.parseInt(request.getParameter("codigo")));
        mCliente = new MCliente();
        Clientes obj = mCliente.findCliente(clienteBean);
        request.setAttribute("objCliente", obj);
        request.getRequestDispatcher("ActualizarCliente.jsp").forward(request, response);
    }

    private void eliminarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        clienteBean = new Clientes();
        clienteBean.setCliCod(Integer.parseInt(request.getParameter("codigo")));
        mCliente = new MCliente();
        mCliente.deleteCliente(clienteBean);
        listaCliente(request, response);
    }

    private void nuevoCliente(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        request.getRequestDispatcher("RegistroCliente.jsp").forward(request, response);
    }

    private void registrarCliente(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {        
        clienteBean = new Clientes();
        clienteBean.setCliNom(request.getParameter("txtNombre"));
        clienteBean.setCliTel(request.getParameter("txtTelefono"));
        clienteBean.setCliCor(request.getParameter("txtCorreo"));
        clienteBean.setCliDir(request.getParameter("txtDireccion"));
        clienteBean.setCliCre(BigDecimal.valueOf(Double.parseDouble(request.getParameter("txtCredito"))));
        mCliente = new MCliente();
        mCliente.saveCliente(clienteBean);
        listaCliente(request, response);
    }

    private void actualizarCliente(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {        
        clienteBean = new Clientes();
        clienteBean.setCliCod(Integer.parseInt(request.getParameter("codigo")));
        clienteBean.setCliNom(request.getParameter("txtNombre"));
        clienteBean.setCliTel(request.getParameter("txtTelefono"));
        clienteBean.setCliCor(request.getParameter("txtCorreo"));
        clienteBean.setCliDir(request.getParameter("txtDireccion"));
        clienteBean.setCliCre(BigDecimal.valueOf(Double.parseDouble(request.getParameter("txtCredito"))));
        mCliente = new MCliente();
        mCliente.updateCliente(clienteBean);
        listaCliente(request, response);                                
    }
   
}
