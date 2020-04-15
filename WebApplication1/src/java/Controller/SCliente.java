
package Controller;

import HPOJO.Clientes;
import Model.Cliente;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SCliente extends HttpServlet {

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
        
    }

    private void listaCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cliente objCli = new Cliente();
        List<Clientes> listaCliente = objCli.getClientes();
        request.setAttribute("listaCliente", listaCliente);
        request.getRequestDispatcher("ListaCliente.jsp").forward(request, response);
    }
   
}
