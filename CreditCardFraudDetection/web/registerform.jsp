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
<link rel="stylesheet" type="text/css" media="all" href="jsDatePick_ltr.min.css" />
<script type="text/javascript" src="jsDatePick.min.1.3.js"></script>
<script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"inputField",
			dateFormat:"%d-%M-%Y"
			/*selectedDate:{				This is an example of what the full configuration offers.
				day:5,						For full documentation about these settings please see the full version of the code.
				month:9,
				year:2006
			},
			yearsRange:[1978,2020],
			limitToToday:false,
			cellColorScheme:"beige",
			dateFormat:"%m-%d-%Y",
			imgPath:"img/",
			weekStartDay:1*/
		});
	};
</script>

</head>
<link rel="stylesheet" href="stylesheet.css" type="text/css" />
<body>
<div id="div_body" >
<p style="text-align:center; font-family:'Comic Sans MS', cursive; color:#900; font-size:20px;"><b>Registeration Form</b></p>
<form action="dbConnection.jsp" name="frmregister" method="post">
<input type="hidden" name="frmname" value="frmregister"/>
<table align="center" width="498" height="490" border="0">
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
    <td>UserName</td>
    <td><span id="sprytextfield2">
      <label>
        <input type="text" name="txt_username" id="txt_username" />
      </label>
      <span class="textfieldRequiredMsg">A value is required.</span></span></td>
  </tr>
  <tr>
    <td>Address</td>
    <td><span id="sprytextarea1">
      <label>
        <textarea name="txt_address" id="txt_address" cols="16" rows="3"></textarea>
      </label>
      <span class="textareaRequiredMsg">A value is required.</span></span></td>
  </tr>
  <tr>
    <td>MobileNo</td>
    <td><span id="sprytextfield3">
    <label>
      <input type="text" name="txt_contactno" id="txt_contactno" />
    </label>
    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span></td>
  </tr>
  <tr>
    <td>DOB</td>
    <td>  <input type="text" size="12" id="inputField" name="inputField" /></td>
  </tr>
  <tr>
    <td>EmailID</td>
    <td><span id="sprytextfield4">
    <label>
      <input type="text" name="txt_emailid" id="txt_emailid" />
    </label>
    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
  </tr>
   <tr>
    <td>Security Question</td>
    <td><span id="spryselect1">
      <label>
        <select name="secquest1" id="secquest1">
          <option value="Answer The Name Of Your Best Friend">Answer The Name Of Your Best Friend</option>
        </select>
      </label>
      <span class="selectRequiredMsg">Please select an item.</span></span></td>
  </tr>
  <tr>
    <td>Security Answer</td>
    <td><span id="sprytextfield5">
      <label>
        <input type="text" name="txt_securityans1" id="txt_securityans1" />
      </label>
      <span class="textfieldRequiredMsg">A value is required.</span></span></td>
  </tr>
   <tr>
    <td>Security Question</td>
    <td><span id="spryselect2">
      <label>
        <select name="secquest2" id="secquest2">
          <option value="Answer The Name Of Your First School">Answer The Name Of Your First School</option>
        </select>
      </label>
      <span class="selectRequiredMsg">Please select an item.</span></span></td>
  </tr>
  <tr>
    <td>Security Answer</td>
    <td><span id="sprytextfield6">
      <label>
        <input type="text" name="txt_securityans2" id="txt_securityans2" />
      </label>
      <span class="textfieldRequiredMsg">A value is required.</span></span></td>
  </tr>
  
   <tr>
    <td>Credit Card Number</td>
    <td><span id="sprytextfield7">
    <label>
      <input type="text" name="cardno1" id="cardno1" style="width:40px;" />
    </label>
    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span><span id="sprytextfield8">
    <label>
      <input type="text" name="cardno2" id="cardno2" style="width:40px;" />
    </label>
    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span><span id="sprytextfield9">
    <label>
      <input type="text" name="cardno3" id="cardno3" style="width:40px;" />
    </label>
    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span><span id="sprytextfield10">
    <label>
      <input type="text" name="cardno4" id="cardno4" style="width:40px;" />
    </label>
    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span></td>
  </tr>
  
   <tr>
    <td>CCV Number</td>
    <td><span id="sprytextfield11">
    <label>
      <input type="text" name="ccvno" id="ccvno" style="width:40px;" />
    </label>
    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span></td>
  </tr>
  
   <tr>
    <td>Card Holder Name</td>
    <td><span id="sprytextfield12">
    <label>
      <input type="text" name="cardholdername" id="cardholdername" />
    </label>
    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
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
  <tr>
    
    <td height="34" colspan="2"><input style="width:75px; height:25px; margin-left:100px;" name="Submit" type="submit" value="Submit" />
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
var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "integer", {minChars:4, maxChars:4, validateOn:["blur"]});
var sprytextfield8 = new Spry.Widget.ValidationTextField("sprytextfield8", "integer", {minChars:4, maxChars:4, validateOn:["blur"]});
var sprytextfield9 = new Spry.Widget.ValidationTextField("sprytextfield9", "integer", {minChars:4, maxChars:4, validateOn:["blur"]});
var sprytextfield10 = new Spry.Widget.ValidationTextField("sprytextfield10", "integer", {minChars:4, maxChars:4, validateOn:["blur"]});
var sprytextfield11 = new Spry.Widget.ValidationTextField("sprytextfield11", "integer", {minChars:3, maxChars:3, validateOn:["blur"]});
var sprytextfield12 = new Spry.Widget.ValidationTextField("sprytextfield12", "none", {validateOn:["blur"]});
//-->
</script>
</body>
</html>