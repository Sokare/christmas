<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>

<% 
try
{
String tableName = "wishlist";
String primaryKey = "ID";
String userID = (String)session.getAttribute("UserID");
String familyName = (String)session.getAttribute("FamilyName");

if (userID == null || userID.length()<2)
    response.sendRedirect("Error.jsp");

%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>My Christmas List</title>
<meta name="Microsoft Border" content="none, default">
</head>

<body background="images/sidebar.gif">

<p align="center"><img border="0" src="images/merry.gif"></p>
<blockquote>
  <blockquote>
    <blockquote>
      <blockquote>
        <p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
        <p align="center"><font face="Book Antiqua" color="#006600" size="5"><b>Christmas
        List For <%=userID%> </b></font></p>
        <p align="center"><br>

        <%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String contextPath=request.getContextPath();

	String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String url = String.format("jdbc:mysql://%s:%s/christmas", host, port);
	java.sql.Connection conn = DriverManager.getConnection(url, "adminNiJqTgE", "bw2e2UQJmQhI");
  	Statement stmt = conn.createStatement();

	String sqlString = "Select * From wishlist WHERE Name = '" + userID + "' Order By Name";
	ResultSet rs = stmt.executeQuery(sqlString);

        %>

        <table border="1" width="247" cellpadding="3">
          <tr>

		<%
               for (int i=0; i<rs.getMetaData().getColumnCount(); i++)
		   {
			String columnName = rs.getMetaData().getColumnName(i+1);
			if ("Item".equals(columnName) || "Description".equals(columnName))
			{  %>
            
		<td width="300"><font face="Book Antiqua" color="#006600" <b>
              <p align="center"> <%= columnName %></font></td>
           	<%    }
		   } %>
		<td width="223"><font face="Book Antiqua" color="#006600" <b>
              <p align="center">Update</font></td>

            <td width="223"><font face="Book Antiqua" color="#006600" <b>
              <p align="center">Delete Item</font></td>
          </tr>


          <%  while (rs.next())
		{ %>
          <tr>
            <td width="300">
              <p align="center">
              <%= rs.getString("Item").trim()%>
            </td>
            <td width="300">
              <p align="center">
              <%= rs.getString("Description").trim()%>
            </td>
            <td>
              <p align="center">
        	<a href="UpdateMyItem.jsp?TableName=<%=tableName%>&amp;PrimaryKey=<%=primaryKey%>&amp;PKValue=<%= rs.getString("id")%>">
		Update
		</a>
            </td>
            <td>
              <p align="center">
        	<a href="DeleteThisRow.jsp?TableName=<%=tableName%>&amp;PrimaryKey=<%=primaryKey%>&amp;PKValue=<%= rs.getString("id")%>">
		Delete
		</a>
		
            </td>
          </tr>
          <%
             }
          %>
        </table>
        <p align="center">&nbsp;
        <p align="center"><img border="0" src="images/bullet2.gif"><b><a href="AddItem.jsp?TableName=<%=tableName%>"><font color="#006600" face="Bookman Old Style" size="4">Add
        an item to my wish list</font></a>
        </b>
        <p align="center">
        <%
rs.close();
conn.close();
stmt.close();
	}
	catch (Exception e)
	{
		out.println(e.getMessage());
		

      }
        %>


        <img border="0" src="images/bullet2.gif"><a href="ChristmasList.jsp"><font color="#006600" face="Bookman Old Style" size="4">
<% if ("Y".equals(session.getAttribute("FamilyList"))) {%>
<b>View
        Family List</b></font></a>
        <p align="center"><img border="0" src="images/bullet2.gif"><a href="logout.jsp"><font color="#006600" face="Bookman Old Style" size="4">
<% } %>
<b>Logout</b></font></a></p>
        <p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
      </blockquote>
    </blockquote>
  </blockquote>
</blockquote>
<p align="center">&nbsp;</p>

</body>

</html>








