<%
FamilyName = Session("FamilyName")
UserID = Session("UserID")
%>


<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Login to Erikson Christmas page</title>
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
<form method="POST" action="changepassword.asp">
  <input type="Hidden" name="FamilyName" value="Erikson">
  <p align="center"><img border="0" src="images/merry.gif"></p>
  <p align="center"><img border="0" src="images/divider.gif"></p>
  <p>&nbsp;</p>
  <h1 align="center"><b><font face="Bookman Old Style" color="#006600" size="5">Change
  Password for user&nbsp;<%=userid%></font></b></h1>
  <blockquote>
    <blockquote>
      <blockquote>
        <blockquote>
          <blockquote>
  <p align="left"><font face="Book Antiqua" color="#800000"><b>Old Password:&nbsp;</b>&nbsp;
  <input type="password" name="Password" size="10" maxlength="20"></font></p>
  <p align="left"><font face="Book Antiqua" color="#800000"><b>New Password:&nbsp;</b>&nbsp;
  <input type="password" name="NewPassword" size="10" maxlength="20"></font></p>
  <p align="left"><font face="Book Antiqua" color="#800000"><b>Retype New
  Password:</b>&nbsp; <input type="password" name="NewPassword2" size="10" maxlength="20"></font></p>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </blockquote>
  <p align="center"><input type="submit" value="Submit" name="Submit"></p>
  <p align="center">&nbsp;</p>
  <p align="center"><img border="0" src="images/divider.gif"></p>
</form>
<p align="center"><a href="default.htm"><img border="0" src="images/home.gif" width="118" height="80"></a>
<a href="links.htm"><img border="0" src="images/links.gif" width="118" height="80"></a>
<a href="mailto:jerikson@nc.rr.com"><img border="0" src="images/email.gif" width="118" height="80"></a></p>
&nbsp;</body>

</html>
