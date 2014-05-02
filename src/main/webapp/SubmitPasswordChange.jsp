<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%

		try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/christmas", "adminNiJqTgE", "bw2e2UQJmQhI");
					Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					
					String password= request.getParameter("Password");
					String confirm = request.getParameter("Confirm");
					String current = request.getParameter("Current");
					String userID = (String) session.getAttribute("UserID");
					String sqlString = "Select * From auth Where Name ='" + userID+"'";
					ResultSet rs = stmt.executeQuery(sqlString);
		      		rs.first();

					if (userID != null && userID.length() > 1)
					{
						String realCurrentPassword = rs.getString("Password");
						if (current.equals(realCurrentPassword))
						{
							if (confirm != null && confirm.equals(password) )
							{
								stmt.executeUpdate("Update auth Set Password=\'"+password+"\' where Name='"+userID+"'" );
								response.sendRedirect("ok.jsp");
							}
							else
								response.sendRedirect("passConfirmNoMatch.jsp");
						}
						else
						{	
							response.sendRedirect("passChangeWrong.jsp");
						}
					}
					else
					{
						response.sendRedirect("sorry.htm");
					}

					conn.close();
					stmt.close();

					response.sendRedirect("MyChristmasList.jsp?TableName=" + request.getParameter("TableName"));

				}
				catch (Exception e)
				{
					out.println(e.getMessage());
				}%>

