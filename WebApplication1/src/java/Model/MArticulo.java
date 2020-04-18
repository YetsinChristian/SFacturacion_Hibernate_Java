
package Model;

import HPOJO.Articulos;
import HUtil.NewHibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class MArticulo {
    public List<Articulos> getArticulo(){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        List<Articulos> lista = ses.createCriteria(Articulos.class).list();
        ses.close();
        return lista;
    }
}
