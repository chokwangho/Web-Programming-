<%@ page contentType ="text/html; charset=utf-8" %>

<html>
<head><title> 클라이언트 서버 정보 알기</title> </head>
<body>

클라이언트IP = <%= request.getRemoteAddr() %> <br>
클라이언트가 전송한 요청정보의 길이 = <%= request.getContentLength() %> <br>
클라이언트가 요청 정보를 전송할떄 사용한 캐릭터 인코딩  = <%= request.getCharacterEncoding() %> <br>
클라이언트가 요청 정보를 전송할떄 사용한 컨텐츠 타입 =  = <%= request.getContentType() %> <br>
클라이언트가 요청한 프로토콜 =  = <%= request.getProtocol() %> <br>
웹 브라우저가 정보를 전송할 때 사용한 방식 =  = <%= request.getMethod() %> <br>
웹 브라우저가 요청한 URL에서 경로르 구한다. =  = <%= request.getRequestURL() %> <br>
JSP 페이지가 속한 웹 어플리케이션의 컨텍스트 경로  = <%= request.getContextPath() %> <br>
연결할떄 사용한 서버 이름  = <%= request.getServerName() %> <br>
서버가 실행중인 포트 번호  = <%= request.getServerPort() %> <br>

</body>
</html>