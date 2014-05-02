<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>


<%
try
{

	String userID = (String) session.getAttribute("UserID");
	String familyName = (String) session.getAttribute("FamilyName");
      String familyLetters = (String) session.getAttribute("Family");
	if (!("Erikson".equals(familyName) || "Wesson".equals(familyName)))
		response.sendRedirect("Error.jsp");
	char familyLetter = familyName.charAt(0);
	/*Cookie[] cookies = request.getCookies();
	boolean valid = false;
	for (int i=0; i<cookies.length; i++)
	{
		if ("Username".equals(cookies[i].getName()))
		{
			if (cookies[i].getValue() != null &&
				 cookies[i].getValue().length() > 0)
			{
				valid=true;
				break;
			}
		}
	}
	if (!valid)
		response.sendRedirect("sorry.htm");*/

	

%>


<%!

public String getCommentString(String inputString)
{	

/*	String outputString="";
	int charsPerLine = 50;
	int startIndex=0;
	int endIndex = 0;
	if(inputString.length() <= charsPerLine)	
		return inputString;

	while (endIndex < inputString.length())
	{
		endIndex += charsPerLine;		
		endIndex = Math.min(endIndex, inputString.length());		
		if (startIndex > 0)
			outputString += '\n';
		outputString += inputString.substring(startIndex, endIndex);
		startIndex=endIndex;
		
		
	}*/
	String outputString = "";
	int starturlIndex = inputString.indexOf("http://");
	if (starturlIndex != -1)
	{
		if (starturlIndex >= 1)
			outputString = inputString.substring(0, starturlIndex-1);
		int endurlIndex = inputString.indexOf(" ", starturlIndex);
		while (starturlIndex != -1)
		{
			endurlIndex = inputString.indexOf(" ", starturlIndex);
			if (endurlIndex == -1)
				endurlIndex = inputString.length();
			String toReplace = inputString.substring(starturlIndex, endurlIndex);

			outputString += "<a href=\""+toReplace+"\" target=\"_blank\">See Item</a>";
			starturlIndex = inputString.indexOf("http://", endurlIndex);
			if (starturlIndex > endurlIndex)
				outputString += inputString.substring(endurlIndex, starturlIndex);	
		}
		outputString += inputString.substring(endurlIndex, inputString.length());
		return outputString;
	}
	return inputString;
}

%>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<META HTTP-EQUIV="expires" CONTENT="0">
<title>Family Christmas List</title>
<meta name="Microsoft Border" content="none, default">
<body background="images/sidebar.gif">
<p align="center"><img border="0" src="images/merry.gif" width="394" height="198"></p>
<blockquote>
  <blockquote>
    <blockquote>
      <blockquote>


<p align="center">


<% 
	String tableName = "wishlist";
	String tableName2 = "auth";
	String family = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String contextPath=request.getContextPath();

	String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	String url = String.format("jdbc:mysql://%s:%s/christmas", host, port);
	java.sql.Connection conn = DriverManager.getConnection(url, "adminNiJqTgE", "bw2e2UQJmQhI");
  
	Statement stmt = conn.createStatement();

	
	userID = (String) session.getAttribute("UserID");
	if ("Rebecca".equals(userID) || "Anthony".equals(userID))
		family="Not In ('Rebecca', 'AJ', 'Debbie', 'Anthony')";
	else if ("AJ".equals(userID))
		family="Not In ('" + userID + "', 'Rebecca', 'Anthony')";
	else if  ("Eli".equals(userID)) 
	    	family="Not In ('Eli', 'Tim', 'Julie')" ; 
      else if  ("Cara Beth".equals(userID)) 
	    	family="Not In ('Cara Beth', 'Tim', 'Julie')" ; 
      else if  ("Daniel".equals(userID)) 
	    	family="Not In ('Daniel', 'Tim', 'Julie')" ; 

	else
	    	family="<> '" + userID + "'";
		

	if (family== null || family.length() < 2)
	     //Filter was lost - send them error page
	     response.sendRedirect("Error.jsp");
if ("Y".equals(session.getAttribute("FamilyList")))
for (int i=0; i<familyLetters.length(); i++)
{	
	String currentFamily = "" + familyLetters.charAt(i);
	String familyTitle = null;
	if (currentFamily.equals("E"))
		familyTitle = "Erikson";
	else if (currentFamily.equals("W"))
		familyTitle = "Wesson";

	String sqlString = "Select Distinct * From wishlist, auth WHERE wishlist.Name " + family + " And wishlist.Name = auth.Name And auth.Family Like '%" + currentFamily + "%' Order By wishlist.Name";
	 ResultSet rs = stmt.executeQuery(sqlString);
%>

<p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
<p align="center"><font face="Book Antiqua" color="#006600" size="5"><b><%= familyTitle %>
Christmas List</b></font></p>
<TABLE Border="1" cellpadding="3"  style="table-layout: fixed;">

<TR>
   <TD>
     <font face="Book Antiqua" color="#006600" <b> 
     <p align="center">  Name </font>
   </TD>
   <TD>
     <font face="Book Antiqua" color="#006600" <b> 
     <p align="center">  Item </font>
   </TD>
   <TD>
     <font face="Book Antiqua" color="#006600" <b> 
     <p align="center">  Comments </font>
   </TD>
   <TD>
     <font face="Book Antiqua" color="#006600" <b> 
     <p align="center">  Bought By </font>
   </TD>
   <TD style="width: 200px;">
     <font face="Book Antiqua" color="#006600" <b> 
     <p align="center">  Buyer Comments </font>
   </TD>
   <TD>
     <font face="Book Antiqua" color="#006600" <b> 
     <p align="center">  Update </font>
   </TD>
   <TD>
     <font face="Book Antiqua" color="#006600" <b> 
     <p align="center">  Last Updated By </font>
   </TD>

</TR>

<% while (rs.next()) {%>
 <TR>     
    <TD>
          <%= rs.getString("wishlist.Name").trim()%>     
     </TD>
     <TD>
          <%= rs.getString("Item").trim()%>     
     </TD>
     <TD style="width: 200px;">
           <%= getCommentString(rs.getString("Description").trim())%>     
     </TD>
    <TD>
          <%= rs.getString("Bought").trim()%>     
     </TD>
         <TD >
          <%= rs.getString("Comments").trim()%>     
     </TD>
     <TD>	<a href="EditThisRow.jsp?TableName=<%=tableName%>&amp;TableName2=<%=tableName2%>&amp;PKValue=<%= rs.getInt("id")%>">
		Update
	</a>     
     </TD>  
     <TD>
	 <%= rs.getString("lastupdated").trim()%>  
	</TD>   
</TR>
   <% } %>
</Table>
<% } %>
<p align="center">
<BR>
<%
conn.close();
stmt.close();
}
catch (Exception e)
{
	out.println(e.getMessage());
}
%>


 <img border="0" src="images/bullet2.gif" width="25" height="31"><b><a href="MyChristmasList.jsp"><font color="#006600" face="Bookman Old Style" size="4">View
My List</font></a></b><p align="center"><img border="0" src="images/bullet2.gif" width="25" height="31"><a href="logout.jsp"><font color="#006600" face="Bookman Old Style" size="4"><b>Logout</b></font></a></p>

<p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
      </blockquote>
    </blockquote>
  </blockquote>
</blockquote>

&nbsp;</body>

