<%@ Language=VBScript %>
<%

Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & Server.MapPath("/db/vault.mdb")
Conn.open

TableName="tblUsers"
TotalNumberofFields = Request("FieldCount")+1

Set RSAddRow = Server.CreateObject("ADODB.Recordset")
RSAddRow.Open TableName, Conn, 2, 3, 2
RSAddRow.AddNew

RSAddRow("UserID")=Request.Form("User")
RSAddRow("Password")=Request.Form("Password")

RSAddRow.Update
RSAddRow.Close
Set RSAddRow = Nothing

Set Conn = Nothing


Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & Server.MapPath("/db/vault.mdb")
Conn.open

TableName="FamilyMembers"
TotalNumberofFields = Request("FieldCount")+1

Set RSAddRow = Server.CreateObject("ADODB.Recordset")
RSAddRow.Open TableName, Conn, 2, 3, 2
RSAddRow.AddNew

RSAddRow("Name")=Request.Form("User")
RSAddRow("Family")=Request.Form("FamilyName")

RSAddRow.Update
RSAddRow.Close
Set RSAddRow = Nothing

Set Conn = Nothing


Response.Redirect("show.asp")
%>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta name="Microsoft Border" content="none, default">
</head>



