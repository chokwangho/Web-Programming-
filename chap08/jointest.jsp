<%@ page contentType="text/html; charset=utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="memberinfo" class="chap08.member.MemberInfo" scope="request"/>
<jsp:setProperty name="memberinfo" property="*"/>
<jsp:setProperty name="memberinfo" property="password" value="<%=memberinfo.getId()%>"/>

<html>
<head><title> 가입</title></head>
<body>

<table width="400" border="1" cellpadding="0" cellspacing="0" >
<tr>
	<td>아이디</td>
	<td><jsp:getProperty name="memberinfo" property="id" />
	<td>암호</td>
	<td><jsp:getProperty name="memberinfo" property="password"/>
</tr>

<tr>
	<td>이름</td>
	<td><jsp:getProperty name="memberinfo" property="name"/>
	<td>이메일</td>
	<td><jsp:getProperty name="memberinfo" property="email"/>
</tr>
</table>
</body>
</html>	