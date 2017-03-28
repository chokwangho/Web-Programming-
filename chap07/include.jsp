<%@ page contentType ="text/html; charset=utf-8" %>
<html>
<head><title> include </title></head>
<body>
<% int number =10; %>

<%@ include file="/includee.jspf" %>

공통변수 DATAFOLDER - <%= datafolder %>

</body>
</html>