<%--메시지 목록을 보여주는 JSP페이지 --%>
<%-- List.jsp는 GetMessageListService를 이용해서 MessageListView 객체를 구한뒤, MessageListView객체에서 저장된 값을 화면에 알맞게 출력한다.
 --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import= "guestbook.model.Message" %>
<%@ page import ="guestbook.service.MessageListView" %>
<%@ page import ="guestbook.service.GetMessageListService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String pageNumberStr = request.getParameter("page"); //page파라미터의 값을 이용해서 읽어올 페이지 번호 생성
	int pageNumber =1;
	if(pageNumberStr != null){
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	GetMessageListService messageListService = GetMessageListService.getInstance();
	MessageListView viewData = messageListService.getMessageList(pageNumber); // 지정한 페이지에 해당하는 메시지목록을 구한다.
		%>
		
<c:set var="viewData" value="<%=viewData %>"/><%--viewDate를 EL에서 사용할 수 있도록 변수로 지정한다. --%>
<html>
<head>

<title>방명록 메시지 목록</title>
</head>
<body>

<form action ="writeMessage.jsp" method="post"> <%--신규 메시지 입력 폼을 출력 --%>
이름 : <input type="text" name="guest_name"><br>
암호 : <input type="password" name="password"><br>
메시지:<textarea name="message" cols="30" rows="3"></textarea><br>
<input type="submit" value="메시지 남기기"/>
</form>
<hr>
<c:if test="${viewData.isEmpty()}"> <%-- 메시지 가 없을 경우 --%>
등록된 메시지가 없습니다.
</c:if>

<c:if test="${!viewData.isEmpty()}"> <%-- 메시지가 있을경우 <c:forEach>를 이요해서 메시지를 차례대로 출력한다 --%>
<table border="1">
	<c:forEach var="message" items="${viewData.messageList }">
	<tr>
		<td>
			메시지 번호 : ${message.id}<br/>
			손님 이름 : ${message.guest_name} <br/>
			메시지: ${message.message}<br/>
			<a href="confirmDeletion.jsp?messageId=${message.id }">[삭제하기]</a>
		</td>
	</tr>
	</c:forEach>
</table>

<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount }"> <%--전체 페이지 목록을 출력 --%>
<a href="list.jsp?page=${pageNum}">[${pageNum}]</a> 
</c:forEach>
</c:if>
</body>
</html>