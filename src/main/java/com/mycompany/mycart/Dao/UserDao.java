
package com.mycompany.mycart.Dao;

import com.mycompany.mycart.entities.User;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
//get user by email and password
    public User getUserByEmailAndPassword(String email,String password){
    User user=null;
       
        try {
           String query="from User where userEmail=:e and userPassword=:p";
        Session session = this.factory.openSession();
           Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
           user = (User)q.getSingleResult();
            session.close();
            
        } catch (Exception e) {
e.printStackTrace();
        }
        return user;
    }

public List<User> getAllUsersCount(){
        Session session1 = this.factory.openSession();
        Transaction tx = session1.beginTransaction();
       org.hibernate.query.Query q1 = session1.createQuery("from User");
       List<User> userAll;
        userAll = q1.list();
        
        tx.commit();
        session1.close();
       return userAll;
}  
}
