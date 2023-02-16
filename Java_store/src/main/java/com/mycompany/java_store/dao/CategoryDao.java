package com.mycompany.java_store.dao;

import com.mycompany.java_store.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCat(Category cat){
        Session session = this.factory.openSession();
        Transaction tr = session.beginTransaction();
        int catId = (int) session.save(cat);
        
        tr.commit();
        session.close();
        return catId;
    }
    
    public List<Category> getCategories(){
        Session session = this.factory.openSession();
        Query q = session.createQuery("from Category ");
        List<Category> list = q.list();
        return list;
    }
    
    public Category getCategory(int cId){
        Category category = null;
        try{
            Session session = this.factory.openSession();
            category = session.get(Category.class, cId);
            session.close();
            
        } catch (Exception e){
            e.printStackTrace();
        }
        return category;
    }
}
