<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import ="java.util.Calendar" %>

<html>
<head><title> 년,월,일 </title></head>

<%
 
Calendar cal = Calendar.getInstance(); 
%><%-- new 생성자를 안쓰네 --%>
<body>

오늘은
<%= cal.get(Calendar.YEAR) %> 년
<%= cal.get(Calendar.MONTH)+1 %> 월
<%= cal.get(Calendar.DATE) %> 일
입니다.
</body>
</html>