package com.mycompany.java_store.dao;

import com.mycompany.java_store.entities.Product;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public boolean saveProduct(Product product){
        boolean saved = false;
        try{
            
            Session session = this.factory.openSession();
            Transaction tr = session.beginTransaction();
            
            session.save(product);
            
            tr.commit();
            session.close();
            saved = true;
            
        } catch (Exception e){
            e.printStackTrace();
            saved = false;
        }
        return saved;
    }
    
    public List<Product> getAll(){
        Session session = this.factory.openSession();
        Query q = session.createQuery("from Product");
        List<Product> list = q.list();
        
        return list;
    }
    
    public List<Product> getProdByCat(int catId){
        Session session = this.factory.openSession();
        Query q = session.createQuery("from Product as p where p.category.categoryId =: id");
        q.setParameter("id", catId);
        List<Product> list = q.list();
        
        return list;
    }
}
