<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import ="java.util.Date" %>
<%
	Date now= new Date(); 
%> <%--실행 코드 --%> 
<html>
<head><title> 현재시간</title></head>
<body>
현재시각 : 
<%= now %> <%-- 문자열 출력 코드 --%>
</body>
</html>
