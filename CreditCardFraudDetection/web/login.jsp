<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationPassword.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryValidationPassword.css" rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryValidationSelect.css" rel="stylesheet" type="text/css" />
</head>
<link rel="stylesheet" href="stylesheet.css" type="text/css" />
<body>
<div id="div_body">
<p style="text-align:center; font-family:'Comic Sans MS', cursive; color:#900; font-size:20px;"><b>Login Form</b></p>
<form action="dbConnection.jsp" name="frmlogin" method="post">
<input type="hidden" name="frmname" value="frmlogin"/>
<table align="center" width="307" height="118" border="0">
  <tr>
    <td width="143">UserID</td>
    <td width="291"><span id="sprytextfield1">
      <label>
        <input type="text" name="txtuserid" id="txtuserid" />
      </label>
      <span class="textfieldRequiredMsg">A value is required.</span></span></td>
  </tr>
  <tr>
    <td>Password</td>
    <td><span id="sprypassword1">
      <label>
        <input type="password" name="txt_password" id="txt_password" />
      </label>
      <span class="passwordRequiredMsg">A value is required.</span></span></td>
  </tr>
 
  <tr>
    
    <td height="34" colspan="2"><input style="width:75px; height:25px; margin-left:50px;" name="Submit" type="submit" value="Login" />
    <input style="width:75px; height:25px; margin-left:25px;" name="Reset" type="reset" value="Reset" />
    
    </td>
  </tr>
</table>
</form>
</div>
<script type="text/javascript">
<!--
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
var sprypassword1 = new Spry.Widget.ValidationPassword("sprypassword1");
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2");
var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1");
var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "integer", {minChars:10, maxChars:10});
var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "email");
var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6");
var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
var spryselect2 = new Spry.Widget.ValidationSelect("spryselect2");
//-->
</script>
</body>
</html>