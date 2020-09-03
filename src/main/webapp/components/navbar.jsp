<%@page import="com.mycompany.mycart.Dao.CatDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.Dao.ProductDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%
User user1=(User)session.getAttribute("current-user");
%>
<% 
             String catUrl1 = request.getParameter("category");
                ProductDao pd1 =new ProductDao(FactoryProvider.getfactory());
                List<Product> products1=null;
                
                if(catUrl1==null || catUrl1.trim().equals("all")){
                
               products1 =pd1.getAllProducts();
             }
            else
             {
             int catUrlId= Integer.parseInt(catUrl1.trim());
              products1=pd1.getAllProductsByCategoryId(catUrlId);
             }
                
                 CatDao cd1 =new CatDao(FactoryProvider.getfactory());
               List<Category> categories1=cd1.getCategories();
            
                %>


<nav class="navbar navbar-expand-lg navbar-light  custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Sujay Cart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
             <% for (Category c : categories1) { %>
          <a class="dropdown-item" href="index.jsp?category=<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></a>
         
          <%
                }
                %>
        </div>
      </li>
     
    </ul>
      <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
              <a class="nav-link" data-toggle="modal" data-target="#cart" href="&#"><i class="fa fa-cart-plus" style="font-size: 25px;color: blue"></i><span class="ml-0 cart-items" style="font-size: 20px">( 0  )</span></a>
      </li>
          <% 
          if(user1==null){
              
              %>
              <li class="nav-item active" >
        <a class="nav-link text-white " href="login.jsp">Login</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link text-white" href="register.jsp">Register</a>
      </li>
              <%
              }else{
              %>
              <li class="nav-item active">
                  <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp" %>"><%= "Welcome"+" "+user1.getUserName() %> </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="logoutServlet">Logout</a>
      </li>
      <%
              }
          %>
           
      </ul>
  </div>
    </div>
</nav>