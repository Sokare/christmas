
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<META HTTP-EQUIV="expires" CONTENT="0">
<title>Family Christmas List</title>
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta name="Microsoft Border" content="none, default">
<body background="images/sidebar.gif">
<p align="center"><img border="0" src="images/merry.gif" width="394" height="198"></p>
<blockquote>
  <blockquote>
    <blockquote>
      <blockquote>
<p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
<p align="center"><font face="Book Antiqua" color="#006600" size="5"><b>Users</b></font></p>


<p align="center">


<% 
Dim Family
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & Server.MapPath("db/vault.mdb")
Conn.open

SQL = "Select * From tblusers"
Set RSViewTable = Server.CreateObject("ADODB.Recordset")
RSViewTable.Open SQL, Conn, 2, 3, 1
%>

<TABLE Border="1" cellpadding="3">
<TR>
<% 'Set up the table headings%>
   <TD>
     <font face="Book Antiqua" color="#006600" <b> 
     <p align="center">  Name </font>
   </TD>
   <TD>
     <font face="Book Antiqua" color="#006600" <b> 
     <p align="center">  Password </font>
</TR>

<%' Write out the data %>
<% Do While Not RSViewTable.EOF%>
 <TR>
    <TD>
      <p align="center">
          <%= Trim(RSViewTable("UserID"))%>     
     </TD>
     <TD>
      <p align="center">
          <%= Trim(RSViewTable("Password"))%>     
     </TD>
</TR>
   <% RSViewTable.MoveNext
      Loop%>
</Table>
<p align="center">
<BR>
<%
RSViewTable.Close
Conn.Close
Set RSViewTable = Nothing
Set Conn = Nothing
%>


 <img border="0" src="images/bullet2.gif" width="25" height="31"><b><a href="MyChristmasList.asp"><font color="#006600" face="Bookman Old Style" size="4">View
My List</font></a></b><p align="center"><img border="0" src="images/bullet2.gif" width="25" height="31"><a href="logout.asp"><font color="#006600" face="Bookman Old Style" size="4"><b>Logout</b></font></a></p>

<p align="center"><img border="0" src="images/divider.gif" width="427" height="37"></p>
      </blockquote>
    </blockquote>
  </blockquote>
</blockquote>

&nbsp;</body>










