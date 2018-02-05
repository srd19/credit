<%-- 
    Document   : index
    Created on : Mar 15, 2013, 4:13:19 PM
    Author     : Chinmay Patil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
    <%
    response.setHeader("Pragma","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Expires","0");
    response.setDateHeader("Expires",-1);
    %> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Shopping Center</title>
        <link rel="stylesheet" href="stylesheet.css" type="text/css"/>
    </head>
    <body>
      <div id="index">
<%

Cookie[] myCookies = request.getCookies();
String cookieName="";
String cookieValue="";
for (int i = 0; i < myCookies.length; i++) {
   Cookie cookie = myCookies[i];
    cookieName = cookie.getName();

    if((cookie.getName( )).compareTo("username") == 0 ){
           cookieValue = cookie.getValue();
           out.println(cookieValue);
         }
  }


if(null==cookieValue || cookieValue.equals(""))
{
	%><jsp:include page="header.jsp" /><%

}


else{
%>
<jsp:include page="header_user.jsp" />

<%

} %>
<jsp:include page="mycart.jsp"/>
<jsp:include page="footer.jsp"/>


</div>

    </body>
</html>
