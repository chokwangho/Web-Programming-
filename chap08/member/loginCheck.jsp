<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import ="util.Cookies" %>
<%
	Cookies cookies= new Cookies(request);
%>
<html>
<head><title> 로그인 여부</title><head>

<body>

<%
	if(cookies.exists("AUTH")){
%>

아이디 "<%=cookies.getValue("AUTH") %>" 로그인 한상태

<%
	}else{
%>

로그인 하지않은 상태
<%
	}
%>
</body>
</html>