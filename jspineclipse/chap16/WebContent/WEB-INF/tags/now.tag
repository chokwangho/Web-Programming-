<%@ tag  body-content="empty" pageEncoding="UTF-8"%> <%--몸체 내용의 종류 설정=empty(주어 태그 파일이 나타내는 커스텀 태그의 몸체 내용이 없다), pageEncoding 설정 --%>
<%@ tag import ="java.util.Calendar" %>

<%
	Calendar cal = Calendar.getInstance();
	%>
	
	<%= cal.get(Calendar.YEAR)%> 년
	<%= cal.get(Calendar.MONTH)+1%> 월
	<%= cal.get(Calendar.DATE)%> 일	