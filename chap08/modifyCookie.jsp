<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "java.net.URLEncoder" %>

<html>
<head> <title> 수정 쿠키</title></head>

<%
	Cookie [] cookies=request.getCookies();
	if(cookies !=null && cookies.length> 0) {
	for(int i=0; i<cookies.length; i++) {
	 if(cookies[i].getName().equals("name")){
	Cookie cookie = new Cookie("name",URLEncoder.encode("JSp프로그래밍","utf-8"));
	response.addCookie(cookie);
	 		}
	if(cookies[i].getName().equals("name2")){
	Cookie cookie2 = new Cookie("name2","");
	cookie2.setMaxAge(0);
	response.addCookie(cookie2);
	}
}}
%>
<body>
name 쿠키의 값을 변경합니다
name2 쿠기의 값을 제거합니다.

</body>
</html>