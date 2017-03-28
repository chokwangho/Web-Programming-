<%@ page contentType ="text/html; charset=utf-8" %>

<html>
<head><title> HTML 폼 예제</title> </head>
<body>

<form action="/chap02/viewParameter.jsp" method="get">
<%-- 입력한 데이터를 전달할 경로, 보내는 방식은 POST방식 --%>
이름: <input type="text" name="name" size="10" > <br>
주소: <input type="text" name="address" size="30" ><br>
좋아하는 동물 : 
	<input type="checkbox" name="pet" value="cat"> 고양이
	<input type="checkbox" name="pet" value="dog"> 개
	<input type="checkbox" name="pet" value="pig"> 돼지
<br>
<input type="submit" value="전송">
</form>
</body>
</html>