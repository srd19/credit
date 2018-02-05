<%-- 
    Document   : password
    Created on : Apr 11, 2013, 11:30:42 AM
    Author     : Chinmay Patil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
    <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
</head>
    <body>
        <form name="pwd" action="dbConnection.jsp" method="post">

            <input type="hidden" name="frmname" value="pwd"/>
            <table align="center" width="435" height="108">

                <tr>
                    <td>Answer The Name Of Your Best Friend</td>
                    <td><span id="sprytextfield1">
                      <label>
                        <input type="text" name="txt_ans1" id="txt_ans1">
                      </label>
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                </tr>

				<tr>
                <td>Answer The Name Of Your First School</td>
                 <td><span id="sprytextfield2">
                   <label>
                     <input type="text" name="txt_ans2" id="txt_ans2">
                   </label>
                  <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                </tr>
                <tr>
                    <td height="42" colspan="2"><input style="width:75px; height:25px; margin-left: 50px;" name="submit" type="submit" value="Submit">
                    <input style="width:75px; height:25px; margin-left: 30px;" name="reset" type="reset" value="Reset">
                    </td>
                   
                </tr>

                
            </table>
        </form>
       <%
%>
    <script type="text/javascript">
<!--
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2");
//-->
    </script>
    </body>
</html>
