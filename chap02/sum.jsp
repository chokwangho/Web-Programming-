<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head><title> 합 구하는 예제</title></head>
<body>
<% int i,sum1=0;
   for( i=1; i<11; i++){
	sum1 +=i;
	}
%>
1부터 10까지의 합은 <%= sum1 %> 
입니다.
<br>
<% int j,sum2=0;
   for( j=11; j<21; j++){
	sum2 +=j;
	}
%>
11부터 20까지의 합은 <%= sum2 %>
입니다.
</body>
</html>