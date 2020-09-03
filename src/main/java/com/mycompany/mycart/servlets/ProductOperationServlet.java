
package com.mycompany.mycart.servlets;

import com.mycompany.mycart.Dao.CatDao;
import com.mycompany.mycart.Dao.ProductDao;
import com.mycompany.mycart.entities.Category;
import com.mycompany.mycart.entities.Product;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            try {
                
                String op = request.getParameter("operation");
                if(op.trim().equals("addCategory")){
                    
                 //add category
                 String catTitle = request.getParameter("catTitle");
                String catDesc = request.getParameter("catDesc");
                   Category category=new Category();
                   category.setCategoryTitle(catTitle);
                   category.setCategoryDescription(catDesc);
                   
                    CatDao dao= new CatDao(FactoryProvider.getfactory());
                    int catId=dao.saveCategory(category);
                    HttpSession session = request.getSession();
                   session.setAttribute("message", "Category added Successfully!!! "+catId);
                   response.sendRedirect("admin.jsp");
                   return;
                }else if(op.trim().equals("addProduct")){
                    
                   //add product 
                    String pName = request.getParameter("pTitle");
                    String pDesc = request.getParameter("pDesc");
                    int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                    int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                    int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                    int catId = Integer.parseInt(request.getParameter("catId"));
                    Part part=request.getPart("pPhoto");
                    
                    Product prod = new Product();
                    prod.setpName(pName);
                    prod.setpDesc(pDesc);
                    prod.setpPrice(pPrice);
                    prod.setpDiscount(pDiscount);
                    prod.setpQuantity(pQuantity);
                    prod.setpPhoto(part.getSubmittedFileName());
                    
                  //get category object
                            CatDao cd =new CatDao(FactoryProvider.getfactory());
                            Category cat=cd.getCategoryById(catId);
                       prod.setCategory(cat);
                       //save product
                       ProductDao pDao= new ProductDao(FactoryProvider.getfactory());
                       pDao.saveProduct(prod);
                       
                       //pic upload
                       //find a path to upload photo
                       String path=request.getRealPath("img") + File.separator + "Uploaded_Products" + File.separator + part.getSubmittedFileName();
                       //System.out.println(path);
                    try {
                        
                    //file write
                       FileOutputStream fos =new FileOutputStream(path);
                       //get image
                       InputStream is = part.getInputStream();
                       byte[] data = new byte[is.available()];
                        is.read(data);
                        fos.write(data);
                        fos.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                    }
                      
                    
                       HttpSession session = request.getSession();
                   session.setAttribute("message", "Product is  added Successfully... ");
                   response.sendRedirect("admin.jsp");
                   return;
                }
                
                
             
            } catch (Exception e) {
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
