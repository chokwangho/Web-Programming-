<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="true" %>
<%@ page import ="java.util.Date" %>

<%@ page import ="java.text.SimpleDateFormat" %> <%--포멧--%>

<% 
	Date time= new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<html>
<head><title>세션정보</title></head>

<body>

세션ID = <%= session.getId() %>

<% 
	time.setTime(session.getCreationTime()); 

%>
<!--session의 함수를 받아와서 Date함수객체에 넣는다-->	
세션 생성 시간 : <%= formatter.format(time) %>
<!-- 넣고 변환 -->
<% 
	time.setTime(session.getLastAccessedTime());
%>
최근 접근 시간: <%= formatter.format(time) %>

</body>
</html>