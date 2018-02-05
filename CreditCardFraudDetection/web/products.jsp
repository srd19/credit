<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<link rel="stylesheet" href="stylesheet.css" type="text/css"/>
<body>
            <jsp:useBean id="db" class="dal.clsdal" scope="request"/>
<jsp:setProperty property="*" name="db"/>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*;" %>
    <%
    Cookie[] myCookies = request.getCookies();
String cookieName="";
String cookieValue="";
for (int i = 0; i < myCookies.length; i++) {
   Cookie cookie = myCookies[i];
    cookieName = cookie.getName();

    if((cookie.getName()).compareTo("username") == 0 ){
           cookieValue = cookie.getValue();
           out.println(cookieValue);
         }
}

    

%>
<div id="div_product">

<table width="888" height="146" border="0">
  <tr>
    <td width="278"><p><img src="images/bags.jpg" width="300" height="250" /></p>
        <p align="center">Product ID : 1  <br/> <a href="call_moredetails.jsp?id=1">more details</a></p></td>
    <td width="295"><p><img src="images/kids toy.png" width="300" height="250" /></p>
      <p align="center">Product ID : 2  <br/> <a href="call_moredetails.jsp?id=2">more details</a></p></td>
    <td width="301"><p><img src="images/women-clothes.jpg" alt="" width="300" height="250"  /></p>
      <p align="center">Product ID : 3  <br/>
        <a href="call_moredetails.jsp?id=3">more details</a></p></td>
  </tr>
   <tr>
    <td width="278"><p><img src="images/ring.png" width="300" height="250" /></p>
      <p align="center">Product ID : 4 <br/><a href="call_moredetails.jsp?id=4">more details</a></p></td>
    <td width="295"><p><img src="images/clotheskids.png" width="300" height="250" /></p>
      <p align="center">Product ID : 5 <br/> <a href="call_moredetails.jsp?id=5">more details</a></p></td>
    <td width="301"><p><img src="images/tshirt boy.png" width="300" height="250"  /></p>
      <p align="center">Product ID : 6 <br/> <a href="call_moredetails.jsp?id=6">more details</a></p></td>
  </tr>
   <tr>
    <td width="278"><p><img src="images/blazer.jpg" width="300" height="250" /></p>
      <p align="center">Product ID : 7  <br/> <a href="call_moredetails.jsp?id=7">more details</a></p></td>
    <td width="295"><p><img src="images/shoes.png" width="300" height="250" /></p>
      <p align="center">Product ID : 8  <br/><a href="call_moredetails.jsp?id=8">more details</a></p></td>
    <td width="301"><p><img src="images/mens-watches.jpg" width="300" height="250" /></p>
      <p align="center">Product ID : 9  <br/><a href="call_moredetails.jsp?id=9">more details</a></p></td>
  </tr>
</table>

</div>
</body>
</html>