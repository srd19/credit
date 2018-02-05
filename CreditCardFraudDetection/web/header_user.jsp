<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
</head>
<link href="stylesheet.css" rel="stylesheet" type="text/css" />
<body>
<div id="header">
<p style="text-align:left; font-family:'Comic Sans MS', cursive; color:#900; font-size:20px;"><b>Online Shopping Centre</b></p>
<div id="menubar">

<ul id="MenuBar1" class="MenuBarHorizontal">
  <li><a href="index.jsp">Home</a></li>
  <li><a href="call_products.jsp">Products</a></li>
 <li><a href="call_mycart.jsp">My Cart</a></li>
  <li><a href="logout.jsp">Logout</a>    </li>
</ul>
</div>
</div>
<script type="text/javascript">
<!--
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
//-->
</script>
</body>
</html>