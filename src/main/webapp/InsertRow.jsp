<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>


<%
	try{
		       String userID=(String) session.getAttribute("UserID");

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String contextPath=request.getContextPath();

			String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	   		String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	   		String url = String.format("jdbc:mysql://%s:%s/christmas", host, port);
			java.sql.Connection conn = DriverManager.getConnection(url, "adminNiJqTgE", "bw2e2UQJmQhI");
		  	Statement stmt = conn.createStatement();
			
			String itemString = request.getParameter("Item");
			String commentString = request.getParameter("Comments");
			
			String doubleQuote = "\"";
			String doubledouble = "\"\"";
			//String singleQuote = "\'";
			//String doubleSingle ="\'\'";
			
			if (itemString != null)
			{
			    itemString = itemString.replaceAll(doubleQuote, doubledouble);
			//    itemString = itemString.replaceAll(singleQuote, doubleSingle);
               }
               if (commentString != null)
               {
			    commentString = commentString.replaceAll(doubleQuote, doubledouble);
			//    commentString = commentString.replaceAll(singleQuote, doubleSingle);
			}
			
		String updateString = "INSERT INTO wishlist VALUES (NULL, \""+userID+"\", \"" + itemString + "\", \"" + commentString + "\", \" \", \" \", \" \");";
		stmt.executeUpdate(updateString); 
			
			stmt.close();
		      conn.close();

			response.sendRedirect("MyChristmasList.jsp");
		      }
		      catch(Exception e)
		      {
		          out.println(e.getMessage());
		      }
	        
%>



