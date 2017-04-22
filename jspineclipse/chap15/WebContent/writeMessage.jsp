<%-- writeMessage.jsp는 전달받은 요청 파라미터를 이용해서 Message객체를 생성한뒤, WriteMessageService를 이용해서 메시지를 기록한다.<jsp:useBean> 액션 태그를 이용해서 사용자가 입력한 값을 Message객체에 저장하고, WriteMessageService.wirte() 메서드를 이용해서 Message객체의 값을 저장한다. --%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import ="guestbook.model.Message" %>
<%@ page import ="guestbook.service.WriteMessageService" %>
<%
	request.setCharacterEncoding("utf-8");
		%>
<jsp:useBean id="message" class="guestbook.model.Message" >  <%-- message 객체를 생성하고 요청 파라미터의 값을 Message객체의 프로퍼티에 저장한다. --%>
	<jsp:setProperty name ="message" property="*"/>
	</jsp:useBean>
<%
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(message); //write()메서드를 실행해서 사용자가 입력한 정보를 저장한다.
%>	

<html>
<head>
<title>방명록 메시지 남김</title>
</head>
<body>
방명록에 메시지를 남겼습니다.
<br/>
<a href="list.jsp">[목록보기]</a> <%-- 메서드가 정상적으로 실행되면 메시지를 남겼다는 안내문구와 목록화면으로 이동할 수 있는 링크를 출력한다. --%>
</body>
</html>