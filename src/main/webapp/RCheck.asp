<%if Request.Cookies("Username") <> "" then
     session("submitted")="false"
  else
     'send them back to login page
     Response.Redirect "Recipes.htm"
     Response.End
end if%>
