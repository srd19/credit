<%-- 
    Document   : dbConnection
    Created on : Mar 15, 2013, 8:47:09 PM
    Author     : Chinmay Patil
--%>


<%@page import="be.ac.ulg.montefiore.run.jahmm.Vdescrete"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="dal.GMailSender"%>
<%@page import="java.math.BigInteger"%>
<%@page import="src.be.ac.ulg.montefiore.run.jahmm.test.NewClass1"%>
<%@page import="src.be.ac.ulg.montefiore.run.jahmm.test.NewClass1.*"%>
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
<%@ page import="java.io.IOException.*" %>
<%@ page import="src.be.ac.ulg.montefiore.run.jahmm.*" %>
<%@ page import="src.be.ac.ulg.montefiore.run.jahmm.draw.GenericHmmDrawerDot" %>
<%@ page import="src.be.ac.ulg.montefiore.run.jahmm.learn.BaumWelchLearner" %>
<%@ page import="src.be.ac.ulg.montefiore.run.jahmm.learn.BaumWelchLearner" %>
<%@ page import="src.be.ac.ulg.montefiore.run.jahmm.toolbox.KullbackLeiblerDistanceCalculator" %>
<%@ page import="src.be.ac.ulg.montefiore.run.jahmm.toolbox.MarkovGenerator" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="dal.KMean"%>

<%
 class abc{
public Hmm<ObservationDiscrete<Packet>> learntHmm ;
   public Hmm<ObservationDiscrete<Packet>> hmm ;
}
try
	{
    abc ojj=new abc();
	ResultSet rs = null ;
        ResultSet rs4 = null ;
	//ResultSetMetaData rmd = null ;
	db.connect();
	// to get the name of from
	String fromname=request.getParameter("frmname");

	String buttonname=request.getParameter("button");

	//login from code
	if(fromname.equals("frmlogin"))
	{

		String username1=request.getParameter("txtuserid");
		String password=request.getParameter("txt_password");
		rs=db.execSQL("select * from customerdetails where UserID ='"+username1+"' and Password ='"+password+"'");
		if(rs.next())
		{

                    session.setAttribute("username", username1);
                        // Create cookies for first and last names.
                    
                       Cookie username = new Cookie("username",username1);
                     

                       // Set expiry date after 24 Hrs for both the cookies.
                    
                       username.setMaxAge(60*60*24);

                       // Add both the cookies in the response header.
                       response.addCookie(username);
                     
			response.sendRedirect("call_products.jsp");
			//}
		}
		else
		{
			%>
			<script type="text/javascript">
			alert("UserName or Password Error...");
			parent.location.href="call_login.jsp";
			</script>

			<%
		}
	}
	else if(fromname.equals("frmregister"))
	{


            	String txtuserid=request.getParameter("txtuserid");

                rs=db.execSQL("select * from customerdetails where UserID='"+txtuserid+"'");
                if(rs.next()){
            %>
			<script type="text/javascript">
			alert("User Already Registered ... Try Other UserID");
			parent.location.href="call_login.jsp";
			</script>

			<%
                    }
		String txt_password=request.getParameter("txt_password");
		String txt_username=request.getParameter("txt_username");
		String txt_address=request.getParameter("txt_address");
		String txt_contactno=request.getParameter("txt_contactno");
                String txt_dob=request.getParameter("inputField");
		String txt_emailid=request.getParameter("txt_emailid");
		String secquest1=request.getParameter("txt_securityans1");
                String secquest2=request.getParameter("txt_securityans2");

            String name=request.getParameter("cardholdername");
            String cardno1=request.getParameter("cardno1");
            String cardno2=request.getParameter("cardno2");
            String cardno3=request.getParameter("cardno3");
            String cardno4=request.getParameter("cardno4");
            String ccvno=request.getParameter("ccvno");
            String month=request.getParameter("month");
            String year=request.getParameter("year");

	db.updateSQL("insert into customerdetails(UserID,Password,UserName,Address,ContactNo,DOB,EmailID,SecurityAnswer1,SecurityAnswer2,CreditCardNo1,CreditCardNo2,CreditCardNo3,CreditCardNo4,CCVNo,CardHolderName,ExpiryMonth,ExpiryYear) values ('"+txtuserid+"','"+txt_password+"','"+txt_username+"','"+txt_address+"','"+txt_contactno+"','"+txt_dob+"','"+txt_emailid+"','"+secquest1+"','"+secquest2+"','"+cardno1+"','"+cardno2+"','"+cardno3+"','"+cardno4+"','"+ccvno+"','"+name+"','"+month+"','"+year+"')");

			%>
			<script type="text/javascript">
			alert("User Registered Successfully...You can Now Login");
			parent.location.href="call_login.jsp";
			</script>

			<%

	}

else if(fromname.equals("frmsubmit")){
NewClass1 obj=new NewClass1();
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
     
    String username=cookieValue;

            int[] amounts=new int[15];
            int total=Integer.parseInt(request.getParameter("total"));
            session.setAttribute("total", total);
            String name=request.getParameter("cardholdername");
            String cardno1=request.getParameter("cardno1");
            String cardno2=request.getParameter("cardno2");
            String cardno3=request.getParameter("cardno3");
            String cardno4=request.getParameter("cardno4");
            String ccvno=request.getParameter("ccvno");
            String month=request.getParameter("month");
            String year=request.getParameter("year");


            ResultSet check=null;
            check=db.execSQL("select * from customerdetails where UserID='"+username+"' and CreditCardNo1='"+cardno1+"' and CreditCardNo2='"+cardno2+"' and CreditCardNo3='"+cardno3+"' and CreditCardNo4='"+cardno4+"' and CCVNo='"+ccvno+"' and CardHolderName='"+name+"' and ExpiryMonth='"+month+"' and ExpiryYear='"+year+"'");
           
            if(check.next()){
                
              int transactionid=0;
              ResultSet rs3 = null ;

        rs3=db.execSQL("select * from transactionamount where UserID='"+username+"'");
        if(rs3.next()){
            transactionid=rs3.getInt("countno");
            if(transactionid!=0){

                if(transactionid==14){
                    
                 db.updateSQL("update transactionamount set Amount15="+total+", countno=15 where UserID='"+username+"'");

rs4=db.execSQL("select * from transactionamount where UserID='"+username+"'");
        if(rs4.next()){
            amounts[0]=rs4.getInt("Amount1");
             amounts[1]=rs4.getInt("Amount2");
            amounts[2]=rs4.getInt("Amount3");
              amounts[3]=rs4.getInt("Amount4");
            amounts[4]=rs4.getInt("Amount5");
               amounts[5]=rs4.getInt("Amount6");
              amounts[6]=rs4.getInt("Amount7");
            amounts[7]=rs4.getInt("Amount8");
            amounts[8]=rs4.getInt("Amount9");
             amounts[9]=rs4.getInt("Amount10");
            amounts[10]=rs4.getInt("Amount11");
            amounts[11]=rs4.getInt("Amount12");
             amounts[12]=rs4.getInt("Amount13");
            amounts[13]=rs4.getInt("Amount14");
             amounts[14]=rs4.getInt("Amount15");


        

}

              KMean mc=new KMean();
		mc.input(3, 15, amounts);
		mc.separate();
                String[] observationsequence=new String[15];
                  db.updateSQL("insert into kmeans(UserID,LowMean,MediumMean,HighMean)values('"+username+"','"+mc.meanlow+"','"+mc.meanmedium+"','"+mc.meanhigh+"')") ;

                for(int i=0;i<amounts.length;i++){

                    if(mc.clusterlow.contains(amounts[i])){

                        observationsequence[i]="l";

                        }
                    else if(mc.clustermedium.contains(amounts[i])){

                        observationsequence[i]="m";
                        }
                    else if(mc.clusterhigh.contains(amounts[i])){

                        observationsequence[i]="h";
                        }
                    }

        db.updateSQL("insert into observationsequence(UserID,OS1,OS2,OS3,OS4,OS5,OS6,OS7,OS8,OS9,OS10,OS11,OS12,OS13,OS14,OS15)values('"+username+"','"+observationsequence[0]+"','"+observationsequence[1]+"','"+observationsequence[2]+"','"+observationsequence[3]+"','"+observationsequence[4]+"','"+observationsequence[5]+"','"+observationsequence[6]+"','"+observationsequence[7]+"','"+observationsequence[8]+"','"+observationsequence[9]+"','"+observationsequence[10]+"','"+observationsequence[11]+"','"+observationsequence[12]+"','"+observationsequence[13]+"','"+observationsequence[14]+"')") ;
        String[] prob=new String[2];
         if(mc.clusterlow.size()>mc.clusterhigh.size() && mc.clusterlow.size()>mc.clustermedium.size()){
                prob[0]="l";
            }
        else if(mc.clustermedium.size()>mc.clusterhigh.size() && mc.clustermedium.size()>mc.clusterlow.size()){
                 prob[0]="m";
            }
         else if(mc.clusterhigh.size()>mc.clustermedium.size() && mc.clusterhigh.size()>mc.clusterlow.size()){
                 prob[0]="h";
            }
        else if(mc.clusterlow.size()==mc.clustermedium.size())
            {
                prob[0]="l";
            }
        else if(mc.clusterlow.size()==mc.clusterhigh.size())
            {
                prob[0]="l";
            }
        else if(mc.clustermedium.size()==mc.clusterhigh.size())
            {
                prob[0]="m";
            }
       
        
 int a=mc.clusterlow.size();
int b=mc.clustermedium.size();
int c=mc.clusterhigh.size();
      //add cookie to prob as we need to send it to main
      prob[1]=cookieValue;
      out.println(prob[1]);
      obj.main(prob,a,b,c);
       
       ojj.hmm=obj.hmm;
       ojj.learntHmm=obj.learntHmm;
     
       
         db.updateSQL("delete from purchasedetails where UserID='"+username+"'");
        	%>
			<script type="text/javascript">
			alert("Transaction Completed ....");
			parent.location.href="call_products.jsp";
			</script>

			<%

                    }
                
                else if(transactionid==15){

 String[] prob1=new String[2];
                    String prob="";
                String[] arr_os=new String[15];
                int k11=0,k1=0,k2=0;
                     String[] arr_new_os=new String[15];
             rs = db.execSQL("select * from observationsequence where UserID='"+username+"'");
            if(rs.next()){
                for(int i=3;i<18;i++){

                    String getprob=rs.getString(i);
                    if(getprob.equals("l")){
                        k11++;
                        }
                   else if(getprob.equals("m")){
                    k1++;    
                    }
                    else{
                        k2++;
                        }
                    }

                if(k11>k1 && k11>k2){

                    prob1[0]="l";
                    }
                else if(k2>k11 && k2>k1){
                    prob1[0]="h";
                    }
                else{
                    prob1[0]="m";
                    
                    }
                for(int i=3,k=0;i<18;i++,k++){

                    arr_os[k]=rs.getString(i);
                    }
                }
                    
                rs=db.execSQL("select * from KMeans where UserID='"+username+"'");
                if(rs.next()){

                 
                      
                   if(total<rs.getInt(3) ){

                    prob="l";
                       }
                    else if(total>rs.getInt(5)){

                       prob="h";
                     }
                   else {

                        int mid1=(rs.getInt(3)+rs.getInt(4))/2;
                        int mid2=(rs.getInt(4)+rs.getInt(5))/2;
                        if(total>mid1 && total<rs.getInt(4)){
                            prob="m";
                            }
                        else if(total<mid1){
                            prob="l";
                            }
                        else if(total>rs.getInt(4) && total<mid2){
                            prob="m";
                            }
                        else if(total>mid2){
                        prob="h";

                        }
                     }
                 }
                 System.out.println("prob "+prob);
                for(int i=0;i<arr_os.length;i++){

                    if(i==14){

                        arr_new_os[i]=prob;
                        }
                    else{
                arr_new_os[i]=arr_os[i+1];
                }
                    
                    }
                
                 rs=db.execSQL("select * from transactionamount where UserID='"+username+"'");
                        if(rs.next()){

                        for(int i=0,k=3;i<amounts.length;i++,k++){

                            
                            if(i==amounts.length-1){

                                amounts[i]=total;
                                }else{
                            amounts[i]=rs.getInt(k);
                            }
                            }
                            }
           
                        
                        
 rs4=db.execSQL("select * from transactionamount where UserID='"+username+"'");
        if(rs4.next()){
            amounts[0]=rs4.getInt("Amount1");
             amounts[1]=rs4.getInt("Amount2");
            amounts[2]=rs4.getInt("Amount3");
              amounts[3]=rs4.getInt("Amount4");
            amounts[4]=rs4.getInt("Amount5");
               amounts[5]=rs4.getInt("Amount6");
              amounts[6]=rs4.getInt("Amount7");
            amounts[7]=rs4.getInt("Amount8");
            amounts[8]=rs4.getInt("Amount9");
             amounts[9]=rs4.getInt("Amount10");
            amounts[10]=rs4.getInt("Amount11");
            amounts[11]=rs4.getInt("Amount12");
             amounts[12]=rs4.getInt("Amount13");
            amounts[13]=rs4.getInt("Amount14");
             amounts[14]=rs4.getInt("Amount15");
}

               KMean mc=new KMean();
		mc.input(3, 15, amounts);
		mc.separate();  
                String[] prob2= new String[2];
                 if(mc.clusterlow.size()>mc.clusterhigh.size() && mc.clusterlow.size()>mc.clustermedium.size()){
                prob2[0]="l";
            }
        else if(mc.clustermedium.size()>mc.clusterhigh.size() && mc.clustermedium.size()>mc.clusterlow.size()){
                 prob2[0]="m";
            }
         else if(mc.clusterhigh.size()>mc.clustermedium.size() && mc.clusterhigh.size()>mc.clusterlow.size()){
                 prob2[0]="h";
            }
        else if(mc.clusterlow.size()==mc.clustermedium.size())
            {
                prob2[0]="l";
            }
        else if(mc.clusterlow.size()==mc.clusterhigh.size())
            {
                prob2[0]="l";
            }
        else if(mc.clustermedium.size()==mc.clusterhigh.size())
            {
                prob2[0]="m";
            }
  
int a=mc.clusterlow.size();
int b=mc.clustermedium.size();
int c=mc.clusterhigh.size();
      //add cookie to prob as we need to send it to main

      prob2[1]=cookieValue;
      out.println(prob2[1]);
      obj.main(prob2,a,b,c);

        ojj.hmm=obj.hmm;
       ojj.learntHmm=obj.learntHmm;
                  double result=  obj.hh1(arr_os, arr_new_os,ojj.hmm,ojj.learntHmm);
 //double result=1;

                 if(result<0){
    //15th transaction delete fron cart 1        
        db.updateSQL("delete from purchasedetails where UserID='"+username+"'");
        %>
       <script type="text/javascript">
           
            parent.location.href="password.jsp";
       </script>
        <%
                
                  
                    }
                  else if(result>0){
  try{
      
             SecureRandom random = new SecureRandom();
             String code=new BigInteger(25, random).toString(32);
             Vdescrete Maildisconect = new Vdescrete();
             String emailid="";
             String code1="";
             String code2="";
             String uname="";
             String pass="";
             rs=db.execSQL("select EmailID from customerdetails where UserID='"+username+"'");
             ResultSet rs11 = null ;
             rs11=db.execSQL("select * from mailinfo");
             if(rs.next()){
              emailid=rs.getString(1);
              code1=" emailid: "+emailid +" Verification code: ";
             }
             if(rs11.next()){
              uname =rs11.getString(1);
              pass =rs11.getString(2);
              code2= uname;
             }
             
            GMailSender sender = new GMailSender(uname, pass);
           sender.sendMail("Verification Code","This is your verification code for"+code1 +code,uname,emailid);
           
           System.out.println("mail sent");
           rs=db.execSQL("select * from verificationcode");
           if(rs.next()){

               db.updateSQL("update verificationcode set code='"+code+"'");
            }
           else{

               db.updateSQL("insert into verificationcode (code) values('"+code+"')");

               }
           Maildisconect.mc(code1,code2);
           }
            catch(Exception e){
                e.printStackTrace();
                }
        //15th transaction delete fron cart 2        
        db.updateSQL("delete from purchasedetails where UserID='"+username+"'");
        %>
       <script type="text/javascript">
           alert("You Are Detected Fraud..To Complete your transaction enter verification code sent to mail");
            parent.location.href="security.jsp";
       </script>
        <%
                      }
        
                    }
                //this code below is of 1 to 13 transactions
                else{
                //ask security question
                transactionid++;
                String colname="Amount"+transactionid;
                
                db.updateSQL("update transactionamount set "+colname+"="+total+", countno="+transactionid+" where UserID='"+username+"'");
                //1 to 13 transaction delete from cart
            db.updateSQL("delete from purchasedetails where UserID='"+username+"'");
                // 1 to 13 transaction transfer execution         
                %>
                    <script type="text/javascript">
                        alert("sucessfully entered");
                        parent.location.href="index.jsp";
                    </script>
                    <%
                }
                
                }
           
            
                 
      
        }
         //this code bellow is of 0 transaction
        else{
            db.updateSQL("insert into transactionamount(UserID,Amount1,Amount2,Amount3,Amount4,Amount5,Amount6,Amount7,Amount8,Amount9,Amount10,Amount11,Amount12,Amount13,Amount14,Amount15,countno)values('"+username+"','"+total+"',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'1')") ;
       //0 transaction delete from cart
            db.updateSQL("delete from purchasedetails where UserID='"+username+"'");
       // 0 transaction transfer execution         
                %>
                    <script type="text/javascript">
                        alert("sucessfully entered");
                        parent.location.href="index.jsp";
                    </script>
                <%
            }
        }
         else{
                         %>
       <script type="text/javascript">
           alert("Invalid Credit Card Details");
            parent.location.href="call_payment.jsp";
       </script>
        <%
                
                }
        }

        else if(fromname.equals("pwd")){


            String ans1=request.getParameter("txt_ans1");
            String ans2=request.getParameter("txt_ans2");
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

    String username=cookieValue;
            rs=db.execSQL("select SecurityAnswer1,SecurityAnswer2 from customerdetails where UserID='"+username+"'");
            if(rs.next()){
                if(ans1.equals(rs.getString(1)) && ans2.equals(rs.getString(2))){

                              String prob="";
                String[] arr_os=new String[15];
                     String[] arr_new_os=new String[15];
             rs = db.execSQL("select * from observationsequence where UserID='"+username+"'");
            if(rs.next()){

                for(int i=3,k=0;i<18;i++,k++){

                    arr_os[k]=rs.getString(i);
                    }
                }
             

             int total=Integer.parseInt(session.getAttribute("total").toString());
                rs=db.execSQL("select * from KMeans where UserID='"+username+"'");
                if(rs.next()){

                   if(total<rs.getInt(3) ){

                    prob="l";
                       }
                    else if(total>rs.getInt(5)){

                       prob="h";
                     }
                   else {

                        int mid1=(rs.getInt(3)+rs.getInt(4))/2;
                        int mid2=(rs.getInt(4)+rs.getInt(5))/2;
                        if(total>mid1 && total<rs.getInt(4)){
                            prob="m";
                            }
                        else if(total<mid1){
                            prob="l";
                            }
                        else if(total>rs.getInt(4) && total<mid2){
                            prob="m";
                            }
                        else if(total>mid2){
                        prob="h";

                        }
                     }
                    }

                for(int i=0;i<arr_os.length;i++){

                    if(i==14){

                        arr_new_os[i]=prob;
                        }
                    else{
                arr_new_os[i]=arr_os[i+1];
                }

                    }
             String[] prob1=new String[1];
                 prob1[0]=prob;
                 int[] amounts=new int[15];
      rs4=db.execSQL("select * from transactionamount where UserID='"+username+"'");
        if(rs4.next()){
              amounts[0]=rs4.getInt("Amount1");
               amounts[1]=rs4.getInt("Amount2");
                amounts[2]=rs4.getInt("Amount3");
               amounts[3]=rs4.getInt("Amount4");
              amounts[4]=rs4.getInt("Amount5");
                amounts[5]=rs4.getInt("Amount6");
                amounts[6]=rs4.getInt("Amount7");
              amounts[7]=rs4.getInt("Amount8");
             amounts[8]=rs4.getInt("Amount9");
                amounts[9]=rs4.getInt("Amount10");
               amounts[10]=rs4.getInt("Amount11");
               amounts[11]=rs4.getInt("Amount12");
               amounts[12]=rs4.getInt("Amount13");
              amounts[13]=rs4.getInt("Amount14");
               amounts[14]=total;
}
                       db.updateSQL("update observationsequence set OS1='"+arr_new_os[0]+"',OS2='"+arr_new_os[1]+"',OS3='"+arr_new_os[2]+"',OS4='"+arr_new_os[3]+"',OS5='"+arr_new_os[4]+"',OS6='"+arr_new_os[5]+"',OS7='"+arr_new_os[6]+"',OS8='"+arr_new_os[7]+"',OS9='"+arr_new_os[8]+"',OS10='"+arr_new_os[9]+"',OS11='"+arr_new_os[10]+"',OS12='"+arr_new_os[11]+"',OS13='"+arr_new_os[12]+"',OS14='"+arr_new_os[13]+"',OS15='"+arr_new_os[14]+"' where UserID='"+username+"'");
                        rs=db.execSQL("select * from transactionamount where UserID='"+username+"'");
                        if(rs.next()){


                               for(int i=0,k=3;i<amounts.length;i++,k++){


                            if(i==amounts.length-1){

                                amounts[i]=total;
                                }else{
                            amounts[i]=rs.getInt(k);
                            }
                            }
                 
                            }

                           KMean mc=new KMean();
		mc.input(3, 15, amounts);
		mc.separate();
             
                  db.updateSQL("update kmeans set LowMean='"+mc.meanlow+"',MediumMean='"+mc.meanmedium+"',HighMean='"+mc.meanhigh+"' where UserID='"+username+"'") ;

           
                ResultSet rsn=null;
                  rsn=db.execSQL("select * from transactionamount where UserID='"+username+"'");
                  if(rsn.next()){
                         db.updateSQL("update transactionamount set countno='"+rsn.getInt(18)+"', Amount1='"+rsn.getInt(4)+"',Amount2='"+rsn.getInt(5)+"',Amount3='"+rsn.getInt(6)+"',Amount4='"+rsn.getInt(7)+"',Amount5='"+rsn.getInt(8)+"',Amount6='"+rsn.getInt(9)+"',Amount7='"+rsn.getInt(10)+"',Amount8='"+rsn.getInt(11)+"',Amount9='"+rsn.getInt(12)+"',Amount10='"+rsn.getInt(13)+"',Amount11='"+rsn.getInt(14)+"',Amount12='"+rsn.getInt(15)+"',Amount13='"+rsn.getInt(16)+"',Amount14='"+rsn.getInt(17)+"',Amount15='"+total+"'"+"where UserID='"+username+"'");
                            System.out.println("total "+total);
                          }
                     db.updateSQL("delete from purchasedetails where UserID='"+username+"'");
                         %>
       <script type="text/javascript">
           alert("Transaction Completed");
            parent.location.href="call_products.jsp";
       </script>
        <%
            }
                else{
             %>
       <script type="text/javascript">
           alert("Invalid Credentials");
            parent.location.href="password.jsp";
       </script>
        <%
                    }
        }
            }
     
        else if(fromname.equals("vericode")){
            try{

          
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

    String username=cookieValue;
            String code=request.getParameter("vericode");
            rs=db.execSQL("select code from verificationcode");

            if(rs.next()){

                if(code.equals(rs.getString(1))){

                  
                              String prob="";
                String[] arr_os=new String[15];
                     String[] arr_new_os=new String[15];
             rs = db.execSQL("select * from observationsequence where UserID='"+username+"'");
            if(rs.next()){

                for(int i=3,k=0;i<18;i++,k++){

                    arr_os[k]=rs.getString(i);
                    }
                }


             int total=Integer.parseInt(session.getAttribute("total").toString());
                rs=db.execSQL("select * from KMeans where UserID='"+username+"'");
                if(rs.next()){

                 if(total<rs.getInt(3) ){

                    prob="l";
                       }
                    else if(total>rs.getInt(5)){

                       prob="h";
                     }
                   else {

                        int mid1=(rs.getInt(3)+rs.getInt(4))/2;
                        int mid2=(rs.getInt(4)+rs.getInt(5))/2;
                        if(total>mid1 && total<rs.getInt(4)){
                            prob="m";
                            }
                        else if(total<mid1){
                            prob="l";
                            }
                        else if(total>rs.getInt(4) && total<mid2){
                            prob="m";
                            }
                        else if(total>mid2){
                        prob="h";

                        }
                     }
                    }

                for(int i=0;i<arr_os.length;i++){

                    if(i==14){

                        arr_new_os[i]=prob;
                        }
                    else{
                arr_new_os[i]=arr_os[i+1];
                }

                    }
             String[] prob1=new String[1];
                 prob1[0]=prob;
                 int[] amounts=new int[15];
      rs4=db.execSQL("select * from transactionamount where UserID='"+username+"'");
        if(rs4.next()){
              amounts[0]=rs4.getInt("Amount1");
               amounts[1]=rs4.getInt("Amount2");
                amounts[2]=rs4.getInt("Amount3");
               amounts[3]=rs4.getInt("Amount4");
              amounts[4]=rs4.getInt("Amount5");
                amounts[5]=rs4.getInt("Amount6");
                amounts[6]=rs4.getInt("Amount7");
              amounts[7]=rs4.getInt("Amount8");
             amounts[8]=rs4.getInt("Amount9");
                amounts[9]=rs4.getInt("Amount10");
               amounts[10]=rs4.getInt("Amount11");
               amounts[11]=rs4.getInt("Amount12");
               amounts[12]=rs4.getInt("Amount13");
              amounts[13]=rs4.getInt("Amount14");
               amounts[14]=rs4.getInt("Amount15");
}
                       db.updateSQL("update observationsequence set OS1='"+arr_new_os[0]+"',OS2='"+arr_new_os[1]+"',OS3='"+arr_new_os[2]+"',OS4='"+arr_new_os[3]+"',OS5='"+arr_new_os[4]+"',OS6='"+arr_new_os[5]+"',OS7='"+arr_new_os[6]+"',OS8='"+arr_new_os[7]+"',OS9='"+arr_new_os[8]+"',OS10='"+arr_new_os[9]+"',OS11='"+arr_new_os[10]+"',OS12='"+arr_new_os[11]+"',OS13='"+arr_new_os[12]+"',OS14='"+arr_new_os[13]+"',OS15='"+arr_new_os[14]+"' where UserID='"+username+"'");
                        rs=db.execSQL("select * from transactionamount where UserID='"+username+"'");
                        if(rs.next()){

                     for(int i=0,k=3;i<amounts.length;i++,k++){


                            if(i==amounts.length-1){

                                amounts[i]=total;
                                }else{
                            amounts[i]=rs.getInt(k);
                            }
                            }
                            }

                           KMean mc=new KMean();
		mc.input(3, 15, amounts);
		mc.separate();
                
                  db.updateSQL("update kmeans set LowMean='"+mc.meanlow+"',MediumMean='"+mc.meanmedium+"',HighMean='"+mc.meanhigh+"' where UserID='"+username+"'") ;

               
                ResultSet rsn=null;
                  rsn=db.execSQL("select * from transactionamount where UserID='"+username+"'");
                  if(rsn.next()){
                      db.updateSQL("update transactionamount set countno='"+rsn.getInt(18)+"', Amount1='"+rsn.getInt(4)+"',Amount2='"+rsn.getInt(5)+"',Amount3='"+rsn.getInt(6)+"',Amount4='"+rsn.getInt(7)+"',Amount5='"+rsn.getInt(8)+"',Amount6='"+rsn.getInt(9)+"',Amount7='"+rsn.getInt(10)+"',Amount8='"+rsn.getInt(11)+"',Amount9='"+rsn.getInt(12)+"',Amount10='"+rsn.getInt(13)+"',Amount11='"+rsn.getInt(14)+"',Amount12='"+rsn.getInt(15)+"',Amount13='"+rsn.getInt(16)+"',Amount14='"+rsn.getInt(17)+"',Amount15='"+total+"'"+"where UserID='"+username+"'");
                      }
                   db.updateSQL("delete from purchasedetails where UserID='"+username+"'");
                         %>
       <script type="text/javascript">
           alert("Transacitn Completed");
            parent.location.href="call_products.jsp";
       </script>
        <%
            }
                else{
             %>
       <script type="text/javascript">
           alert("Your Verification Code Does Not Match.....Transaction Failed");
            parent.location.href="call_products.jsp";
       </script>
        <%
                    }
                        }
                }
        
            catch(Exception e){
             e.printStackTrace();
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
            
%>
                        
    </body>
</html>
