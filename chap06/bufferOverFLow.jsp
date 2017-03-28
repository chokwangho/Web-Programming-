<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page buffer="2kb" %>
<%@ page errorPage="/viewErrorMessage.jsp" %>

<html>
<head> <title> 버퍼 플러시 이후에러 발생 결과 </title></head>

<body>
<% for (int i=0; i<600; i++) { out.println(i); } %>

<%= 1/0 %>
</body>
</html>

