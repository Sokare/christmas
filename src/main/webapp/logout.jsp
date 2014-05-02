<%
       response.addCookie(new Cookie("Username", "")); 
       session.setAttribute("UserID", "");
       session.setAttribute("FamilyName", "");
	 response.sendRedirect("LoggedOut.htm");
	
%>
