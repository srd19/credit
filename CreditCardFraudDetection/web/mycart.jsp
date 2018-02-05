<%-- 
    Document   : mycart
    Created on : Mar 25, 2013, 12:29:18 PM
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
        String id=String.valueOf(session.getAttribute("id"));
        
    String price=String.valueOf(session.getAttribute("price"));
    String image=String.valueOf(session.getAttribute("image"));
    String username=cookieValue;

    if(id.equals("null") || price.equals("null") || username.equals("null") || image.equals("null") || id.equals("") || price.equals("") || username.equals("") || image.equals("")){
        }
    else{


try
	{
    db.connect();
        int transactionid=0;
	ResultSet rs = null ;
        ResultSet rs1 = null ;
      
        ResultSet rs3 = null ;
	
        rs=db.execSQL("select count(UserID) from transactionamount where UserID='"+username+"'");
        if(rs.next()){
            if(rs.getInt(1)>0){
            transactionid=rs.getInt(1);
                 rs1=db.execSQL("select * from purchasedetails where UserID='"+username+"' and TransactionNo='"+rs.getInt(1)+"'");

                 
                 }
            else{
                rs1=db.execSQL("select * from purchasedetails where UserID='"+username+"'");
                }

            }
       
        if(rs1.next()){

        String product1id=rs1.getString("Produtc1ID");
        String product2id=rs1.getString("Produtc2ID");
        String product3id=rs1.getString("Produtc3ID");

        if(!product1id.equals("") && product2id.equals("") && product3id.equals("")){

           db.updateSQL("update purchasedetails set Produtc2ID='"+id+"', Price2='"+price+"',Image2='"+image+"' where UserID='"+username+"'");

            }
        else if(!product1id.equals("") && !product2id.equals("") && product3id.equals("")){

               db.updateSQL("update purchasedetails set Produtc3ID='"+id+"', Price3='"+price+"',Image3='"+image+"' where UserID='"+username+"'");

            }
        else if(!product1id.equals("") && !product2id.equals("") && !product3id.equals("")){

        %>
			<script type="text/javascript">
			alert("Only Three Products At A Time Is Allowed In Cart...");
			parent.location.href="call_payment.jsp";
			</script>

			<%
            }
         }
        else{

             db.updateSQL("insert into purchasedetails(UserID,Produtc1ID,Price1,Image1,Produtc2ID,Price2,Image2,Produtc3ID,Price3,Image3,TransactionNo) values ('"+username+"','"+id+"','"+price+"','"+image+"','','','','','','','1')");

}  } catch(Exception e){
            System.out.println(e);
            }

}
    session.setAttribute("image","");
session.setAttribute("price","");
session.setAttribute("id","");
%>

<table height="146" border="0">
  <%
  try{
       ResultSet rs2=null;
      db.connect();
 
           rs2=db.execSQL("select * from purchasedetails where UserID='"+username+"' order by TransactionNo");
           
            if(rs2.next()){
                 String product1id=rs2.getString("Produtc1ID");
        String product2id=rs2.getString("Produtc2ID");
        String product3id=rs2.getString("Produtc3ID");
           
     if(!product1id.equals("") && product2id.equals("") && product3id.equals("")){

           %><tr><td><p><img src="images/<%=rs2.getString("Image1")%>" width="150" height="150" /></p></td>
    <td width="295"><p>Product ID : <%=product1id%></p></td>
    <td width="301"><p>Price : <%=rs2.getString("Price1")%></p></tr><%
            }
        else if(!product1id.equals("") && !product2id.equals("") && product3id.equals("")){

              %><tr><td width="278"><p><img src="images/<%=rs2.getString("Image1")%>" width="150" height="150"/></p></td>
    <td width="295"><p>Product ID : <%=product1id%></p></td>
    <td width="301"><p>Price : <%=rs2.getString("Price1")%></p>
  </tr>
        <tr><td width="278"><p><img src="images/<%=rs2.getString("Image2")%>" width="150" height="150"/></p></td>
    <td width="295"><p>Product ID : <%=product2id%></p></td>
    <td width="301"><p>Price : <%=rs2.getString("Price2")%></p>

        </tr>
        <%
            }
        else 
       {
           %>
            <tr><td width="278"><p><img src="images/<%=rs2.getString("Image1")%>" width="150" height="150" /></p></td>
    <td width="295"><p>Product ID : <%=product1id%></p></td>
    <td width="301"><p>Price : <%=rs2.getString("Price1")%></p>
  </tr>
        <tr><td width="278"><p><img src="images/<%=rs2.getString("Image2")%>"  width="150" height="150"/></p></td>
    <td width="295"><p>Product ID : <%=product2id%></p></td>
    <td width="301"><p>Price : <%=rs2.getString("Price2")%></p>

        </tr>

          <tr><td width="278"><p><img src="images/<%=rs2.getString("Image3")%>" width="150" height="150" /></p></td>
    <td width="295"><p>Product ID : <%=product3id%></p></td>
    <td width="301"><p>Price : <%=rs2.getString("Price3")%></p>

        </tr>
<%
            }
%>
    <tr><td width="278"><p><a href="call_payment.jsp"><img src="images/buy.png"/></a></p></td>

        </tr>


<%
           
            }
else{
               %><td width="301"><p>You Don't Have Any Items In Your Cart .... </p></td><%

}
            }
           
      
        catch(Exception e){
            System.out.println(e);
            }

                
  
%>

</table>
    </body>
</html>
