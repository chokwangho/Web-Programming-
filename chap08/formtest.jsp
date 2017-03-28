<%@ page contentType ="text/html; charset= utf-8" %>
<html>
<head><title> 입력 폼 </title></head>

<body>
<form action="\chap08\jointest.jsp" method="post">
<table border="1" cellpadding="0" cellspacing="0">
<tr>
<td>아이디</td>
<td colspan="3"><input type="text" name="id" size="10"></td>
</tr>
<tr>
<td>이름</td>
<td><input type="text" name="name"></td>
<td>이메일</td>
<td><input tpye="text" name="email"></td>
</tr>
<tr>
<td colspan="4" align="center"><input type="submit" value="회원가입"></td>
</tr>
</table>
</form>
</body>
</html>