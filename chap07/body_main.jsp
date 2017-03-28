<%@ page contentType="text/html; charset=utf-8" %>
<% 
request.setCharacterEncoding("utf-8"); 
%>

<html>
<head><title> 바디 메인 </title></head>

<body>

include 전 name 파라미터 값: <%= request.getParameter("name") %>

<hr>

<jsp:include page="sub_info.jsp" flush="false">
	<jsp:param name="name" value="조광호"/>
</jsp:include>

<hr/>

include 후 name 파라미터 값: <%= request.getParameter("name") %>

</body>
</html>