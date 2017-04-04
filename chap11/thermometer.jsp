<%@ page contentType ="text/html; charset=utf-8"%>
<%@ page import ="chap11.Thermometer"%>
<html>
<head><title> 온도변환예제 </title></head>

<body>

<%
Thermometer m = new Thermometer();
request.setAttribute("t",m);
%>

${t.setCelsius("서울",27.3)}
서울 온도 : 섭씨 ${t.getCelsius("서울")} / 화씨 ${t.changeF("서울")} <br>
정보 : ${t.getInfo()} <br>

</body>

</html>