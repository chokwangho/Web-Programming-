<%@ page contentType="text/html; charset=UTF-8"  %>
<%@ page import ="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 변경</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String memberId= request.getParameter("MEMBERID");
		String name = request.getParameter("NAME");
		
		int updateCount =0;  // ??
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn= null;
		Statement stmt = null;
		
		try{
			String JDBCDrive = "jdbc:mysql://localhost:3306/chap14?useUnicode=true&characterEncoding=utf-8";
			String dbUser = "jspexam";
			String dbPw = "jsppw";
			String query ="update member set NAME ='"+name+"'"+"where MEMBERID = '"+memberId+"'"; // ??
			
			conn = DriverManager.getConnection(JDBCDrive,dbUser,dbPw);
			stmt = conn.createStatement();
			updateCount = stmt.executeUpdate(query);
			
		}finally{
			if(stmt != null)try{stmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
			
		}
		
	 if(updateCount >0){
		
		 %>
	 <%= memberId %>의 이름을 <%=name %>으로 변경 
	 <% }else { %>
	 <%= memberId %> 아이디가 존재하지 않음
	 <% } %>
	 
</body>
</html>