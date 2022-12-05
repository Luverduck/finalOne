<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 현재 시간 구하기 -->
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<c:set var="today">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
</c:set>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지게시판" name="title"/>
</jsp:include>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>