<%@ page contentType="text/html; charset=utf-8" %>
<jsp:useBean id="member" scope="request" class="chap08.member.MemberInfo"/>

<% 
	member.setId("madvirus");
	member.setName("조광호");
%>

<jsp:forward page="\useObject.jsp" />
