<%@ page contentType ="text/html; charset=utf-8" %>

<html>
<head> <title> 에러 ㅅ지정 </title></head>

<body>

name= 파라미터 값:
<% try { %>
<%= request.getParameter("name").toUpperCase() %>
<% } catch(Exception e){ %>
 파라미터 값이 올바르지 않습니다.
<% } %>
</body>
</html>

