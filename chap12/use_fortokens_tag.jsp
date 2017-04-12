<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title> forTokens태그 </title></head>

<body>

콤마와 점을 구분자로 사용 :<br>

<c:forTokens var="tokens" items="빨강,주황,노란색,초록,파랑.검정.회색" delims=",.">
${tokens}
</c:forTokens>

</body>
</html>