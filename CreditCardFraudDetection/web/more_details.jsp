<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<link rel="stylesheet" href="stylesheet.css" type="text/css"/>
<body>
<div id="div_moredetails">
<%String id=request.getParameter("id");
String description="";
String image="";
String price="";
if(id.equals("1")){
	description="A woman's handbag is an integral part of her outfit. A handbag is more than just a sack to carry essentials. It's a fashion statement, a way to express her style and creativity. Handbags come in many shapes, sizes, colors, prices and labels. Does this Spark an idea?Be a part of the cool gang with this compact Clara bags. With well placed multiple pockets be assured that your stuff is safe and secure.Glossy Surface,Front flap opening and back slip pocket.Adjustable and detachable strap.Interior features Caprese branded inner lining and twin compartments";
	image="bags.jpg";
	price="200";
}
else if(id.equals("2")){
	description="This is just a perfect gift for little ones. It helps them to develop hand co-ordination, vision,  When you keep a ball at top, it rolls & falls to next floor. Its quite interesting for babies. Crystal ball is irrefrangible ,Every youngster wants to help drive daddy's car. This plastic wheel with rubber shaft lets a child do just that. Has three-position gearshift lever and horn that beeps. Suction cup holds it firmly to any smooth surface." ;

image="kids toy.png";
	price="250";
}
else if (id.equals("3")){
	description="A little black dress is an evening or cocktail dress, cut simply and often quite short. Fashion historians ascribe the origins of the little black dress to the 1920s designs of Coco Chanel, intended to be long-lasting, versatile, affordable, accessible to the widest market possible and in a neutral colour. Its ubiquity is such that it is often simply referred to as the LBD. The little black dress is considered essential to a complete wardrobe by many women and fashion observers, who believe it a rule of fashion that every woman should own a simple, elegant black dress that can be dressed up or down depending on the occasion: for example, worn with a jacket and pumps for daytime business wear or with more ornate jewelry and accessories for evening. Because it is meant to be a staple of the wardrobe for a number of years, the style of the little black dress ideally should be as simple as possible , a short black dress that is too clearly part of a trend would not qualify because it would soon appear dated.";
	
	image="women-clothes.jpg";
	price="550";

}

else if (id.equals("4")){
	description="";
	image="ring.png";
	price="1850";
}
else if (id.equals("5")){
	description="";
	image="clotheskids.png";
	price="550";
}
else if (id.equals("6")){
	description="";
	image="tshirt boy.png";
	price="650";
}
else if (id.equals("7")){
	description="";
	image="blazer.jpg";
	price="400";
}
else if (id.equals("8")){
	description="";
	image="shoes.png";
	price="600";
}
else if (id.equals("9")){
	description="";
	image="men-watches.jpg";
	price="1000";
}




%>
<div id="div_image"><img alt=""  src="images/<%=image%>" width="297" height="263" /></div>
  <div id="div_description">

<%session.setAttribute("image",image);
session.setAttribute("price",price);
session.setAttribute("id",id);%>
  <p>&nbsp;&nbsp;<strong>Description :</strong><br/><%=description%></p>
   <p>&nbsp;&nbsp;<strong>Price :   </strong><%=price%></p>
  <p><a href="call_mycart.jsp"><img src="images/addtocart.png" width="216" height="76" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="call_payment.jsp"><img src="images/buy.png" width="216" height="76" /></a></p>
  
  </div>
</div>
</body>
</html>