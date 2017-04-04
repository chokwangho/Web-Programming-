<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import="util.FormatUtil" %>

<%
	request.setAttribute("price",12345L);
%>

<html>
<head><title> EL함수 호출</title></head>
<body>

오늘은 <b> ${FormatUtil.number(price,'#,##0')} </b> 입니다.

</body>
</html>
