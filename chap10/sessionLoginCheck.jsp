<%@ page contentType = "text/html; charset= utf-8" %>
<%-- 로그인 여부는 session속성을 가져와서 속성이 있으면, 로그인 없으면 로그인 x --%>

<%
	String memberId = (String)session.getAttribute("MEMBERID");
	boolean login = memberId == null ? false : true ;
%>

<html>
<head><title> 로그인 여부 </title></head>

<body>
<%
	if(login){
%>

	로그인 성공
	아이디 : <%=memberId %> 로 로그인
<%
	}else {

%>
	로그인 하지 않은 상태
<% 
	}
%>

</body>
</html>
	