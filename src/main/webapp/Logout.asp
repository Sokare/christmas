<%@ LANGUAGE="VBSCRIPT" %>
<%
       Response.Cookies("Username") = ""
       Session("UserID") = ""
       Session("FamilyName") = ""
       Response.Redirect "LoggedOut.htm"       
%>
