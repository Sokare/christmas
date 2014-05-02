
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>

<%

        String nextPage=null;
	  try 
	  {
	      Class.forName("com.mysql.jdbc.Driver").newInstance();
		String family = request.getParameter("FamilyName");
   		String contextPath=request.getContextPath();

		java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/christmas", "adminNiJqTgE", "bw2e2UQJmQhI");
	      Statement stmt = conn.createStatement();
	      String loginName= request.getParameter("UserID");
		String loginPassword =  request.getParameter("Password");
		String sqlString = "SELECT * FROM auth WHERE Name = '" + loginName + "' AND Password = '" + loginPassword  + "'";
            ResultSet rs = stmt.executeQuery(sqlString);
 

		 /*if (request.getSession().getAttribute("UserID") == null ||
			 !request.getParameter("UserID").equals("")) 
	   			   request.getSession().setAttribute("UserID", "");*/


         
	       if (rs != null && rs.next())
	       {
	           session.setAttribute("UserID", loginName);                         
	   	  // response.addCookie(new Cookie("Username", rs.getString("Name")));
	           request.getSession().setAttribute("Name", rs.getString("Name"));
	           request.getSession().setAttribute("FamilyName", family);
                 session.setAttribute("Family", rs.getString("Family"));
			session.setAttribute("FamilyList", rs.getString("Familylist"));

	           nextPage = "ok.jsp";   
	       }
	       else
	           nextPage = "sorry.htm";
             
              rs.close();
	        stmt.close();
	        conn.close();
	        
	   } 
	   catch (Exception e) 
         {
	       out.println(e.getMessage());
	   }

         response.sendRedirect(nextPage);
	   
%>
