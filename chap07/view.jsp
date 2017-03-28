<%@ page contentType="text/html; charset=utf-8"%>

<% 
	String code = request.getParameter("code"); 
	String viewPageURL= null;

	if(code.equals("A")){
		viewPageURL ="/viewPageURL/A.jsp";
	}else if(code.equals("B")){
		viewPageURL ="/viewPageURL/B.jsp";
	}else if(code.equals("C")){
		viewPageURL ="/viewPageURL/C.jsp";
	}

%>

<jsp:forward page="<%=viewPageURL %>"/>


	