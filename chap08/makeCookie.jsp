<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder" %>

<% Cookie cookie = new Cookie("name",URLEncoder.encode("조광호","utf-8"));
	Cookie cookie2 = new Cookie("name2",URLEncoder.encode("조광호2","utf-8"));
	
response.addCookie(cookie);
response.addCookie(cookie2);
%>

<html>
<head><title> 쿠키생성</title></head>

<body>
<%= cookie.getName() %> 쿠키의 값 ="<%= cookie.getValue() %>" <br>
<%= cookie2.getName() %> 쿠키의 값 ="<%= cookie2.getValue() %>"

</body>

</html>
