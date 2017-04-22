<%-- 암호를 삭제할 대 필ㅇ한 암호를 입력받는 폼을 제공한다. 삭제할 메시지 번호를 설정하고, 메시지를 기록할 대 입력한 암호를 입력받는다. --%>

<%@ page contentType="text/html; charset=UTF-8" %><html>
<head>

<title>방명록 메시지 삭제 확인</title>
</head>
<body>

<form action="deleteMessage.jsp" method="post">
<input type="hidden" name="messageId" value="${param.messageId }">
메시지를 삭제하려면 암호를 입력하시오:<br>
암호 :<input type="password" name="password" ><br>
<input type="submit" value="메시지 삭제하기">
</form>
</body>
</html>