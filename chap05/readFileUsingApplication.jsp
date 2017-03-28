<%@ page contentType ="text/html; charset= utf-8" %>
<%@ page import = "java.io.*" %>

<html>
<head><title> application 기본객체를 사용해서 자원 이용</title></head>

<body>
<% 
	String resourcePath = "\\chap05\\notice.txt";
%>
자원의 실제 경로 : 
<%= application.getRealPath(resourcePath) %>
<br>
-----------------<br>
<%=resourcePath %> 의 내용<br>
-----------------<br>
<%

char[] buff= new char[128];
int len=-1;

	try(InputStreamReader br = new InputStreamReader(
		application.getResourceAsStream(resourcePath),"UTF-8")){
	while((len = br.read(buff)) != -1){
		out.print(new String(buff, 0, len));
		}
	}catch(IOException e){
		out.println("익셉션발생"+e.getMessage());
	}
%>

</body>
</html>