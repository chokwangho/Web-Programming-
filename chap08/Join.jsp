<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="chap08.member.MemberInfo" />
<jsp:setProperty name="member" property="*"/>
<jsp:setProperty name="member" property="password" value="<%=member.getId()%>"/>

<html>
<head><title> 양식 폼 </title></head>

<body>

<table width="400" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td> 아이디 </td>
	<td><jsp:getProperty name="member" property="id"/></td>
	<td>암호</td>
	<td><jsp:getProperty name="member" property="password"/></td>
</tr>
<tr>
	<td> 이름</td>
	<td><jsp:getProperty name="member" property="name"/></td>
	<td>ㅇ메일</td>
	<td><jsp:getProperty name="member" property="email"/></td>
</tr>
</table>

</body>
</html>