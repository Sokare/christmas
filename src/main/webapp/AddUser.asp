<%@ Language=VBScript %>
<% 
TableName = "tblUsers"

%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Add An Item to Your Wish List</title>
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta name="Microsoft Border" content="none, default">
</head>

<body background="images/sidebar.gif">

<p align="center"><img border="0" src="images/merry.gif" width="394" height="198"></p>
<blockquote>
  <blockquote>
    <blockquote>
      <blockquote>
        <p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
        <p align="center"><font face="Bookman Old Style" size="5" color="#006600"><b>Add
        User:</b></font></p>


        <% '<FORM name="FrontPage_Form1" Action="InsertUser.asp" Method="Post" onsubmit="return FrontPage_Form1_Validator(this)"> %>
        <!--webbot BOT="GeneratedScript" PREVIEW=" " startspan --><script Language="JavaScript"><!--
function FrontPage_Form1_Validator(theForm)
{

  if (theForm.FamilyName.value == "")
  {
    alert("Please enter a value for the \"FamilyName\" field.");
    theForm.FamilyName.focus();
    return (false);
  }

  if (theForm.FamilyName.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"FamilyName\" field.");
    theForm.FamilyName.focus();
    return (false);
  }

  if (theForm.FamilyName.value.length > 2)
  {
    alert("Please enter at most 2 characters in the \"FamilyName\" field.");
    theForm.FamilyName.focus();
    return (false);
  }
  return (true);
}
//--></script><!--webbot BOT="GeneratedScript" endspan --><form action="InsertUser.asp" method="Post" onsubmit="return FrontPage_Form1_Validator(this)" name="FrontPage_Form1">
          <p align="center"><input type="Hidden" name="User" value="<%=TableName%>"><font face="Book Antiqua" color="#006600"><b>Name</b></font><font color="#006600"><b><font face="Book Antiqua">: </font></b></font>&nbsp;<input type="text" name="User" size="30" maxlength="100">
          <p align="center"><font color="#006600"><b><font face="Book Antiqua">Password:</font>
          </b></font><input type="text" name="Password" size="30" maxlength="100"></p>
          <p align="center"><font color="#006600"><b><font face="Book Antiqua">Family:</font>
          </b></font><!--webbot bot="Validation" B-Value-Required="TRUE"
          I-Minimum-Length="1" I-Maximum-Length="2" --><input type="text" name="FamilyName" size="30" maxlength="2"></p>
          <p align="center"><input type="Submit" value="Add User"></p>
        </form>





        <p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
      </blockquote>
    </blockquote>
  </blockquote>
</blockquote>

&nbsp;</body>

</html>
