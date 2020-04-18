
package Model;

import HPOJO.Vendedor;
import HUtil.NewHibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class MVendedor {
    //Lista de Vendedores
    public List<Vendedor> getVendedor(){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        //List<Vendedor> lista = ses.createQuery("from Clientes").list();
        List<Vendedor> lista = ses.createCriteria(Vendedor.class).list();        
        return lista;
    }
    //Guardar Vendedor
    public void saveVendedor(Vendedor obj){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tr = ses.beginTransaction();
        ses.save(obj);
        tr.commit();
    }
    //Eliminar Vendedor
    public void deleteVendedor(Vendedor obj){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        //Obtener objetoCliente de la lista que ofrece la clase
        Vendedor vend = (Vendedor)ses.get(Vendedor.class, obj.getVenCod());            
        //Primera manera de eliminar el objeto encontrado
        Transaction tr = ses.beginTransaction();
        ses.delete(vend);
        tr.commit();
        //Segunda manera
        ////ses.delete(cli);
        ////ses.beginTransaction().commit();                                    
    }
    //Buscar un Vendedor
    public Vendedor findVendedor(Vendedor obj){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        Vendedor objVendedor = (Vendedor)ses.get(Vendedor.class, obj.getVenCod());
        ses.close();
        return objVendedor;
    }
    //Actualizar un objeto
    public void updateCliente(Vendedor obj){                
        //Buscando al objeto 
        Vendedor objVend = findVendedor(obj);
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        //Actualizado atributos del objeto encontrado
        objVend.setVenNom(obj.getVenNom());
        objVend.setVenApe(obj.getVenApe());
        objVend.setVenFnac(obj.getVenFnac());
        objVend.setVenCel(obj.getVenCel());
        objVend.setVenFing(obj.getVenFing());
        objVend.setVenFing(obj.getVenFing());
        objVend.setVenLogin(obj.getVenLogin());
        objVend.setVenClave(obj.getVenClave());
        //Guardando cambios        
        ses.update(objVend);
        ses.beginTransaction().commit();        
        //Transaction tr = ses.beginTransaction();
        //ses.update(objCli);
        //tr.commit();                
    }
}
