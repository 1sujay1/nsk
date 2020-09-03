
package com.mycompany.mycart.Dao;

import com.mycompany.mycart.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CatDao {
   private SessionFactory factory;

    public CatDao(SessionFactory factory) {
        this.factory = factory;
    }
    //save category to database
   public int saveCategory(Category category){
       Session session = this.factory.openSession();
       Transaction tx = session.beginTransaction();
       
       int catId=(int) session.save(category);
        
       tx.commit();        
       session.close();
               return catId;
   }
   public List<Category> getCategories(){
       Session s = this.factory.openSession();
       Transaction t = s.beginTransaction();
       
       
       Query query = s.createQuery("from Category");
       List<Category> cat =query.list();
       
       t.commit();
       s.close();
       return cat;
   }
   public Category getCategoryById(int catId){
       Session ss = this.factory.openSession();
       Category cat=null;
       try {
           
           cat = ss.get(Category.class, catId);
           ss.close();
       } catch (Exception e) {
       e.printStackTrace();
       }
       
       return cat;
       
   }
}
