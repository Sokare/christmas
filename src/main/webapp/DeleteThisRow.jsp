<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>

<%
try
{
	String userID=(String)session.getAttribute("UserID");
	String familyName = (String)request.getAttribute("FamilyName");
	String rowString = request.getParameter("PKValue");
	String sqlString = "Select * From wishlist";
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
		
	java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/christmas", "adminNiJqTgE", "bw2e2UQJmQhI");
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
      ResultSet rs = stmt.executeQuery(sqlString);
	
	int rowToDelete = Integer.parseInt(rowString);
	
      while (rs.next())
	{
	    if (rs.getInt("id") == rowToDelete)
	    {
               if (!(rs.getString("Name").trim().equals(userID.trim())))
	       	  	response.sendRedirect("PleaseStop.jsp");
	  
               if (!(rs.getString("Item").trim().equals("A lump of coal.")) )
	           rs.deleteRow(); 
	    	break;
          }
      }
	conn.close();
	stmt.close();	
	response.sendRedirect("MyChristmasList.jsp?TableName=wishlist");
}
catch (Exception e)
{
	out.println(e.getMessage());
}
%>


