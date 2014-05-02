<%@ LANGUAGE="VBSCRIPT" %>
<%
Family = Request.Form("FamilyName")
CurrentUser=Session("UserID")
OldPassword=Request.Form("Password")
NewPassword=Request.Form("NewPassword")

Dim oCONv, oRSu, strSQL
  Set oCONv = Server.CreateObject("ADODB.Connection")
  Set oRSu = Server.CreateObject("ADODB.Recordset")
  oCONv.Provider = "Microsoft.Jet.OLEDB.4.0"
  oCONv.ConnectionString = "Data Source=" & Server.MapPath("/eriksons/db/vault.mdb")
  strSQL = "SELECT * FROM tblUsers WHERE UserID='" & UserID & "' AND Password='" & OldPassword & "'"   
  oCONv.open 
  oRSu.open strSQL, oCONv, 2, 3, 1
  
if Request.Form("Password")<>oRSu("Password") then
   Response.Redirect "pw2sorry.htm"
end if

if Request.Form("NewPassword")=Request.Form("NewPassword2") then                               
  oRSu.MoveFirst
  oRSu.Update
  oRSu("Password")=Request.Form("NewPassword")
  Response.Redirect "pwok.htm"   
else
       Response.Redirect "pw2sorry.htm"
end if

'close the recordset
oRSu.close
set oRSu = nothing

'close the connection
oCONv.close
set oCONv = nothing
%>



