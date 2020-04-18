
package Model;

import HPOJO.FacCabe;
import HPOJO.FacDeta;
import HUtil.NewHibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class MFactura {
    //Obtener la lista de facturas
    public List<FacCabe> getFacturas(){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        List<FacCabe> lista = ses.createCriteria(FacCabe.class).list();        
        return lista;
    }
    
    //Consulta para obtener el ultimo registro
    public int topFactura(){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();                
        //Variable que almacena el ultimo registro
        int top;    
        //Metodo para obtener objeto del ultimo registro a traves de una consulta        
        Criteria c = ses.createCriteria(FacCabe.class);
        c.addOrder(Order.desc("facNum"));
        c.setMaxResults(1);
        FacCabe fc = (FacCabe)c.uniqueResult();        
        try{
            top=fc.getFacNum();    
        }catch(NullPointerException e){
            top=10000;
        }                
        ses.close();
        return top+1;
    }
    //Guardar factura
    public void saveFactura(FacCabe obj){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        ses.save(obj);
        ses.beginTransaction().commit();
        ses.close();
    }
    //Guardar detalle de la factura
    public void saveDetalleFactura(List<FacDeta> list){
        for(FacDeta bean : list){
            //Obteniendo la ultima factura registrada
            FacCabe bean1 = new FacCabe();
            bean1.setFacNum(topFactura()-1);
            //Procedimiento para guardar el objeto detalle
            SessionFactory sf = NewHibernateUtil.getSessionFactory();
            Session ses = sf.openSession();
            FacDeta objDetalle = new FacDeta();
            objDetalle.setFacCabe(bean1);            
            objDetalle.setArticulos(bean.getArticulos());
            objDetalle.setArtCan(bean.getArtCan());
            objDetalle.setPrecioArt(bean.getPrecioArt());
            ses.save(objDetalle);
            ses.beginTransaction().commit();
            ses.close();
        }        
    }
    //Buscar un objeto factura
    public FacCabe findFactura(FacCabe obj){        
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        FacCabe bean = (FacCabe)ses.get(FacCabe.class, obj.getFacNum());        
        return bean;
    }
    //Obtener la lista de detalle de un objeto factura
    public List<FacDeta> findFacturaDetalle(FacCabe obj){
        SessionFactory sf = NewHibernateUtil.getSessionFactory();
        Session ses = sf.openSession();
        Query qry = ses.createQuery("from FacDeta where facCabe=?");
        qry.setInteger(0, obj.getFacNum());
        List<FacDeta> lista = qry.list();
        return lista;
    }
}
