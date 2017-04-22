<%-- 동적 속성을 사용하는 태그 파일의 예제 코드이다. --%>

<%@ tag body-content ="empty" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ tag dynamic-attributes="optionMap"%> <%-- 동적 속성을 저장할 EL변수의 이름을 optionMap으로 설정한다. --%>
<%@ attribute name="name" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<select name="${name }">
	<c:forEach items="${optionMap}" var="option">
	<option value="%{option.key}">${option.value}</option> <%-- optionMap에 저장된 속성의 이름과 값을 사용한다 --%>
	</c:forEach>
</select>