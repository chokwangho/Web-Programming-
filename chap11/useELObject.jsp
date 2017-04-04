<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page session ="true" %>

<html>
<head><title> EL 기본객체 예 </title></head>

<%
	request.setAttribute("name","조광호");
	session.setAttribute("id", "CKH");
	application.setAttribute("sex","man");
	request.setAttribute("code","jsp");	
%>
<body>

요청 URL : ${pageContext.request.requestURL} <br>
request의 name 속성: ${requestScope.name} <br>
session의 id 속성 : ${sessionScope.id}<br>
application의 sex속성 : ${applicationScope.sex}<br>
code 파라미터 : ${param.code} <br>

</body>
</html> 