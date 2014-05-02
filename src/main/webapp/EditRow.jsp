<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%

try
	{
		String PKValue = request.getParameter("PKValue");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
   		String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
   		String url = String.format("jdbc:mysql://%s:%s/christmas", host, port);
		java.sql.Connection conn = DriverManager.getConnection(url, "adminNiJqTgE", "bw2e2UQJmQhI");
	  	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sqlString = "Select * From wishlist Where id = " + PKValue;
		ResultSet rs = stmt.executeQuery(sqlString);
        	int columnCount = rs.getMetaData().getColumnCount();
        	ArrayList columnNames = new ArrayList();
        	String userID = (String) session.getAttribute("UserID");

		for (int i=1; i<columnCount + 1; i++)
		{
			columnNames.add(rs.getMetaData().getColumnName(i));
		}	
		for (int i=0; i<columnCount; i++)
		{
			String columnName = (String) columnNames.get(i);
			String data = request.getParameter("Data"+(i+1));
			
		    if (columnName.equals("Bought") || columnName.equals("Comments")  )
		    {
		  		stmt.executeUpdate("Update wishlist Set "+columnName+"=\'"+data+"\' where id="+PKValue);
			}
		      
		      
			/*if (!("id".equals(rs.getMetaData().getColumnName(i))))
		      {
		      	
		      	out.println(data);
				if (data != null && data.length() > 0)
		      	{
					rs.updateString(rs.getMetaData().getColumnName(i), data);
				}
			}*/
		}
		stmt.executeUpdate("Update wishlist Set lastupdated=\'"+userID+"\' where id="+PKValue);
		conn.close();
		stmt.close();

		response.sendRedirect("ChristmasList.jsp?TableName=" + request.getParameter("TableName"));

	}
	catch (Exception e)
	{
		out.println(e.getMessage());
	}
%>

