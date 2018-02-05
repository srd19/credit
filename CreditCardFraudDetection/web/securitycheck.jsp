<%-- 
    Document   : mail
    Created on : Apr 11, 2013, 5:21:42 PM
    Author     : Chinmay Patil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form name="vericode" action="dbConnection.jsp" method="post">

            <input type="hidden" name="frmname" value="vericode"/>
            <table align="center" width="435" height="108">

                <tr>
                    <td>Verification Code</td>
                    <td><input type="text" name="vericode" /></td>
                </tr>
                
                <tr>
                    <td height="42" colspan="2"><input style="width:75px; height:25px; margin-left: 50px;" name="submit" type="submit" value="Send Mail">
                        </td>

                </tr>


            </table>
        </form>
    </body>
</html>
