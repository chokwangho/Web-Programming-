<%@ page contentType ="text/html; charset=utf-8" %>

<html>
<head> <title> 서버 정보 </title> </head>

<body>

 서버 정보 : <%= application.getServerInfo() >
 서버 정보 메이저 버전: <%= application.getMajorVersion() >
 서버 정보 마니어 버전: <%= application.getMinorVersion() >

</body>
</html>