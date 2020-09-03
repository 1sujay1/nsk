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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Portal_Products</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
            body{
                background: #e2e2e2;
            }
            
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="mt-3"><h1 class="text-center mt-6">Editing of Products are Done!!!<br>
            Thank You Sujay
            </h1></div>
        
        
    </body>
</html>
