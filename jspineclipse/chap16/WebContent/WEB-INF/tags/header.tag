<%-- title속성과 level속성을 통해서 제목과 제목 레벨 정보를 입력받아 알맞은 헤드 태그를 출력하는 기능을 제공한다. --%>

<%@ tag body-content="empty" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="title" required="true"%> <%-- title속성 은 필수 --%>
<%@ attribute name="level" type="java.lang.Integer" %> <%-- level속성의 타입은 Integer  --%>

<%
	String headStartTag = null;
	String headEndTag = null;
	if(level == null){
		headStartTag = "<h1>";
		headEndTag ="</h1>";
		}else if(level ==1){
		headStartTag = "<h1>";
		headEndTag ="</h1>";
		}else if(level ==2){
		headStartTag = "<h2>";
		headEndTag ="</h2>";
		}else if (level ==3){
		headStartTag = "<h3>";
		headEndTag ="</h3>";
		}
		%>
		
		<%=headStartTag %>
		${title}
		<%=headEndTag %>