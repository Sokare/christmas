<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%

try
		{
			String PKValue = request.getParameter("PKValue");
			String userID = (String) session.getAttribute("UserID");
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	   		String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	   		String url = String.format("jdbc:mysql://%s:%s/christmas", host, port);
			java.sql.Connection conn = DriverManager.getConnection(url, "adminNiJqTgE", "bw2e2UQJmQhI");
		  	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sqlString = "Select * From wishlist Where id = " + PKValue;
			ResultSet rs = stmt.executeQuery(sqlString);
	        	rs.first();
	        	if (!(rs.getString("Name").trim().equals(userID.trim())))
				response.sendRedirect("PleaseStop.jsp");
			else if (!(rs.getString("Item").trim().equals("A lump of coal.")) )
	        	{
				String itemText = request.getParameter("ItemText");
				String descriptionText = request.getParameter("DescriptionText");

				stmt.executeUpdate("Update wishlist Set Item=\'"+itemText+"\' where id="+PKValue);
				stmt.executeUpdate("Update wishlist Set Description=\'"+descriptionText+"\' where id="+PKValue);
			}
						
			conn.close();
			stmt.close();

			response.sendRedirect("MyChristmasList.jsp?TableName=" + request.getParameter("TableName"));

		}
		catch (Exception e)
		{
			out.println(e.getMessage());
		}%>

