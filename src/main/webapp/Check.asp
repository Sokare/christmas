<%if Request.Cookies("Username") <> "" then
     session("submitted")="false"
  else
     'send them back to login page
     Response.Redirect "Family.htm"
     Response.End
end if%>
