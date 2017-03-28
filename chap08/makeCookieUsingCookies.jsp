<%@ page contentType ="text/html; cahrset=utf-8" %>
<%@ page import="util.Cookies" %>

<% 
	response.addCookie(Cookies.createCookie("name","조광호"));
	response.addCookie(Cookies.createCookie("id","조광호2","/chap08",-1));
%>

<html>
<head><title> Cookie사용예 </title></head>
<body>

Cookies를 사용하여 쿠키 생성

</body>
</html>

