
package com.mycompany.mycart.servlets;

import com.mycompany.mycart.Dao.UserDao;
import com.mycompany.mycart.entities.User;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class loginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            try {
                //coding here
                String email=request.getParameter("email");
                String password=request.getParameter("password");
                
                UserDao Userdao =new UserDao(FactoryProvider.getfactory());
                User user=(User)Userdao.getUserByEmailAndPassword(email, password);
                HttpSession session = request.getSession();
                if(user==null){
                   
                session.setAttribute("message", "Invalid details!!! Try with another one");
                response.sendRedirect("login.jsp");
                return; 
             
                }
                else{
                    
                    out.println("<h1> Welcome "+user.getUserName()+" </h1>");
                    session.setAttribute("current-user", user);
                    //admin 
                    if(user.getUserType().equals("admin")){
                        response.sendRedirect("admin.jsp");
                    }//normal
                    else if(user.getUserType().equals("normal")){
                        response.sendRedirect("normal.jsp");
                    }
                    //unidentified
                    else{
                        out.println("We have not identified User Type");
                }
            }
            }catch (Exception e) {
            e.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
