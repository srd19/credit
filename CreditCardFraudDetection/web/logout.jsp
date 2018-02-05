<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <%  
    response.setHeader("Pragma","no-cache");  
    response.setHeader("Cache-Control","no-store");  
    response.setHeader("Expires","0");  
    response.setDateHeader("Expires",-1);  
    %>  

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
    <%
    try{

   Cookie[] cookies = null;
   // Get an array of Cookies associated with this domain
   cookies = request.getCookies();
   if( cookies != null ){
     
      for (int i = 0; i < cookies.length; i++){
         cookies[i].setMaxAge(0);
                cookies[i].setValue(null);

                response.addCookie(cookies[i]);
            System.out.println("Deleted cookie: " +cookies[i].getName( ) + "<br/>");
         }
response.sendRedirect("call_login.jsp");
}}
    catch(Exception e){
        e.printStackTrace();
        }
%>
</body>
</html>