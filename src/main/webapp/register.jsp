
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User Registration</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/common_css_js.jsp" %>
       
        <div class="container-fluid">
             <div class="row mt-1" >
            <div class="col-md-5 offset-md-3" >
                <div class="card">
                     <%@include file="message.jsp" %>
                    <div class="card-body px-5">
                         <h3 class="text-center my-3">Sign Up Here</h3>
                         <form action="RegisterServlet" method="post">
                             <div class="container-fluid text-center ">
   
                                 <img style="max-width: 150px" src="img/registration.png" class="img-fluid " />
  </div>
                    <div class="form-group">
    <label for="name">User Name</label>
    <input type="text" name="user_name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Here">
  </div>
                    <div class="form-group">
    <label for="email">User Email</label>
    <input type="email" name="user_email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Here">
  </div>
                    <div class="form-group">
    <label for="password">User Password</label>
    <input type="password" name="user_password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Here">
  </div>
                    <div class="form-group">
    <label for="phone">User Phone Number</label>
    <input type="number" name="user_phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Here">
  </div>
                    <div class="form-group">
    <label for="name">User Address</label>
    <textarea style="height: 100px" name="user_address" class="form-control" placeholder="Enter your Address here"></textarea>
  </div>
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Register</button>
                        <button class="btn btn-outline-warning">Reset</button>
                    </div>
                </form>
                    </div>
                </div>
            </div>
            
        </div>
        </div>
    </body>
</html>
