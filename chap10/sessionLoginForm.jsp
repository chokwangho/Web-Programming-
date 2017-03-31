<%@ page contentType ="text/html; charset= utf-8" %>
<html>

<head><title> session로그인 양식 </title></head>

<form action = "<%= request.getContextPath()%>\sessionLogin.jsp" method="post">


<body>

아이디:<input type="text" name="id" size="10" >
암호 :<input type="password" name="password" size="10" >

<input type= "submit" value="로그인" >

</form>
</body>
</html>