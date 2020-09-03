<%
User user=(User)session.getAttribute("current-user");
if(user==null){
session.setAttribute("message", "You are not logged in !!!Login First");
response.sendRedirect("login.jsp");
    return;
    }

%>



<%@include file="components/common_css_js.jsp" %>
        <%@include file="components/navbar.jsp" %>
 <%@include file="components/common_modal.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Panel</title>
    </head>
    <body>
        <div class="container">
            <div class="row mt-4">
                <div class="col-md-6">
                     <!-- inside card --> 
                     <div class="card" >
                         <h3 class="text-center my-3">Your Selected Products</h3>
                         <div class="card-body" >
                         <div class="cart-body" >
                             
                     </div>
                     </div>
                     </div>
                </div>
                <div class="col-md-6">
                   <!-- user details --> 
                   <div class="card" >
                         <h3 class="text-center my-3">Your Order Details</h3>
                         <div class="card-body" >
                             <form action="%">
                                 <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
                                 <div class="form-group">
    <label for="name">Your Name</label>
    <input name="name" value="<%= user.getUserName() %>" type="text" class="form-control" id="UserName" aria-describedby="emailHelp" placeholder="Enter Your Name">
      </div>
      <div class="form-group">
    <label for="number">Your Contact Number</label>
    <input name="phone" type="number" value="<%= user.getUserPhone() %>" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Your Mobile Number">
      </div>
                                 <div class="form-group">
    <label for="textarea">Your Shipping address</label>
    <textarea name="address" style="height: 100px" type="text" value="<%= user.getUserAddress() %>" class="form-control" id="address" aria-describedby="emailHelp" placeholder="Enter Your Address"></textarea>
      </div>
                                 
                                 <div class="container text-center">
                                     <button class="btn-outline-success">Order Now</button>
                                     <button class="btn-outline-primary">Continue Shopping</button>
                                 </div>
                                     
                             </form>
                     </div>
                     </div>
                </div>
            </div>
        </div>   
    </body>
</html>
