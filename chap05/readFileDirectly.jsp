<%@ page contentType ="text/html; charset= utf-8" %>
<%@ page import = "java.io.*" %>

<html>
<head><title> 절대경로 사용해서 자원읽기</title></head>

<body>

<% 
	char[] buff = new char[128]; //저장변수
	int len = -1; //길이 변수
	
	String filePath = "C:\\apache-tomcat-8.5.11\\webapps\\chap05\\notice.txt";
	//절대경로
	try(InputStreamReader fr = new InputStreamReader(new FileInputStream(filePath), "UTF-8")){
		while((len = fr.read(buff)) != -1){
			out.print(new String(buff, 0, len));
		}
	}catch(IOException e){
		out.println("익셉션발생"+e.getMessage());
	}
%>

</body>
</html>