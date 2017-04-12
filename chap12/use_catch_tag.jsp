<%@ page contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head><title> catch 태그 </title></head>

<body>

<c:catch var="ex">
name 파라미터 값: <%= request.getParameter("name") %>
<% if(request.getParameter("name").equals("text")) {%>
${param.name}은 text입니다.
<%} %>
</c:catch>

<p>
<c:if test="${ex != null}">
${ex}
</c:if>



</body>
</html>