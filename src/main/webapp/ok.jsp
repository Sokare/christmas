<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>


<%
try
{
	/*Cookie[] cookies = request.getCookies();
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
		response.sendRedirect("sorry.htm");*/


	String userID = (String) session.getAttribute("UserID");
	if (userID == null || userID.length() == 0)
		response.sendRedirect("sorry.htm");

}
catch (Exception e)
{
	out.println(e.getMessage());
}
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>You have successfully logged in.</title>
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
<p align="center"><b><font face="Bookman Old Style" color="#006600" size="6">Welcome!</font></b></p>
      </blockquote>
    </blockquote>
  </blockquote>
</blockquote>
<H1 align="center"> <font color="#800000" size="4"> You are now logged ON.</font> </H1>
<p align="center">
<table align="center">
<tr>

<%if ("Y".equals(session.getAttribute("FamilyList"))) {%>
<td>
   <a href="ChristmasList.jsp">Family Christmas List</a>
</td> 
<% }%>
<td>
   <a href="MyChristmasList.jsp">My Christmas List</a>
</td>
</tr>
<tr>
<td>
 <a href="ChangePassword.jsp">Change Password</a>
</td>
</tr>
</table>
</p>
<p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
<p align="center"> <img border="0" src="images/bullet2.gif" width="25" height="31"><b><a href="logout.jsp"><font color="#800000" face="Bookman Old Style" size="4">Logout</font></a></b></p>
<p align="center"></p>
</body>

</html>


</html>
