﻿<%@ page contentType = "text/html; charset= utf-8" %>
<%@ page session ="true" %>

<html>
<head> <title> 로그인 </title></head>


<% 
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	if(id.equals(password)){
		session.setAttribute("MEMBERID",id);
%>

<body>

로그인에 성공하였습니다.
<%= id %> 로 접근!

</body>
</html>

<% 
	}else {
	%>

<script>
aler("로그인에 실패하였습니다");
history.go(-1);
</script>
<%
	}
%>