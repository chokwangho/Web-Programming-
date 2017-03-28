<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head><title> 두정수의 곲</title></head>
<body>
<%! 
	public int multiply(int a,int b){
	int mul=0;
	mul =a * b;

	return mul;
	}
%>
<% 
 int val1=3;
 int val2=5;
 int result = multiply(val1,val2);

%>

 <%=val1 %> * <%=val2%> = <%= result %>
</body>
</html>	