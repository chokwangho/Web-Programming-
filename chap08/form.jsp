<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head><title> 양식 폼 </title></head>

<body>

<form action="\chap08\Join.jsp" method="post"/>
<tr>
	<td>아이디 </td>
	<td colspan="3"><input type="text" name="id" size="10"></td>
</tr>
<tr> 
	
	<td>이름</td>
	<td><input type="text" name="name" size="10"></td>

	<td>이메일</td>
	<td><input type="text" name="email" size="10"></td>
</tr>
<tr>
	<td colspan="4" align="center">
	<input type="submit" value="가입">
	</td>
</tr>
</table>
</form>
</body>
</html>