<html>

<head>
<title>Login to Wesson Christmas List</title>
<meta name="Microsoft Border" content="none, default">
</head>

<body background="images/sidebar.gif">

<script Language="JavaScript"><!--
function FrontPage_Form1_Validator(theForm)
{

  if (theForm.Password.value == "")
  {
    alert("Please enter a value for the \"Password\" field.");
    theForm.Password.focus();
    return (false);
  }

  if (theForm.Password.value.length > 20)
  {
    alert("Please enter at most 20 characters in the \"Password\" field.");
    theForm.Password.focus();
    return (false);
  }
  return (true);
}
//--></script>
<form method="POST" action="Logon.jsp">
  <input type="Hidden" name="FamilyName" value="Wesson">
  <p align="center"><img border="0" src="images/merry.gif"></p>
  <p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
  <p>&nbsp;</p>
  <h1 align="center"><b><font face="Bookman Old Style" color="#006600" size="5">Login
  to Wesson Christmas List</font></b></h1>
  <p align="center">Family Member:&nbsp; <select size="1" name="UserID">
    <option value="Bill">Bill</option>
    <option value="Ev">Ev</option>
    <option value="Tim">Tim</option>
    <option value="Julie">Julie</option>
    <option value="Eli">Eli</option>
    <option value="Cara Beth">Cara Beth</option>
    <option value="George">George</option>
    <option value="Lynn">Lynn</option>
    <option value="Gram">Gram</option>
  </select>&nbsp;&nbsp;</p>
  <p align="center">Password:&nbsp;&nbsp; <input type="password" name="Password" size="10" maxlength="20"></p>
  <p align="center"><input type="submit" value="Submit" name="Submit"></p>
  <p align="center">&nbsp;</p>
  <p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
</form>
<p align="center"><a href="default.htm"><img border="0" src="images/home.gif" width="118" height="80"></a>&nbsp;&nbsp;&nbsp;&nbsp;
<img border="0" src="images/links.gif" width="118" height="80">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;<img border="0" src="images/email.gif" width="118" height="80">
<p>&nbsp;</p>
</body>

</html>
