package Model;

import HPOJO.Clientes;
import HUtil.NewHibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class MCliente {
    //Lista de Clientes
    public List<Clientes> getCliente(){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        List<Clientes> lista = ses.createQuery("from Clientes").list();
        //List<Clientes> lista2 = ses.createCriteria(Clientes.class).list();        
        return lista;
    }
    //Guardar Cliente
    public void saveCliente(Clientes obj){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tr = ses.beginTransaction();
        ses.save(obj);
        tr.commit();
    }
    //Eliminar Cliente
    public void deleteCliente(Clientes obj){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        //Obtener objetoCliente de la lista que ofrece la clase Clientes
        Clientes cli = (Clientes)ses.get(Clientes.class, obj.getCliCod());            
        //Primera manera de eliminar el objeto encontrado
        Transaction tr = ses.beginTransaction();
        ses.delete(cli);
        tr.commit();
        //Segunda manera
        ////ses.delete(cli);
        ////ses.beginTransaction().commit();                                    
    }
    //Buscar un Cliente
    public Clientes findCliente(Clientes obj){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        Clientes objCliente = (Clientes)ses.get(Clientes.class, obj.getCliCod());
        return objCliente;
    }
    //Actualizar un Cliente
    public void updateCliente(Clientes obj){        
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        //Buscando al objeto Cliente
        Clientes objCli = (Clientes)ses.get(Clientes.class, obj.getCliCod());
        //Actualizado atributos del objeto Cliente encontrado
        objCli.setCliNom(obj.getCliNom());
        objCli.setCliTel(obj.getCliTel());
        objCli.setCliCor(obj.getCliCor());
        objCli.setCliDir(obj.getCliDir());
        objCli.setCliCre(obj.getCliCre());
        //Guardando cambios        
        ses.update(objCli);
        ses.beginTransaction().commit();        
        //Transaction tr = ses.beginTransaction();
        //ses.update(objCli);
        //tr.commit();                
    }
}
