<%@page import="com.mycompany.mycart.Dao.UserDao"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.Dao.ProductDao"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.Dao.CatDao"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%@include file="components/common_modal.jsp" %>
 
<%
User user=(User)session.getAttribute("current-user");
if(user==null){
session.setAttribute("message", "You are not logged in !!!Login First");
response.sendRedirect("login.jsp");
    return;
    }else if(user.getUserType().equals("normal")){
    session.setAttribute("message", "You are not admin! !!Do not access this page");
    response.sendRedirect("login.jsp");
    return;
    }
%>
<!--calling all Categories-->
              
               <% 
               CatDao cd =new CatDao(FactoryProvider.getfactory());
               List<Category> allCat = cd.getCategories();
               ProductDao pd =new ProductDao(FactoryProvider.getfactory());
               List<Product> allProd=pd.getAllProducts();
               UserDao ud=new UserDao(FactoryProvider.getfactory());
               List<User> userAll=ud.getAllUsersCount();
               %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Portal</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
            body{
                background: #e2e2e2;
            }
            
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="message.jsp" %>
            </div>
            <div class="row">
                
                <div class="col-md-4">
                    <div class="card mt-3" data-toggle="tooltip" data-placement="left" title=" Total Number of Users Registered in this E-Commeerce website">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px" src="img/sport-team.png" class="img-fluid rounded-circle" alt="user_icon">
                            </div>
                            <h1><%= userAll.size() %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mt-3" data-toggle="tooltip" data-placement="bottom" title="Total Number of Categories present in this website">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px" src="img/list.png" class="img-fluid rounded-circle" alt="user_icon">
                            </div>
                                                       <h1><%= allCat.size() %></h1>
                                                       <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4" data-toggle="tooltip" data-placement="right" title="Number of Products present in this E-Commeerce website">
                    <div class="card mt-3 text-center">
                        <div class="card-body ">
                            <div class="container">
                                <img style="max-width: 150px" src="img/product.png" class="img-fluid rounded-circle" alt="user_icon">
                            </div>
                             
                             <h1><%= allProd.size() %></h1>
                             <h1  class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
                </div>
                <!-- second row-->
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="card mt-3" data-toggle="modal" data-target="#add-category">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px" src="img/calculator.png" class="img-fluid rounded-circle" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here to add new Category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                    <div class="col-md-6">
                    <div class="card mt-3" data-toggle="modal" data-target="#add-product">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px" src="img/add.png" class="img-fluid rounded-circle" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                </div>
                    
                </div>
                <!--Edit products-->
                <div class="row mt-3">
                    <div class="col-md-12">
                        <div onclick="window.location='viewProducts.jsp'" class="card mt-3">
                        <div class="card-body text-center" data-toggle="tooltip" data-placement="top" title=" Clickk here to view all the products in this website">
                            <div class="container">
                                <img style="max-width: 150px" src="img/search.png" class="img-fluid rounded-circle" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here to view all the Products</p>
                            <h1 class="text-uppercase text-muted">Edit Products</h1>
                        </div>
                    </div>
                </div>
                    
                </div>
                </div>
            </div>
        </div>
        
        <!--add category modal-->
  
<!-- Modal -->
<div class="modal fade" id="add-category" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header custom-bg  text-white">
        <h5 class="modal-title " id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
          <!--Category form-->
          
          <form action="ProductOperationServlet" method="post">
              <input type="hidden" name="operation" value="addCategory"/>
              <div class="form-group">
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
              </div>
              
              <div class="form-group">
                  <textarea style="height: 150px" type="text" class="form-control" name="catDesc" placeholder="Enter Category Description" required/></textarea>
              </div>
              
              <div class="container text-center">
                  <button type="submit" class="btn btn-outline-success">Add Category</button>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div> 
              
          </form>
     
    </div>
  </div>
</div>
    </div>
     <!--end category modal-->
     
      <!--add product modal-->
      <div class="modal fade" id="add-product" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header custom-bg  text-white">
        <h5 class="modal-title " id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
                          <!--product form-->
          
                          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
              <input type="hidden" name="operation" value="addProduct"/>
              <div class="form-group">
                  <input type="text" class="form-control" name="pTitle" placeholder="Enter Title of Product" required/>
              </div>
              
              <div class="form-group">
                  <textarea style="height: 150px" type="text" class="form-control" name="pDesc" placeholder="Enter Product Description" required/></textarea>
              </div>
              <div class="form-group">
                  <input  type="number" class="form-control" name="pPrice" placeholder="Enter Price of Product" required/>
              </div>
              <div class="form-group">
                  <input  type="number" class="form-control" name="pDiscount" placeholder="Enter Poduct Discount" required/>
              </div>
              <div class="form-group">
                  <input  type="number" class="form-control" name="pQuantity" placeholder="Enter Poduct Quantity" required/>
              </div>
              
              
               
               <div class="form-group">
                   <select name="catId" class="form-control">
                      
                      <%  
                      for(Category c:allCat){
                                       
                      %>
                      
                      <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                        
                      <% } %>     
                           
                  </select>
              </div>
               
               
              <div class="form-group">
                  <label for="pPhoto">Select Picture of Product</label>
                  <br>
                  <input  type="file" id="pPhoto" class="form-control" name="pPhoto" required/>
              </div>
              
             
              
              <div class="container text-center">
                  <button type="submit" class="btn btn-outline-success">Add Product</button>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div> 
              
          </form>
     
    </div>
  </div>
</div>
    </div>
      
       <!--end category modal-->
       <script>
           $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
       </script>
    </body>
</html>
