package com.mycompany.java_store.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Nums {
    public static Map<String, Long> nums(SessionFactory factory){
        Session session = factory.openSession();
        String s1 = "select count(*) from User";
        String s2 = "select count(*) from Product";
        
        Query q1 = session.createQuery(s1);
        Query q2 = session.createQuery(s2);
        
        Long userNum = (Long) q1.list().get(0);
        Long prodNum = (Long) q2.list().get(0);
        
        Map<String, Long> map = new HashMap<>();
        map.put("userNum", userNum);
        map.put("prodNum", prodNum); 
        
        session.close();
        return map;
    }
}
