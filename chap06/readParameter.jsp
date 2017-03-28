<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page errorPage="/viewErrorMessage.jsp" %>

<html>
<head> <title> 에러 ㅅ지정 </title></head>

<body>

name= 파라미터 값:

<%= request.getParameter("name").toUpperCase() %>

</body>
</html>

