
package Model;

import HPOJO.Clientes;
import HUtil.NewHibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class Cliente {
    //Lista de Clientes
    public List<Clientes> getClientes(){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        List<Clientes> lista = ses.createQuery("from Clientes").list();
        //List<Clientes> lista2 = ses.createCriteria(Clientes.class).list();        
        return lista;
    }
}
