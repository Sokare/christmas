<html>

<head>
<title>Login to Christmas page</title>
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
  <input type="Hidden" name="FamilyName" value="Erikson">
  <p align="center"><img border="0" src="images/merry.gif"></p>
  <p align="center"><img border="0" src="images/divider.gif"></p>
  <p>&nbsp;</p>
  <h1 align="center"><b><font face="Bookman Old Style" color="#006600" size="5">Login
  to Erikson Christmas List</font></b></h1>
  <p align="center">Eriksons:&nbsp; <select size="1" name="UserID">
    <option value="Mom">Mom</option>
    <option value="Dad">Dad</option>
    <option value="AJ">AJ</option>
    <option value="Debbie">Debbie</option>
    <option value="Rebecca">Rebecca</option>
    <option value="Anthony">Anthony</option>
    <option value="Pete">Pete</option>
    <option value="Megan">Megan</option>
    <option value="Matthew">Matthew</option>
    <option value="Sarah">Sarah</option>
    <option value="Drew">Drew</option>
    <option value="Noah">Noah</option>
    <option value="Tim">Tim</option>
    <option value="Julie">Julie</option>
    <option value="Eli">Eli</option>
    <option value="Cara Beth">Cara Beth</option>
    <option value="David">David</option>
  </select>&nbsp;&nbsp;Wessons:&nbsp; <select size="1" name="UserID2">
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
  <p align="center"><img border="0" src="images/divider.gif"></p>
</form>
<p align="center"><a href="default.htm"><img border="0" src="images/home.gif" width="118" height="80"></a>
<a href="links.htm"><img border="0" src="images/links.gif" width="118" height="80"></a>
<a href="mailto:mail@eriksonfamily.org"><img border="0" src="images/email.gif" width="118" height="80"></a></p>
&nbsp;</body>

</html>
