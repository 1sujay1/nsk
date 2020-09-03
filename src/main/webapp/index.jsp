
 
<%@page import="com.mycompany.mycart.helper.Words"%>

<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.Dao.CatDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.Dao.ProductDao"%>


<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME</title>
       
    </head>
    <body>
       <%@include file="components/common_css_js.jsp" %>
        <%@include file="components/navbar.jsp" %>
         <% 
             String catUrl = request.getParameter("category");
                ProductDao pd =new ProductDao(FactoryProvider.getfactory());
                List<Product> products=null;
                
                if(catUrl==null || catUrl.trim().equals("all")){
                
               products =pd.getAllProducts();
             }
            else
             {
             int catUrlId= Integer.parseInt(catUrl.trim());
              products=pd.getAllProductsByCategoryId(catUrlId);
             }
                
                 CatDao cd =new CatDao(FactoryProvider.getfactory());
               List<Category> categories=cd.getCategories();
            Words w =new Words();
                %>
                <div class="container-fluid">
        <div class="row mt-3">
                <!-- All Category -->     
            <div class="col-md-2 ">
              
               
                <div class="list-group mx-3">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                      All Products
                       
                     </a>
                     <% for (Category c : categories) { %>
                     <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
                    
                
               
              <%
                }
                %>
                </div>
                
                
                
                
                
            </div>
            <!-- All Product-->  
            <div class="col-md-10">
                
               
                
                
                <div class="row mt-4">
                    <div class="col-md-12">
                       <!-- Traversing Product-->   
                       <div class="card-columns">       
                <% for (Product p : products)
                {
                %>
                <div class="card product-card">
                    
                    <div class="container text-center">
                        <img src="img/Uploaded_Products/<%= p.getpPhoto() %>" style="max-height: 200px;max-width: 100%;width: auto" class="card-img-top m-2" alt="...">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><%= p.getpName() %></h5>
                        
                        <p class="card-text"><%= w.get10words(p.getpDesc()) %></p>

                    </div>
                        <div class="card-footer text-center">
                            <button onclick="add_To_Cart(<%= p.getpId() %>,'<%= p.getpName() %>',<%= p.getPriceAfterDiscount() %>)" class="btn custom-bg text-white">Add To Cart</button>
                            <button class="btn btn-outline-success text-black"> &#8377 <%= p.getPriceAfterDiscount() %>/-<span class="text-secondary discount-label">&#8377 <%= p.getpPrice() %>,<%= p.getpDiscount()%>%off </span></button>
                        </div>
                </div>
                <% } 
                if(products.size()==0){
out.println("<h3>No Item in this Category</h3>");
}

                %>
                </div> 
                    </div>
                </div>
            </div>
        </div>
       </div>
                <%@include file="components/common_modal.jsp" %>
    </body>
</html>
