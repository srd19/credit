<%-- 
    Document   : payment
    Created on : Mar 15, 2013, 8:41:02 PM
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
         //  out.println(cookieValue);
         }
}String username=cookieValue;
db.connect();
        ResultSet rs = null ;
        ResultSet rs1 = null ;
int price1=0;
int price2=0;
int price3=0;
int total=0;
rs=db.execSQL("select * from purchasedetails where UserID='"+username+"' order by TransactionNo");

if(rs.next()){

   String getprice1=rs.getString("Price1");
   String getprice2=rs.getString("Price2");
   String getprice3=rs.getString("Price3");
   if(getprice1.equals("")){
       price1=0;
       }else{
       price1=Integer.parseInt(getprice1);
       }
   if(getprice2.equals("")){
       price2=0;
       }
else{
       price2=Integer.parseInt(getprice2);
       }
   if(getprice3.equals("")){
       price3=0;
       }
   else{
       price3=Integer.parseInt(getprice3);
       }
    total=price1+price2+price3;
    }


    %>
    <div id="div_product">
    <form name="frmsubmit" method="post" action="dbConnection.jsp">
        <input type="hidden" name="total" id="total" value="<%=total%>"/>
           <input type="hidden" name="frmname" id="frmname" value="frmsubmit"/>
    <table width="615">
        <tr>

            <td width="228"><p>Total Amount : <%=total%></p></td>
        </tr>

        <tr>
            <td>Card Holder Name</td>
            <td width="375"><span id="sprytextfield1">
              <label>
                <input type="text" name="cardholdername" id="cardholdername">
              </label>
            <span class="textfieldRequiredMsg">A value is required.</span></span></td>
        </tr>
        <tr>
            <td>Card Number</td>
            <td><span id="sprytextfield2">
            <label>
              <input type="text" name="cardno1" id="cardno1" style="width:40px;">
            </label>
            <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span>
              <span id="sprytextfield3">
              <label>
                <input type="text" name="cardno2" id="cardno2" style="width:40px;">
              </label>
              <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span><span id="sprytextfield4">
              <label>
                <input type="text" name="cardno3" id="cardno3" style="width:40px;">
              </label>
              <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span><span id="sprytextfield5">
              <label>
                <input type="text" name="cardno4" id="cardno4" style="width:40px;">
              </label>
              <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span></td>
        </tr>
            <tr>
            <td>CCV Number</td>
            <td><span id="sprytextfield6">
            <label>
              <input type="text" name="ccvno" id="ccvno" style="width:40px;">
            </label>
            <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span></td>
        </tr>
         
            <tr>
            <td>Expiry Date</td>
            <td>
                <select name="month" id="month">
                    <option value="01">01</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                 </select>
                    <select name="year" id="year">
                    <option value="2013">2013</option>
                    <option value="2014">2014</option>
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                 </select>
            </td>
        <tr>
          <td height="51" colspan="2"><input style="width:75px; height:25px; margin-left:100px;" name="submit" type="submit" value="Submit">  <input style="width:75px; height:25px; margin-left:35px;" name="reset" type="reset" value="Reset"></td>
      </tr>
      
    </table>
    </form>
    </div>
    <script type="text/javascript">
<!--
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "none", {validateOn:["blur"]});
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "integer", {minChars:4, maxChars:4, validateOn:["blur"]});
var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "integer", {minChars:4, maxChars:4, validateOn:["blur"]});
var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "integer", {minChars:4, maxChars:4, validateOn:["blur"]});
var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "integer", {minChars:4, maxChars:4, validateOn:["blur"]});
var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "integer", {minChars:3, maxChars:3, validateOn:["blur"]});
//-->
    </script>
    </body>
</html>
