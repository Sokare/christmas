<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>

<%
try
{
	String PKValue = request.getParameter("PKValue");
	String userID = (String) session.getAttribute("UserID");
	String familyName = (String) session.getAttribute("FamilyName");
	if (!("Erikson".equals(familyName) || "Wesson".equals(familyName)))
		response.sendRedirect("Error.jsp");
	
	if (userID == null || userID.length() == 0)
		response.sendRedirect("sorry.htm");
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	
	String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String url = String.format("jdbc:mysql://%s:%s/christmas", host, port);
	java.sql.Connection conn = DriverManager.getConnection(url, "adminNiJqTgE", "bw2e2UQJmQhI");
  	Statement stmt = conn.createStatement();
	String sqlString = "Select * From wishlist Where id =" + PKValue;
	
	ResultSet rs = stmt.executeQuery(sqlString);
      rs.first();

%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Update Wish List Item</title>
</head>

<body background="images/52side.jpg">

<p align="center"><img border="0" src="images/merry.gif"></p>
<blockquote>
  <blockquote>
    <blockquote>
      <blockquote>
        <p align="center"><img border="0" src="images/divider.gif"></p>


        <form name="AddData" action="EditMyRow.jsp" method="Post">
          <input type="Hidden" name="TableName" value="wishlist"><input type="Hidden" name="PKValue" value="<%=PKValue%>">
          <table align="center">
            <tr>
              <td valign="top"><font color="#006600" face="Bookman Old Style">
              Item:
		  </font></td>
		<td>
               <input type="Text" name="ItemText" maxlength="100" value="<%=rs.getString("Item").trim()%>" size="20">
            </td>
           </tr>
           <tr> 
		<td valign="top"><font color="#006600" face="Bookman Old Style">
              Description:
		  </font></td>
            <td>   
                <input type="Text" name="DescriptionText" maxlength="100" value="<%=rs.getString("Description").trim()%>" size="20">
             </td>
           </tr>
          </table>
          <br>
          <p align="center">
	        <input type="Submit" value="Update List Item" id="Submit1" name="Submit1">
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
