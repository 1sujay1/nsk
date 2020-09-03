
package com.mycompany.mycart.Dao;

import com.mycompany.mycart.entities.Product;
import java.util.List;
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
        boolean f =false;
        try {
            
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
            
             tx.commit();
          
            session.close();
           f =true;
            
        } catch (Exception e) {
                e.printStackTrace();
        f= false;
        }
        
    return f;
    }
    //get all products
    public List<Product> getAllProducts(){
        Session session2 = this.factory.openSession();
        Transaction tx2 = session2.beginTransaction();
        Query q2=session2.createQuery("from Product");
        List<Product> products=q2.list();
        
        
        tx2.commit();
        session2.close();
        return products;
    }
    //get products by category
    public List<Product> getAllProductsByCategoryId(int cId){
        Session session2 = this.factory.openSession();
        Transaction tx2 = session2.beginTransaction();
        Query q2=session2.createQuery("from Product as p where p.category.categoryId=:id");
        q2.setParameter("id",cId );
        List<Product> products=q2.list();
        
        
        tx2.commit();
        session2.close();
        return products;
    }
}
