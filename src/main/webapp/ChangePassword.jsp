<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>

<%
try
{
	String userID = (String) session.getAttribute("UserID");
	
	Cookie[] cookies = request.getCookies();
	boolean valid = false;
	for (int i=0; i<cookies.length; i++)
	{
		if ("Username".equals(cookies[i].getName()))
		{
			if (cookies[i].getValue() != null &&
				 cookies[i].getValue().length() > 0)
			{
				valid=true;
				break;
			}
		}
	}
	if (!valid)
		response.sendRedirect("sorry.htm");
%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Change Password</title>
</head>

<body background="images/52side.jpg">

<p align="center"><img border="0" src="images/merry.gif"></p>
<blockquote>
  <blockquote>
    <blockquote>
      <blockquote>
        <p align="center"><img border="0" src="images/divider.gif"></p>


        <form name="AddData" action="SubmitPasswordChange.jsp" method="Post">
          <table align="center">
            <tr>
              <td valign="top"><font color="#006600" face="Bookman Old Style">
              Old Password:
		  </font></td>
		<td>
               <input type="password" name="Current" maxlength="100" size="20">
            </td>
           </tr>
		<tr>
              <td valign="top"><font color="#006600" face="Bookman Old Style">
              New Password:
		  </font></td>
		<td>
               <input type="password" name="Password" maxlength="100" size="20">
            </td>
           </tr>
           <tr> 
		<td valign="top"><font color="#006600" face="Bookman Old Style">
              Confirm:
		  </font></td>
            <td>   
                <input type="password" name="Confirm" maxlength="100" size="20">
             </td>
           </tr>
          </table>
          <br>
          <p align="center">
	        <input type="Submit" value="Change Password" id="Submit1" name="Submit1">
          </p>
	</form>
        <p align="center">&nbsp;</p>
        <p align="center"><img border="0" src="images/divider.gif"></p>
      </blockquote>
    </blockquote>
  </blockquote>
</blockquote>
<p align="center">&nbsp;</p>
<p align="center"><img border="0" src="images/backbttn.gif"></p>

</body>

</html>

<% }
   catch (Exception e)
   {
	out.println(e.getMessage());
   }
%>
