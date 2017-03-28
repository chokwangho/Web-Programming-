<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import ="java.util.Date, java.util.Calendar" %>

<html>
<head><title> 예제반복학습 </title></head>
<body>
<% Date now = new Date(); %>
1. 지금 현재 시간은? <%= now %>
<% Calendar cal = Calendar.getInstance(); %>
<br>
2. 지금은 몇월 몇일인가? 
<%= cal.get(Calendar.YEAR) %> 년
<%= cal.get(Calendar.MONTH)+1 %> 월
<%= cal.get(Calendar.DATE) %> 일
<br>
3. 1부터 10까지의 합은?
<% int i,sum=0; 
	for(i=1; i<11; i++){
	sum+=i;
	} %>
<%= sum %>
</body>
</html>
