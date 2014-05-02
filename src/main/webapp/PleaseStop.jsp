<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>

<%
       response.addCookie(new Cookie("Username", "")); 
       String userID=(String) session.getAttribute("UserID");
       session.setAttribute("UserID", "");
       session.setAttribute("FamilyName", "");
       
      if (userID != null && userID.length() > 0)
      {
	       try
	       {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String contextPath=request.getContextPath();

			String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	   		String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	   		String url = String.format("jdbc:mysql://%s:%s/christmas", host, port);
			java.sql.Connection conn = DriverManager.getConnection(url, "adminNiJqTgE", "bw2e2UQJmQhI");
		  	Statement stmt = conn.createStatement();

			String itemString = "A lump of coal.";
			String commentString = "I've been naughty.";

			String updateString = "INSERT INTO wishlist VALUES (NULL, \""+userID+"\", \"" + itemString + "\", \"" + commentString + "\", \" \", \" \", \" \");";
			stmt.executeUpdate(updateString); 

			stmt.close();
			conn.close();

		}
		catch(Exception e)
		{
		       out.println(e.getMessage());
		}
	}
       
%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Index</title>
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta name="Microsoft Border" content="none, default">
</head>

<body background="images/sidebar.gif">

<p align="center"><img border="0" src="images/merry.gif" width="394" height="198"></p>
<blockquote>
  <blockquote>
    <blockquote>
      <blockquote>
        <p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
        <p align="center"><font color="#426542" face="Book Antiqua">Your name has been added to the naughty list.&nbsp;&nbsp;</font></p>
        <p align="center">
        <applet code="fphover.class" codebase="./" width="186" height="24">
          <param name="color" value="#006600">
          <param name="hovercolor" value="#800000">
          <param name="effect" value="glow">
          <param name="fontsize" value="14">
          <param name="font" value="Helvetica">
          <param name="fontstyle" value="regular">
          <param name="textcolor" value="#D9CF1C">
          <param name="url" valuetype="ref" value="EChristmasLogin.jsp">
          <param name="text" value="Erikson Christmas List">
        </applet>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <applet code="fphover.class" codebase="./" width="186" height="24">
          <param name="color" value="#006600">
          <param name="hovercolor" value="#800000">
          <param name="effect" value="glow">
          <param name="fontsize" value="14">
          <param name="font" value="Helvetica">
          <param name="fontstyle" value="regular">
          <param name="textcolor" value="#D9CF1C">
          <param name="url" valuetype="ref" value="WChristmasLogin.jsp">
          <param name="text" value="Wesson Christmas List">
        </applet>
        </p>
        <p align="center">&nbsp;</p>
        <p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
      </blockquote>
    </blockquote>
  </blockquote>
</blockquote>
<p align="center"><a href="default.htm"><img border="0" src="images/home.gif" width="118" height="80"></a>
&nbsp; &nbsp; <img border="0" src="images/links.gif" width="118" height="80">&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<img border="0" src="images/email.gif" width="118" height="80"></p>
</body>

</html>
